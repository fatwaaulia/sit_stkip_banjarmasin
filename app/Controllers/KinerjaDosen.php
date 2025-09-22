<?php

namespace App\Controllers;

class KinerjaDosen extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'kinerja_dosen';
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
    public function indexTriDharma()
    {
        $select     = ['*'];
        $base_query = model('TriDharma')->select($select);

        $get_dosen = $this->request->getVar('dosen');
        $base_query->groupStart()
            ->where('id_anggota_1', $get_dosen)
            ->orWhere('id_anggota_2', $get_dosen)
            ->orWhere('id_anggota_3', $get_dosen)
            ->orWhere('id_anggota_4', $get_dosen)
            ->orWhere('id_anggota_5', $get_dosen)
        ->groupEnd();

        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total = $base_query->countAllResults(false);

        $get_tanggal_awal = $this->request->getVar('tanggal_awal');
        if ($get_tanggal_awal) {
            $base_query->where('tanggal_publikasi >=', $get_tanggal_awal);
        }
        
        $get_tanggal_akhir = $this->request->getVar('tanggal_akhir');
        if ($get_tanggal_akhir) {
            $base_query->where('tanggal_publikasi <=', $get_tanggal_akhir);
        }

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

        if ($get_dosen) {
            $total_rows = $base_query->countAllResults(false);
            $data       = $base_query->findAll($limit, $offset);
        } else {
            $records_total = 0;
            $total_rows = 0;
            $data       = [];
        }

        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['dokumen'] = $v['dokumen'] ? webFile('', 'tri_dharma', $v['dokumen'], $v['updated_at']) : '';
            $data[$key]['tanggal_publikasi'] = date('d-m-Y', strtotime(toUserTime($v['tanggal_publikasi'])));
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at'])));
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
        ]);
    }

    public function indexPengajaran()
    {
        $select     = ['*'];
        $base_query = model('Pengajaran')->select($select);

        $get_dosen = $this->request->getVar('dosen');
        $base_query->where('created_by', $get_dosen);

        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total = $base_query->countAllResults(false);

        $get_tanggal_awal = $this->request->getVar('tanggal_awal');
        if ($get_tanggal_awal) {
            $base_query->where('created_at >=', $get_tanggal_awal);
        }

        $get_tanggal_akhir = $this->request->getVar('tanggal_akhir');
        if ($get_tanggal_akhir) {
            $base_query->where('created_at <=', $get_tanggal_akhir);
        }

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
            $data[$key]['jam_mulai'] = date('H:i', strtotime(toUserTime($v['jam_mulai'])));
            $data[$key]['jam_selesai'] = date('H:i', strtotime(toUserTime($v['jam_selesai'])));
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at'])));
            $data[$key]['dokumen'] = $v['dokumen'] ? webFile('', 'pengajaran', $v['dokumen'], $v['updated_at']) : '';
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
        ]);
    }

    public function indexPengembanganKompetensi()
    {
        $select     = ['*'];
        $base_query = model('PengembanganKompetensi')->select($select);

        $get_dosen = $this->request->getVar('dosen');
        $base_query->where('created_by', $get_dosen);

        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total = $base_query->countAllResults(false);

        $get_tanggal_awal = $this->request->getVar('tanggal_awal');
        if ($get_tanggal_awal) {
            $base_query->where('created_at >=', $get_tanggal_awal);
        }

        $get_tanggal_akhir = $this->request->getVar('tanggal_akhir');
        if ($get_tanggal_akhir) {
            $base_query->where('created_at <=', $get_tanggal_akhir);
        }

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
}
