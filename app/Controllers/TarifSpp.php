<?php

namespace App\Controllers;

class TarifSpp extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'tarif_spp';
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
            'title'      => 'Tarif SPP',
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
            $data[$key]['biaya'] = formatRupiah($v['biaya']);
            $data[$key]['biaya_uts'] = formatRupiah($v['biaya_uts']);
            $data[$key]['biaya_uas'] = formatRupiah($v['biaya_uas']);
            $data[$key]['biaya_ldkm'] = formatRupiah($v['biaya_ldkm']);
            $data[$key]['biaya_mbkm'] = formatRupiah($v['biaya_mbkm']);
            $data[$key]['biaya_bimbingan_skripsi'] = formatRupiah($v['biaya_bimbingan_skripsi']);
            $data[$key]['biaya_seminar_proposal'] = formatRupiah($v['biaya_seminar_proposal']);
            $data[$key]['biaya_sidang_skripsi'] = formatRupiah($v['biaya_sidang_skripsi']);
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
            'kode'  => "required|is_unique[$this->base_name.kode]",
            'nama'  => 'required',
            'biaya' => 'required',
            'biaya_uts'  => 'required',
            'biaya_uas'  => 'required',
            'biaya_ldkm' => 'required',
            'biaya_mbkm' => 'required',
            'biaya_bimbingan_skripsi' => 'required',
            'biaya_seminar_proposal'  => 'required',
            'biaya_sidang_skripsi'    => 'required',
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
            'kode'  => $this->request->getVar('kode'),
            'nama'  => $this->request->getVar('nama'),
            'biaya' => $this->request->getVar('biaya', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uts' => $this->request->getVar('biaya_uts', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uas' => $this->request->getVar('biaya_uas', FILTER_SANITIZE_NUMBER_INT),
            'biaya_ldkm' => $this->request->getVar('biaya_ldkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_mbkm' => $this->request->getVar('biaya_mbkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_bimbingan_skripsi' => $this->request->getVar('biaya_bimbingan_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_seminar_proposal' => $this->request->getVar('biaya_seminar_proposal', FILTER_SANITIZE_NUMBER_INT),
            'biaya_sidang_skripsi' => $this->request->getVar('biaya_sidang_skripsi', FILTER_SANITIZE_NUMBER_INT),
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
            'kode'  => "required|is_unique[$this->base_name.kode,id,$id]",
            'nama'  => 'required',
            'biaya' => 'required',
            'biaya_uts'  => 'required',
            'biaya_uas'  => 'required',
            'biaya_ldkm' => 'required',
            'biaya_mbkm' => 'required',
            'biaya_bimbingan_skripsi' => 'required',
            'biaya_seminar_proposal'  => 'required',
            'biaya_sidang_skripsi'    => 'required',
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
            'kode'  => $this->request->getVar('kode'),
            'nama'  => $this->request->getVar('nama'),
            'biaya' => $this->request->getVar('biaya', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uts' => $this->request->getVar('biaya_uts', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uas' => $this->request->getVar('biaya_uas', FILTER_SANITIZE_NUMBER_INT),
            'biaya_ldkm' => $this->request->getVar('biaya_ldkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_mbkm' => $this->request->getVar('biaya_mbkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_bimbingan_skripsi' => $this->request->getVar('biaya_bimbingan_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_seminar_proposal' => $this->request->getVar('biaya_seminar_proposal', FILTER_SANITIZE_NUMBER_INT),
            'biaya_sidang_skripsi' => $this->request->getVar('biaya_sidang_skripsi', FILTER_SANITIZE_NUMBER_INT),
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
