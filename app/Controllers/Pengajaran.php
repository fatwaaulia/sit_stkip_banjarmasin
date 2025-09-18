<?php

namespace App\Controllers;

class Pengajaran extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'pengajaran';
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

        if (in_array(userSession('id'), [1, 17, 7])) {
            $get_dosen = $this->request->getVar('dosen');
            if ($get_dosen) {
                $base_query->where('created_by', $get_dosen);
            } else {
                // 
            }
        } elseif (in_array(8, userSession('id_roles'))) { // Kaprodi
            $get_dosen = $this->request->getVar('dosen');
            if ($get_dosen) {
                $base_query->where('created_by', $get_dosen);
            } else {
                $base_query->where('id_program_studi', userSession('id_program_studi'));
            }
        } else if (userSession('id_role') == 4) { // Dosen
            $base_query->where('created_by', userSession('id'));
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

        // $users = model('Users')->select(['id', 'nama'])->whereIn('id_role', [4])->findAll();
        // $nama_user_by_id = array_column($users, 'nama', 'id');
        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['jam_mulai'] = date('H:i', strtotime(toUserTime($v['jam_mulai'])));
            $data[$key]['jam_selesai'] = date('H:i', strtotime(toUserTime($v['jam_selesai'])));
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at'])));
            $data[$key]['dokumen'] = $v['dokumen'] ? webFile('', $this->base_name, $v['dokumen'], $v['updated_at']) : '';
            // $data[$key]['created_by_nama'] = $nama_user_by_id[$v['created_by']] ?? '-';
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
            'tahun_akademik'  => 'required',
            'kode'  => 'required',
            'nama_mata_kuliah'  => 'required',
            'sks'  => 'required',
            'hari'  => 'required',
            'jam_mulai'  => 'required',
            'jam_selesai'  => 'required',
            'ruangan'  => 'required',
            'tautan' => 'permit_empty|valid_url_strict',
            'dokumen' => 'permit_empty|max_size[dokumen,1024]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
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

        $tahun_akademik = str_replace('-', '/', $this->request->getVar('tahun_akademik'));
        $data = [
            'tautan' => $this->request->getVar('tautan'),
            'dokumen' => $filename_dokumen,

            'kode'  => $this->request->getVar('kode'),
            'nama_mata_kuliah'  => $this->request->getVar('nama_mata_kuliah'),
            'sks'  => $this->request->getVar('sks'),
            'hari'  => $this->request->getVar('hari'),
            'jam_mulai'  => toSystemTime($this->request->getVar('jam_mulai')),
            'jam_selesai'  => toSystemTime($this->request->getVar('jam_selesai')),
            'ruangan'  => $this->request->getVar('ruangan'),
            'id_program_studi'        => userSession('id_program_studi'),
            'jenjang_program_studi'   => userSession('jenjang_program_studi'),
            'nama_program_studi'      => userSession('nama_program_studi'),
            'singkatan_program_studi' => userSession('singkatan_program_studi'),
            'tahun_akademik' => $tahun_akademik,
            'dosen_pengampu' => userSession('nama'),
            'created_by' => userSession('id'),
        ];

        model($this->model_name)->insert($data);

        $query_kaprodi = '';
        if (in_array(8, userSession('id_roles'))) {
            $query_kaprodi = '?dosen=' . userSession('id');
        }
        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil ditambahkan',
            'route'   => $this->base_route . $query_kaprodi,
        ]);
    }

    public function update($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'kode'  => 'required',
            'nama_mata_kuliah'  => 'required',
            'sks'  => 'required',
            'hari'  => 'required',
            'jam_mulai'  => 'required',
            'jam_selesai'  => 'required',
            'ruangan'  => 'required',
            'tautan' => 'permit_empty|valid_url_strict',
            'dokumen' => 'permit_empty|max_size[dokumen,1024]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
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

        $data = [
            'tautan' => $this->request->getVar('tautan'),
            'dokumen' => $filename_dokumen,

            'kode'  => $this->request->getVar('kode'),
            'nama_mata_kuliah'  => $this->request->getVar('nama_mata_kuliah'),
            'sks'  => $this->request->getVar('sks'),
            'hari'  => $this->request->getVar('hari'),
            'jam_mulai'  => toSystemTime($this->request->getVar('jam_mulai')),
            'jam_selesai'  => toSystemTime($this->request->getVar('jam_selesai')),
            'ruangan'  => $this->request->getVar('ruangan'),
            'updated_by' => userSession('id'),
        ];

        model($this->model_name)->update($id, $data);

        $query_kaprodi = '';
        if (in_array(8, userSession('id_roles'))) {
            $query_kaprodi = '?dosen=' . userSession('id');
        }
        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route . $query_kaprodi,
        ]);
    }

    public function delete($id = null)
    {
        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }
}
