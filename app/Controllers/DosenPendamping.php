<?php

namespace App\Controllers;

class DosenPendamping extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'dosen_pendamping';
        $this->model_name  = str_replace(' ', '', ucwords(str_replace('_', ' ', $this->base_name)));
        $this->upload_path = dirUpload() . $this->base_name . '/';
    }

    /*--------------------------------------------------------------
    # Front-End
    --------------------------------------------------------------*/
    public function main()
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data'   => $this->base_api . $query,
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/main', $data);
        return view('dashboard/header', $view);
    }

    public function new()
    {
        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => 'Add ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new', $data);
        return view('dashboard/header', $view);
    }

    public function edit($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'base_name'  => $this->base_name,
            'data'       => $find_data,
            'title'      => 'Edit ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/edit', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select);
        if (in_array(userSession('id'), [1, 17])) {
            // 
        } elseif (in_array(8, userSession('id_roles')) || userSession('id_role') == 5) {
            $base_query->where('id_program_studi', userSession('id_program_studi'));
        } elseif (userSession('id_role') == 4 && !in_array(8, userSession('id_roles'))) {
            $base_query->where('id_dosen_1', userSession('id'))
            ->orWhere('id_dosen_2', userSession('id'));
        }
        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total = $base_query->countAllResults(false);

        // Datatables
        $columns = array_column($this->request->getVar('columns') ?? [], 'name');
        $search = $this->request->getVar('search')['value'] ?? null;
        dataTablesSearch($columns, $search, $select, $base_query);

        $order = $this->request->getVar('order')[0] ?? null;
        if (isset($order['column'], $order['dir']) && !empty($columns[$order['column']])) {
            $base_query->orderBy($columns[$order['column']], $order['dir'] === 'desc' ? 'desc' : 'asc');
        } else {
            $base_query->orderBy('id DESC');
        }
        // End | Datatables

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->findAll($limit, $offset);

        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['dokumen'] = $v['dokumen'] ? webFile('', $this->base_name, $v['dokumen'], $v['updated_at']) : '';
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at'])));
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
        ]);
    }

    public function create()
    {
        $rules = [
            'judul'  => 'required',
            'dokumen' => 'max_size[dokumen,1024]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
            'tautan' => 'permit_empty|valid_url_strict',
        ];
        if (! $this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $dokumen = $this->request->getFile('dokumen');
        if ($dokumen->isValid()) {
            $filename_dokumen = $dokumen->getRandomName();
            $dokumen->move($this->upload_path, $filename_dokumen);
        } else {
            $filename_dokumen = '';
        }

        $dosen_1 = model('Users')->find($this->request->getVar('dosen_1'));
        $dosen_2 = model('Users')->find($this->request->getVar('dosen_2'));
        $data = [
            'id_dosen_1' => $dosen_1['id'] ?? '',
            'nama_dosen_1' => $dosen_1['nama'] ?? '',
            'id_dosen_2' => $dosen_2['id'] ?? '',
            'nama_dosen_2' => $dosen_2['nama'] ?? '',

            'id_program_studi'        => userSession('id_program_studi'),
            'jenjang_program_studi'   => userSession('jenjang_program_studi'),
            'nama_program_studi'      => userSession('nama_program_studi'),
            'singkatan_program_studi' => userSession('singkatan_program_studi'),

            'judul'  => $this->request->getVar('judul'),
            'tautan' => $this->request->getVar('tautan'),
            'dokumen' => $filename_dokumen,
            'created_by' => userSession('id'),
        ];

        model($this->model_name)->insert($data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil ditambahkan',
            'route'   => $this->base_route,
        ]);
    }

    public function update($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'judul'  => 'required',
            'dokumen' => 'permit_empty|max_size[dokumen,1024]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
            'tautan' => 'permit_empty|valid_url_strict',
        ];
        if (! $this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $dokumen = $this->request->getFile('dokumen');
        if ($dokumen && $dokumen->isValid()) {
            if (is_file($this->upload_path . $find_data['dokumen'])) unlink($this->upload_path . $find_data['dokumen']);
            $filename_dokumen = $dokumen->getRandomName();
            $dokumen->move($this->upload_path, $filename_dokumen);
        } else {
            $filename_dokumen = $find_data['dokumen'];
        }

        $dosen_1 = model('Users')->find($this->request->getVar('dosen_1'));
        $dosen_2 = model('Users')->find($this->request->getVar('dosen_2'));
        $data = [
            'id_dosen_1' => $dosen_1['id'] ?? '',
            'nama_dosen_1' => $dosen_1['nama'] ?? '',
            'id_dosen_2' => $dosen_2['id'] ?? '',
            'nama_dosen_2' => $dosen_2['nama'] ?? '',

            'judul'  => $this->request->getVar('judul'),
            'tautan' => $this->request->getVar('tautan'),
            'dokumen' => $filename_dokumen,
            'updated_by' => userSession('id'),
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function delete($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $dokumen = $this->upload_path . $find_data['dokumen'];
        if (is_file($dokumen)) unlink($dokumen);

        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }
}
