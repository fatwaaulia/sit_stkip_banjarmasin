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
            'kategori'        => 'required',
            'nama_barang'     => 'required',
            'unit'            => 'required',
            'tahun_perolehan' => 'required',
            'umur_ekonomis'   => 'required',
            'harga_perolehan' => 'required',
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
        $kategori = model('KategoriPenyusutanInventaris')->find($this->request->getVar('kategori'));
        $data = [
            'id_kategori'     => $kategori['id'],
            'nama_kategori'   => $kategori['nama'],
            'nama_barang'     => $this->request->getVar('nama_barang'),
            'unit'            => $this->request->getVar('unit'),
            'tahun_perolehan' => $this->request->getVar('tahun_perolehan'),
            'umur_ekonomis'   => $this->request->getVar('umur_ekonomis'),
            'harga_perolehan' => $this->request->getVar('harga_perolehan', FILTER_SANITIZE_NUMBER_INT),
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
            'kategori'        => 'required',
            'nama_barang'     => 'required',
            'unit'            => 'required',
            'tahun_perolehan' => 'required',
            'umur_ekonomis'   => 'required',
            'harga_perolehan' => 'required',
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
        $kategori = model('KategoriPenyusutanInventaris')->find($this->request->getVar('kategori'));
        $data = [
            'id_kategori'     => $kategori['id'],
            'nama_kategori'   => $kategori['nama'],
            'nama_barang'     => $this->request->getVar('nama_barang'),
            'unit'            => $this->request->getVar('unit'),
            'tahun_perolehan' => $this->request->getVar('tahun_perolehan'),
            'umur_ekonomis'   => $this->request->getVar('umur_ekonomis'),
            'harga_perolehan' => $this->request->getVar('harga_perolehan', FILTER_SANITIZE_NUMBER_INT),
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
