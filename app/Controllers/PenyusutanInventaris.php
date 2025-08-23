<?php

namespace App\Controllers;

class PenyusutanInventaris extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'penyusutan_inventaris';
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

    public function detail($id = null)
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data'   => $this->base_api . 'detail/' . $id . $query,
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'data'       => model($this->model_name)->find($id),
            'title'      => 'Detail ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/detail', $data);
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

        $get_periode = $this->request->getVar('periode') ?? 'Tahunan';

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
            $penyusutan_tahunan = ($v['harga_beli'] - $v['nilai_residu']) / $v['umur_ekonomis'];
            $penyusutan_bulanan = $penyusutan_tahunan / 12;
            
            if ($get_periode == 'Tahunan') {
                $tahun_berlalu = date('Y', time()) - date('Y', strtotime($v['tanggal_beli']));
                $akumulasi_penyusutan = $penyusutan_tahunan * $tahun_berlalu;
            } else {
                $tahun_beli  = date('Y', strtotime($v['tanggal_beli']));
                $bulan_beli  = date('m', strtotime($v['tanggal_beli']));
                $tahun_sekarang = date('Y');
                $bulan_sekarang = date('m');
                $bulan_berlalu = (($tahun_sekarang - $tahun_beli) * 12) + ($bulan_sekarang - $bulan_beli);
                $akumulasi_penyusutan = $penyusutan_bulanan * $bulan_berlalu;
            }

            $maks_penyusutan = $v['harga_beli'] - $v['nilai_residu'];
            if ($akumulasi_penyusutan > $maks_penyusutan) {
                $akumulasi_penyusutan = $maks_penyusutan;
            }

            $nilai_buku = $v['harga_beli'] - $akumulasi_penyusutan;

            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['tanggal_beli'] = date('d-m-Y', strtotime($v['tanggal_beli']));
            $data[$key]['harga_beli'] = formatRupiah($v['harga_beli']);
            $data[$key]['umur_ekonomis'] = $v['umur_ekonomis'] . ' Tahun';
            $data[$key]['nilai_residu'] = formatRupiah($v['nilai_residu']);
            $data[$key]['penyusutan_tahunan'] = formatRupiah($penyusutan_tahunan);
            $data[$key]['penyusutan_bulanan'] = formatRupiah($penyusutan_bulanan);
            $data[$key]['akumulasi_penyusutan'] = formatRupiah($akumulasi_penyusutan);
            $data[$key]['nilai_buku'] = formatRupiah($nilai_buku);
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime($v['created_at']));
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
        ]);
    }

    public function indexDetail($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $harga_beli = $find_data['harga_beli'];
        $umur = $find_data['umur_ekonomis'];
        $residu = $find_data['nilai_residu'];

        $penyusutan_tahunan = ($harga_beli - $residu) / $umur;

        $akumulasi_penyusutan = 0;
        $penyusutan = [];

        for ($tahun = 1; $tahun <= $umur; $tahun++) {
            $akumulasi_penyusutan += $penyusutan_tahunan;
            $nilai_buku = $harga_beli - $akumulasi_penyusutan;

            $penyusutan[] = [
                'tahun'                => $tahun,
                'penyusutan_tahunan'   => formatRupiah($penyusutan_tahunan),
                'akumulasi_penyusutan' => formatRupiah($akumulasi_penyusutan),
                'nilai_buku'           => formatRupiah($nilai_buku),
            ];
        }

        $data = $penyusutan;

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => count($data),
            'recordsFiltered' => count($data),
            'data'            => $data,
            'nama_barang'     => $find_data['nama_barang'],
        ]);
    }

    public function create()
    {
        $rules = [
            'nama_barang'   => 'required',
            'tanggal_beli'  => 'required',
            'harga_beli'    => 'required',
            'umur_ekonomis' => 'required',
            'nilai_residu'  => 'required',
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
        $data = [
            'nama_barang'   => $this->request->getVar('nama_barang'),
            'tanggal_beli'  => $this->request->getVar('tanggal_beli'),
            'harga_beli'    => $this->request->getVar('harga_beli', FILTER_SANITIZE_NUMBER_INT),
            'umur_ekonomis' => $this->request->getVar('umur_ekonomis'),
            'nilai_residu'  => $this->request->getVar('nilai_residu', FILTER_SANITIZE_NUMBER_INT),
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
            'nama_barang'   => 'required',
            'tanggal_beli'  => 'required',
            'harga_beli'    => 'required',
            'umur_ekonomis' => 'required',
            'nilai_residu'  => 'required',
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
        $data = [
            'nama_barang'   => $this->request->getVar('nama_barang'),
            'tanggal_beli'  => $this->request->getVar('tanggal_beli'),
            'harga_beli'    => $this->request->getVar('harga_beli', FILTER_SANITIZE_NUMBER_INT),
            'umur_ekonomis' => $this->request->getVar('umur_ekonomis'),
            'nilai_residu'  => $this->request->getVar('nilai_residu', FILTER_SANITIZE_NUMBER_INT),
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
