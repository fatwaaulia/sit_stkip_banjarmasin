<?php

namespace App\Controllers;

class Pertanyaan extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'pertanyaan';
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
            'title'    => 'Add ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new', $data);
        return view('dashboard/header', $view);
    }

    public function edit($id = null)
    {
        if (userSession('id_role') == 1) {
            $find_data = model($this->model_name)->find($id);
        } else {
            $find_data = model($this->model_name)->where([
                'id'         => $id,
                'created_by' => userSession('id'),
            ])->first();
        }

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
        $select          = ['*'];
        $base_query      = model($this->model_name)->select($select);
        $limit           = (int)$this->request->getVar('length');
        $offset          = (int)$this->request->getVar('start');
        $records_total   = $base_query->countAllResults(false);
        $array_query_key = ['created_by'];

        if (array_intersect(array_keys($_GET), $array_query_key)) {
            $get_created_by = $this->request->getVar('created_by');
            if ($get_created_by) {
                $base_query->where('created_by', $get_created_by);
            }
        }

        // Datatables
        $columns = array_column($this->request->getVar('columns') ?? [], 'name');
        $search = $this->request->getVar('search')['value'] ?? null;
        dataTablesSearch($columns, $search, $select, $base_query);

        $order = $this->request->getVar('order')[0] ?? null;
        if (isset($order['column'], $order['dir']) && !empty($columns[$order['column']])) {
            $base_query->orderBy($columns[$order['column']], $order['dir'] === 'desc' ? 'desc' : 'asc');
        } else {
            $base_query->orderBy('created_at DESC');
        }
        // End | Datatables

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->limit($limit, $offset)->get()->getResultArray();

        foreach ($data as $key => $v) {
            $jumlah_responden = model('Responden')->where('id_pertanyaan', $v['id'])->countAllResults();
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['jumlah_responden'] = $jumlah_responden;
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
            'judul' => 'required',
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
        $judul = $this->request->getVar('judul');
        $total_judul_yang_sama = model($this->model_name)->select('judul')->where('judul', $judul)->countAllResults();
        if ($total_judul_yang_sama == 0) {
            $slug = url_title($judul, '-', true);
        } else {
            $random_string = random_string('alpha', 5);
            $slug = url_title($judul . '-' . $random_string, '-', true);
        }

        $pertanyaan = $this->request->getVar('pertanyaan');
        $json_pertanyaan = [];
        foreach ($pertanyaan as $key => $v) {
            if (empty($v)) continue;
            $json_pertanyaan[$key+1] = [
                'pertanyaan' => $v,
            ];
        }

        $data = [
            'judul' => $judul,
            'slug'  => $slug,
            'json_pertanyaan' => json_encode($json_pertanyaan),
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
        $rules = [
            'judul' => 'required',
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
        $pertanyaan = $this->request->getVar('pertanyaan');
        $json_pertanyaan = [];
        foreach ($pertanyaan as $key => $v) {
            if (empty($v)) continue;
            $json_pertanyaan[$key+1] = [
                'pertanyaan' => trim($v),
            ];
        }

        $data = [
            'judul' => $this->request->getVar('judul'),
            'json_pertanyaan' => json_encode($json_pertanyaan),
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
        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }
}
