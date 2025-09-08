<?php

namespace App\Controllers;

class StatusMahasiswa extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'status_mahasiswa';
        $this->model_name  = str_replace(' ', '', ucwords(str_replace('_', ' ', $this->base_name)));
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

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select);
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
        }
        // End | Datatables

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->findAll($limit, $offset);

        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
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
            'mahasiswa'      => 'required',
            'status'         => 'required',
            'tahun_akademik' => 'required',
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
        $mahasiswa = model('Users')->find($this->request->getVar('mahasiswa'));
        $tahun_akademik = model('TahunAkademik')->find($this->request->getVar('tahun_akademik'));
        $data = [
            'id_mahasiswa'              => $mahasiswa['id'],
            'nama_mahasiswa'            => $mahasiswa['nama'],
            'nomor_identitas_mahasiswa' => $mahasiswa['nomor_identitas'],
            'id_program_studi'          => $mahasiswa['id_program_studi'],
            'jenjang_program_studi'     => $mahasiswa['jenjang_program_studi'],
            'nama_program_studi'        => $mahasiswa['nama_program_studi'],
            'singkatan_program_studi'   => $mahasiswa['singkatan_program_studi'],
            'status'                    => $this->request->getVar('status'),
            'id_tahun_akademik'         => $tahun_akademik['id'],
            'tahun_akademik'            => $tahun_akademik['tahun_akademik'],
            'tipe_tahun_akademik'       => $tahun_akademik['tipe'],
        ];
        model($this->model_name)->insert($data);

        model('Users')->update($mahasiswa['id'], [
            'status' => $this->request->getVar('status'),
        ]);

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
            'status' => 'required',
            'tahun_akademik_selesai_cuti' => 'required',
        ];
        if (! $this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        $status = $this->request->getVar('status');
        if ($status == 'Cuti') {
            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Silakan ubah status Aktif atau DO!',
            ]);
        }

        // Lolos Validasi
        $tahun_akademik = model('TahunAkademik')->find($this->request->getVar('tahun_akademik_selesai_cuti'));
        $data = [
            'status' => $status,
            'id_tahun_akademik_selesai_cuti'   => $tahun_akademik['id'],
            'tahun_akademik_selesai_cuti'      => $tahun_akademik['tahun_akademik'],
            'tipe_tahun_akademik_selesai_cuti' => $tahun_akademik['tipe'],
        ];
        model($this->model_name)->update($id, $data);

        model('Users')->update($find_data['id_mahasiswa'], [
            'status' => $this->request->getVar('status'),
        ]);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }
}
