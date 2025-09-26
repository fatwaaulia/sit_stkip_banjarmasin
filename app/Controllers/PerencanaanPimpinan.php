<?php

namespace App\Controllers;

class PerencanaanPimpinan extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'perencanaan_pimpinan';
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

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select);
        if (userSession('id_role') == 4 && empty(userSession('multi_role'))) {
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


        $created_by = model('Users')->select(['id', 'nama'])->findAll();
        $created_by_by_id = array_column($created_by, 'nama', 'id');
        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['dokumen'] = $v['dokumen'] ? webFile('', $this->base_name, $v['dokumen'], $v['updated_at']) : '';
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at'])));
            $data[$key]['created_by'] = $created_by_by_id[$v['created_by']] ?? '-';
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
            'kategori' => 'required',
            'judul'  => 'required',
            'dokumen' => 'max_size[dokumen,10240]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
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

        $data = [
            'kategori' => $this->request->getVar('kategori'),
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
            'kategori'  => 'required',
            'judul'  => 'required',
            'dokumen' => 'permit_empty|max_size[dokumen,10240]|ext_in[dokumen,pdf]|mime_in[dokumen,application/pdf]',
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

        $data = [
            'kategori' => $this->request->getVar('kategori'),
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
