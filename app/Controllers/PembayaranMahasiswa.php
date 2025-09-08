<?php

namespace App\Controllers;

class PembayaranMahasiswa extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'pembayaran_mahasiswa';
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
        if (userSession('id_role') == 5) {
            $view['content'] = view($this->base_name . '/mahasiswa', $data);
        } else {
            $view['content'] = view($this->base_name . '/main', $data);
        }
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select);
        // $limit      = (int)$this->request->getVar('length');
        // $offset     = (int)$this->request->getVar('start');
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
        // $data       = $base_query->findAll($limit, $offset);
        $data       = $base_query->findAll();

        foreach ($data as $key => $v) {
            // $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['biaya'] = formatRupiah($v['biaya']);
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
            'tanggal_bayar' => 'required',
            'jumlah_bayar'  => 'required',
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
        $tagihan_mahasiswa = model('TagihanMahasiswa')->find($this->request->getVar('id_tagihan_mahasiswa'));
        $mahasiswa = model('Users')->find($this->request->getVar('id_mahasiswa'));

        $pembayaran_mahasiswa = model('PembayaranMahasiswa')
        ->where([
            'id_tagihan_mahasiswa' => $tagihan_mahasiswa['id'],
            'id_mahasiswa' => $mahasiswa['id'],
        ])->countAllResults();

        $tahap = $pembayaran_mahasiswa + 1;

        $data = [
            'id_tagihan_mahasiswa'    => $tagihan_mahasiswa['id'],
            'jenis_tagihan_mahasiswa' => $tagihan_mahasiswa['jenis'],
            'id_tahun_akademik'       => $tagihan_mahasiswa['id_tahun_akademik'],
            'tahun_akademik'          => $tagihan_mahasiswa['tahun_akademik'],
            'tipe_tahun_akademik'     => $tagihan_mahasiswa['tipe_tahun_akademik'],
            'id_mahasiswa'              => $mahasiswa['id'],
            'nama_mahasiswa'            => $mahasiswa['nama'],
            'nomor_identitas_mahasiswa' => $mahasiswa['nomor_identitas'],
            'id_program_studi'          => $mahasiswa['id_program_studi'],
            'jenjang_program_studi'     => $mahasiswa['jenjang_program_studi'],
            'nama_program_studi'        => $mahasiswa['nama_program_studi'],
            'singkatan_program_studi'   => $mahasiswa['singkatan_program_studi'],
            'tahap'  => $tahap,
            'tanggal_bayar' => $this->request->getVar('tanggal_bayar'),
            'jumlah_bayar' => $this->request->getVar('jumlah_bayar', FILTER_SANITIZE_NUMBER_INT),
            'created_by' => userSession('id'),
        ];

        model($this->model_name)->insert($data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Berhasil konfirmasi pembayaran',
            'route'   => base_url(userSession('slug_role')) . '/status-bayar?tagihan_mahasiswa=' . $tagihan_mahasiswa['id'],
        ]);
    }
}
