<?php

namespace App\Controllers;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Keuangan extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'keuangan';
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
            'title'      => 'Keluar Masuk Uang',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/main', $data);
        return view('dashboard/header', $view);
    }

    public function newUangMasuk()
    {
        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => 'Add Uang Masuk',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new_uang_masuk', $data);
        return view('dashboard/header', $view);
    }

    public function newUangKeluar()
    {
        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => 'Add Uang Keluar',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new_uang_keluar', $data);
        return view('dashboard/header', $view);
    }

    public function editUangMasuk($id = null)
    {
        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'base_name'  => $this->base_name,
            'data'       => model($this->model_name)->find($id),
            'title'      => 'Edit Uang Masuk',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/edit_uang_masuk', $data);
        return view('dashboard/header', $view);
    }

    public function editUangKeluar($id = null)
    {
        $data = [
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'base_name'  => $this->base_name,
            'data'       => model($this->model_name)->find($id),
            'title'      => 'Edit Uang Keluar',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/edit_uang_keluar', $data);
        return view('dashboard/header', $view);
    }

    public function laporanKas()
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data'   => $this->base_api . $query,
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => 'Laporan Kas',
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/laporan_kas', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select)->where('id_pengguna', userSession('id'));
        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total = $base_query->countAllResults(false);
        $array_query_key = ['tanggal_awal', 'tanggal_akhir', 'jenis', 'id_sumber_dana'];

        $get_tanggal_awal = $this->request->getVar('tanggal_awal');
        $get_tanggal_akhir = $this->request->getVar('tanggal_akhir');
        $get_jenis = $this->request->getVar('jenis');
        $get_id_sumber_dana = $this->request->getVar('id_sumber_dana');
        $sumber_dana = null;
        if (array_intersect(array_keys($_GET), $array_query_key)) {
            if ($get_tanggal_awal) {
                $base_query->where('DATE(tanggal) >=', $get_tanggal_awal);
            }

            if ($get_tanggal_akhir) {
                $base_query->where('DATE(tanggal) <=', $get_tanggal_akhir);
            }

            if ($get_jenis) {
                $base_query->where('jenis', $get_jenis);
            }

            if ($get_id_sumber_dana) {
                $base_query->where('id_sumber_dana', $get_id_sumber_dana);
                $sumber_dana = model('MasterDana')->find($get_id_sumber_dana);
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
            $base_query->orderBy('tanggal DESC');
        }
        // End | Datatables

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->findAll($limit, $offset);

        $total_nominal = 0;
        foreach ($data as $key => $v) {
            $total_nominal += $v['nominal'];
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['nominal'] = formatRupiah($v['nominal']);
            $data[$key]['tanggal'] = date('d-m-Y H:i', strtotime($v['tanggal']));
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
            'tanggal_awal'    => $get_tanggal_awal,
            'tanggal_akhir'   => $get_tanggal_akhir,
            'jenis'           => $get_jenis,
            'sumber_dana'     => $sumber_dana ? ($sumber_dana['jenis'] . ' - ' . $sumber_dana['nama']) : '',
            'pencarian'       => $search,
            'total_nominal'   => formatRupiah($total_nominal),
        ]);
    }

    public function create()
    {
        $rules = [
            'jenis'       => 'required',
            'sumber_dana' => 'required',
            'nominal'     => 'required',
            'catatan'     => 'max_length[50]',
            'tanggal'     => 'required',
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
        $jenis = $this->request->getVar('jenis');
        $nominal = abs($this->request->getVar('nominal', FILTER_SANITIZE_NUMBER_INT));
        if ($jenis == 'Keluar') {
            $nominal = 0 - abs($nominal);
        }
        $id_sumber_dana = $this->request->getVar('sumber_dana');
        $sumber_dana = model('MasterDana')->find($id_sumber_dana);

        $data = [
            'id_pengguna'      => userSession('id'),
            'jenis'            => $jenis,
            'nominal'          => $nominal,
            'id_sumber_dana'   => $sumber_dana['id'],
            'nama_sumber_dana' => $sumber_dana['nama'],
            'catatan'          => $this->request->getVar('catatan'),
            'tanggal'          => $this->request->getVar('tanggal'),
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
            'sumber_dana' => 'required',
            'nominal'     => 'required',
            'catatan'     => 'max_length[50]',
            'tanggal'     => 'required',
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
        $jenis = $find_data['jenis'];
        $nominal = abs($this->request->getVar('nominal', FILTER_SANITIZE_NUMBER_INT));
        if ($jenis == 'Keluar') {
            $nominal = 0 - abs($nominal);
        }
        $id_sumber_dana = $this->request->getVar('sumber_dana');
        $sumber_dana = model('MasterDana')->find($id_sumber_dana);

        $data = [
            'id_pengguna'      => userSession('id'),
            'nominal'          => $nominal,
            'id_sumber_dana'   => $sumber_dana['id'],
            'nama_sumber_dana' => $sumber_dana['nama'],
            'catatan'          => $this->request->getVar('catatan'),
            'tanggal'          => $this->request->getVar('tanggal'),
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

    public function indexLaporanKas()
    {
        $base_query_pemasukan = model($this->model_name)
        ->select("DATE_FORMAT(tanggal, '%Y-%m') as periode, SUM(nominal) as pemasukan")
        ->where('id_pengguna', userSession('id'))
        ->where('jenis', 'Masuk')
        ->groupBy('periode')
        ->orderBy('periode ASC');

        $base_query_pengeluaran = model($this->model_name, false)
        ->select("DATE_FORMAT(tanggal, '%Y-%m') as periode, SUM(nominal) as pengeluaran")
        ->where('id_pengguna', userSession('id'))
        ->where('jenis', 'Keluar')
        ->groupBy('periode')
        ->orderBy('periode ASC');

        $get_periode_awal = $this->request->getVar('periode_awal') ?? date('Y-01');
        $get_periode_akhir = $this->request->getVar('periode_akhir') ?? date('Y-m');
        if ($get_periode_awal && $get_periode_akhir) {
            $base_query_pemasukan->where("DATE_FORMAT(tanggal, '%Y-%m') >=", $get_periode_awal);
            $base_query_pemasukan->where("DATE_FORMAT(tanggal, '%Y-%m') <=", $get_periode_akhir);

            $base_query_pengeluaran->where("DATE_FORMAT(tanggal, '%Y-%m') >=", $get_periode_awal);
            $base_query_pengeluaran->where("DATE_FORMAT(tanggal, '%Y-%m') <=", $get_periode_akhir);
        } else {
            $base_query_pemasukan->where('1 = 0');
            $base_query_pengeluaran->where('1 = 0');
        }

        $data_pemasukan   = $base_query_pemasukan->findAll();
        $data_pengeluaran = $base_query_pengeluaran->findAll();
        
        $periode_awal  = new \DateTime($get_periode_awal);
        $periode_akhir = new \DateTime($get_periode_akhir);

        $data = [];
        $no_urut = 1;
        $total_pemasukan = 0;
        $total_pengeluaran = 0;
        $kas_sebelumnya = 0;
        $pemasukan_by_periode   = array_column($data_pemasukan, 'pemasukan', 'periode');
        $pengeluaran_by_periode = array_column($data_pengeluaran, 'pengeluaran', 'periode');

        while ($periode_awal <= $periode_akhir) {
            $periode     = $periode_awal->format('Y-m');
            $pemasukan   = $pemasukan_by_periode[$periode] ?? 0;
            $pengeluaran = $pengeluaran_by_periode[$periode] ?? 0;
            $kas         = ($pemasukan + $pengeluaran) + $kas_sebelumnya;
            $kas_sebelumnya = $kas;

            $total_pemasukan += $pemasukan;
            $total_pengeluaran += $pengeluaran;
            $data[] = [
                'no_urut'     => $no_urut,
                'periode'     => dateFormatter($periode, 'MMMM yyyy'),
                'pemasukan'   => formatRupiah($pemasukan),
                'pengeluaran' => formatRupiah($pengeluaran),
                'kas'         => formatRupiah($kas),
            ];
            $no_urut++;

            $periode_awal->modify('+1 month');
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'      => count($data),
            'recordsFiltered'   => count($data),
            'data'              => $data,
            'periode_awal'      => dateFormatter($get_periode_awal, 'MMMM yyyy'),
            'periode_akhir'     => dateFormatter($get_periode_akhir, 'MMMM yyyy'),
            'total_pemasukan'   => formatRupiah($total_pemasukan),
            'total_pengeluaran' => formatRupiah($total_pengeluaran),
            'total_kas'    => formatRupiah($total_pemasukan + $total_pengeluaran),
        ]);
    }

    /*--------------------------------------------------------------
    # Grafik
    --------------------------------------------------------------*/
    public function grafikKeuangan()
    {
        $periode = $this->request->getVar('periode');
        $data = [];

        if ($periode == 'harian') {
            $berapa_hari_terakhir = 6;
            $result_harian = model($this->model_name)
            ->select("DATE(tanggal) as tanggal, SUM(nominal) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', date('Y-m-d', strtotime("-$berapa_hari_terakhir days")))
            ->groupBy('tanggal')
            ->orderBy('tanggal', 'ASC')
            ->findAll();

            $pemasukan = model($this->model_name)
            ->select("DATE(tanggal) as tanggal, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', date('Y-m-d', strtotime("-$berapa_hari_terakhir days")))
            ->where('jenis', 'Masuk')
            ->groupBy('tanggal')
            ->orderBy('tanggal', 'ASC')
            ->findAll();

            $pengeluaran = model($this->model_name)
            ->select("DATE(tanggal) as tanggal, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', date('Y-m-d', strtotime("-$berapa_hari_terakhir days")))
            ->where('jenis', 'Keluar')
            ->groupBy('tanggal')
            ->orderBy('tanggal', 'ASC')
            ->findAll();

            $total_nominal_by_tanggal = array_column($result_harian, 'total_nominal', 'tanggal');
            $total_pemasukan_by_tanggal = array_column($pemasukan, 'total_nominal', 'tanggal');
            $total_pengeluaran_by_tanggal = array_column($pengeluaran, 'total_nominal', 'tanggal');
            for ($i = $berapa_hari_terakhir; $i >= 0; $i--) {
                $tanggal = date('Y-m-d', strtotime("-$i days"));
                $total_nominal = $total_nominal_by_tanggal[$tanggal] ?? 0;
                $total_pemasukan = $total_pemasukan_by_tanggal[$tanggal] ?? 0;
                $total_pengeluaran = $total_pengeluaran_by_tanggal[$tanggal] ?? 0;
                $data[] = [
                    'periode'           => date('d M y', strtotime($tanggal)),
                    'total_nominal'     => $total_nominal,
                    'total_pemasukan'   => $total_pemasukan,
                    'total_pengeluaran' => $total_pengeluaran,
                ];
            }
        }

        if ($periode == 'mingguan') {
            $berapa_minggu_terakhir = 4;
            $start_date = date('Y-m-d', strtotime('-' . ($berapa_minggu_terakhir * 7 - 1) . ' days'));

            $result_mingguan = model($this->model_name)
            ->select("YEARWEEK(tanggal, 1) as minggu_ke, SUM(nominal) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->groupBy('minggu_ke')
            ->orderBy('minggu_ke ASC')
            ->findAll();

            $pemasukan = model($this->model_name)
            ->select("YEARWEEK(tanggal, 1) as minggu_ke, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->where('jenis', 'Masuk')
            ->groupBy('minggu_ke')
            ->orderBy('minggu_ke ASC')
            ->findAll();

            $pengeluaran = model($this->model_name)
            ->select("YEARWEEK(tanggal, 1) as minggu_ke, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->where('jenis', 'Keluar')
            ->groupBy('minggu_ke')
            ->orderBy('minggu_ke ASC')
            ->findAll();

            $total_nominal_by_minggu = array_column($result_mingguan, 'total_nominal', 'minggu_ke');
            $total_pemasukan_by_minggu = array_column($pemasukan, 'total_nominal', 'minggu_ke');
            $total_pengeluaran_by_minggu = array_column($pengeluaran, 'total_nominal', 'minggu_ke');
            $senin_ini = strtotime('monday this week');
            for ($i = $berapa_minggu_terakhir - 1; $i >= 0; $i--) {
                $week_start = date('Y-m-d', strtotime("-$i week", $senin_ini));
                $week_end   = date('Y-m-d', strtotime("sunday", strtotime($week_start)));
                $minggu_ke  = date('oW', strtotime($week_start));
                $total_nominal = $total_nominal_by_minggu[$minggu_ke] ?? 0;
                $total_pemasukan = $total_pemasukan_by_minggu[$minggu_ke] ?? 0;
                $total_pengeluaran = $total_pengeluaran_by_minggu[$minggu_ke] ?? 0;
                $data[] = [
                    'periode'           => date('d M', strtotime($week_start)) . ' - ' . date('d M', strtotime($week_end)),
                    'total_nominal'     => $total_nominal,
                    'total_pemasukan'   => $total_pemasukan,
                    'total_pengeluaran' => $total_pengeluaran,
                ];
            }
        }

        if ($periode == 'bulanan') {
            $berapa_bulan_terakhir = 12;
            $start_date = date('Y-m-01', strtotime("-" . ($berapa_bulan_terakhir - 1) . " months"));

            $result_bulanan = model($this->model_name)
            ->select("DATE_FORMAT(tanggal, '%Y-%m') as bulan_ke, SUM(nominal) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->groupBy('bulan_ke')
            ->orderBy('bulan_ke ASC')
            ->findAll();

            $pemasukan = model($this->model_name)
            ->select("DATE_FORMAT(tanggal, '%Y-%m') as bulan_ke, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->where('jenis', 'Masuk')
            ->groupBy('bulan_ke')
            ->orderBy('bulan_ke ASC')
            ->findAll();

            $pengeluaran = model($this->model_name)
            ->select("DATE_FORMAT(tanggal, '%Y-%m') as bulan_ke, SUM(ABS(nominal)) as total_nominal")
            ->where('id_pengguna', userSession('id'))
            ->where('tanggal >=', $start_date)
            ->where('jenis', 'Keluar')
            ->groupBy('bulan_ke')
            ->orderBy('bulan_ke ASC')
            ->findAll();

            $total_nominal_by_bulan = array_column($result_bulanan, 'total_nominal', 'bulan_ke');
            $total_pemasukan_by_bulan = array_column($pemasukan, 'total_nominal', 'bulan_ke');
            $total_pengeluaran_by_bulan = array_column($pengeluaran, 'total_nominal', 'bulan_ke');
            for ($i = $berapa_bulan_terakhir - 1; $i >= 0; $i--) {
                $bulan_awal = date('Y-m-01', strtotime("-$i months"));
                $bulan_ke = date('Y-m', strtotime($bulan_awal));
                $total_nominal = $total_nominal_by_bulan[$bulan_ke] ?? 0;
                $total_pemasukan = $total_pemasukan_by_bulan[$bulan_ke] ?? 0;
                $total_pengeluaran = $total_pengeluaran_by_bulan[$bulan_ke] ?? 0;
                $data[] = [
                    'periode'           => date('M y', strtotime($bulan_awal)),
                    'total_nominal'     => $total_nominal,
                    'total_pemasukan'   => $total_pemasukan,
                    'total_pengeluaran' => $total_pengeluaran,
                ];
            }
        }

        return $this->response->setStatusCode(200)->setJSON([
            'status' => 'success',
            'data'   => $data,
        ]);
    }

    public function grafikSumberPemasukanTerbesar()
    {
        $periode = $this->request->getVar('periode');
        $base_query = model($this->model_name)
        ->select('id_sumber_dana, COUNT(*) AS total, SUM(nominal) as total_nominal, MAX(nama_sumber_dana) AS nama_sumber_dana')
        ->where('id_pengguna', userSession('id'))
        ->where('jenis', 'Masuk');

        if ($periode == 'hari ini') {
            $base_query->where('DATE(tanggal)', date('Y-m-d'));
        }

        if ($periode == '7 hari terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-6 days')));
        }

        if ($periode == '28 hari terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-28 days')));
        }

        if ($periode == '3 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-3 months')));
        }

        if ($periode == '6 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-6 months')));
        }

        if ($periode == '12 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-12 months')));
        }

        $data = $base_query->groupBy('id_sumber_dana')
        ->orderBy('total_nominal', 'DESC')
        ->limit(5)
        ->get()->getResultArray();

        return $this->response->setStatusCode(200)->setJSON([
            'status' => 'success',
            'data'   => $data,
        ]);
    }

    public function grafikSumberPengeluaranTerbesar()
    {
        $periode = $this->request->getVar('periode');
        $base_query = model($this->model_name)
        ->select('id_sumber_dana, COUNT(*) AS total, SUM(ABS(nominal)) as total_nominal, MAX(nama_sumber_dana) AS nama_sumber_dana')
        ->where('id_pengguna', userSession('id'))
        ->where('jenis', 'Keluar');

        if ($periode == 'hari ini') {
            $base_query->where('DATE(tanggal)', date('Y-m-d'));
        }

        if ($periode == '7 hari terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-6 days')));
        }

        if ($periode == '28 hari terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-28 days')));
        }

        if ($periode == '3 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-3 months')));
        }

        if ($periode == '6 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-6 months')));
        }

        if ($periode == '12 bulan terakhir') {
            $base_query->where('tanggal >=', date('Y-m-d', strtotime('-12 months')));
        }

        $data = $base_query->groupBy('id_sumber_dana')
        ->orderBy('total_nominal', 'DESC')
        ->limit(5)
        ->get()->getResultArray();

        return $this->response->setStatusCode(200)->setJSON([
            'status' => 'success',
            'data'   => $data,
        ]);
    }

    /*--------------------------------------------------------------
    # Export Excel
    --------------------------------------------------------------*/
    public function exportExcel()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Get Data
        $response = $this->index()->getBody();
        $response = json_decode($response, true);
        $tanggal_awal = $response['tanggal_awal'] ? date('d-m-Y', strtotime($response['tanggal_awal'])) : '';
        $tanggal_akhir = $response['tanggal_akhir'] ? date('d-m-Y', strtotime($response['tanggal_akhir'])) : '';
        $jenis = $response['jenis'];
        $pencarian = $response['pencarian'];
        $sumber_dana = $response['sumber_dana'];
        $laporan_keuangan = $response['data'];
        $total_nominal = $response['total_nominal'];

        // Filtrasi
        $sheet->setCellValue('A1', 'Filtrasi');
        $sheet->setCellValue('A2', 'Tanggal Awal');
        $sheet->setCellValue('A3', 'Tanggal AKhir');
        $sheet->setCellValue('A4', 'Jenis');
        $sheet->setCellValue('A5', 'Sumber Dana');
        $sheet->setCellValue('A6', 'Pencarian');
        $sheet->getStyle('A1')->getFont()->setBold(true);

        $sheet->setCellValue('C2', ': ' . $tanggal_awal);
        $sheet->setCellValue('C3', ': ' . $tanggal_akhir);
        $sheet->setCellValue('C4', ': ' . $jenis);
        $sheet->setCellValue('C5', ': ' . $sumber_dana);
        $sheet->setCellValue('C6', ': ' . $pencarian);

        $sheet->mergeCells("A1:B1");
        $sheet->mergeCells("A2:B2");
        $sheet->mergeCells("A3:B3");
        $sheet->mergeCells("A4:B4");
        $sheet->mergeCells("A5:B5");
        $sheet->mergeCells("A6:B6");

        // Header
        $header_row = 8;
        $sheet->setCellValue('A' . $header_row, 'No.');
        $sheet->setCellValue('B' . $header_row, 'Nominal');
        $sheet->setCellValue('C' . $header_row, 'Sumber Dana');
        $sheet->setCellValue('D' . $header_row, 'Catatan');
        $sheet->setCellValue('E' . $header_row, 'Tanggal');
        $sheet->getStyle("A$header_row:{$sheet->getHighestColumn()}$header_row")->getFont()->setBold(true);

        $sheet->getStyle('A' . $header_row)->getAlignment()->setHorizontal('center');

        // Data
        $first_row_data = 9;
        foreach ($laporan_keuangan as $key => $v) {
            $data_row = $key + $first_row_data;
            $sheet->setCellValueExplicit('A' . $data_row, $key+1, \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING);
            $sheet->setCellValue('B' . $data_row, $v['nominal']);
            $sheet->setCellValue('C' . $data_row, $v['nama_sumber_dana']);
            $sheet->setCellValue('D' . $data_row, $v['catatan']);
            $sheet->setCellValue('E' . $data_row, $v['tanggal']);

            $sheet->getStyle('A' . $data_row)->getAlignment()->setHorizontal('center');
            if ($v['jenis'] == 'Masuk') {
                $sheet->getStyle('B' . $data_row)->getFont()->getColor()->setRGB('198754');
            } else {
                $sheet->getStyle('B' . $data_row)->getFont()->getColor()->setRGB('dc3545');
            }
        }

        $total_row = count($laporan_keuangan) + $first_row_data;
        $sheet->setCellValue('A' . $total_row, 'Total');
        $sheet->setCellValue('B' . $total_row, $total_nominal);

        $sheet->getStyle('A' . $total_row)->getAlignment()->setHorizontal('center');
        $sheet->getStyle("A$total_row:{$sheet->getHighestColumn()}$total_row")->getFont()->setBold(true);

        // Lebar Kolom Sesuai Isinya
        foreach (range('A', $sheet->getHighestColumn()) as $col) $sheet->getColumnDimension($col)->setAutoSize(true);

        $filename = 'keluar_masuk_uang.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }

    public function exportExcelLaporanKas()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Get Data
        $response = $this->indexLaporanKas()->getBody();
        $response = json_decode($response, true);
        $laporan_keuangan = $response['data'];
        $periode_awal = $response['periode_awal'];
        $periode_akhir = $response['periode_akhir'];
        $total_pemasukan = $response['total_pemasukan'];
        $total_pengeluaran = $response['total_pengeluaran'];
        $total_kas = $response['total_kas'];

        // Filtrasi
        $sheet->setCellValue('A1', 'Filtrasi');
        $sheet->setCellValue('A2', 'Periode Awal');
        $sheet->setCellValue('A3', 'Periode Akhir');
        $sheet->getStyle('A1')->getFont()->setBold(true);

        $sheet->setCellValue('C2', ': ' . $periode_awal);
        $sheet->setCellValue('C3', ': ' . $periode_akhir);

        $sheet->mergeCells("A1:B1");
        $sheet->mergeCells("A2:B2");
        $sheet->mergeCells("A3:B3");

        // Header
        $header_row = 5;
        $sheet->setCellValue('A' . $header_row, 'No.');
        $sheet->setCellValue('B' . $header_row, 'Periode');
        $sheet->setCellValue('C' . $header_row, 'Pemasukan');
        $sheet->setCellValue('D' . $header_row, 'Pengeluaran');
        $sheet->setCellValue('E' . $header_row, 'Kas');
        $sheet->getStyle("A$header_row:{$sheet->getHighestColumn()}$header_row")->getFont()->setBold(true);

        $sheet->getStyle('A' . $header_row)->getAlignment()->setHorizontal('center');

        // Data
        $first_row_data = 6;
        foreach ($laporan_keuangan as $key => $v) {
            $data_row = $key + $first_row_data;
            $sheet->setCellValueExplicit('A' . $data_row, $key+1, \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING);
            $sheet->setCellValue('B' . $data_row, $v['periode']);
            $sheet->setCellValue('C' . $data_row, $v['pemasukan']);
            $sheet->setCellValue('D' . $data_row, $v['pengeluaran']);
            $sheet->setCellValue('E' . $data_row, $v['kas']);

            $sheet->getStyle('A' . $data_row)->getAlignment()->setHorizontal('center');
        }

        $total_row = count($laporan_keuangan) + $first_row_data;
        $sheet->setCellValue('A' . $total_row, 'Total');
        $sheet->setCellValue('C' . $total_row, $total_pemasukan);
        $sheet->setCellValue('D' . $total_row, $total_pengeluaran);
        $sheet->setCellValue('E' . $total_row, $total_kas);

        $sheet->getStyle('A' . $total_row)->getAlignment()->setHorizontal('center');
        $sheet->getStyle("A$total_row:{$sheet->getHighestColumn()}$total_row")->getFont()->setBold(true);

        // Lebar Kolom Sesuai Isinya
        foreach (range('A', $sheet->getHighestColumn()) as $col) $sheet->getColumnDimension($col)->setAutoSize(true);

        $filename = 'laporan_kas.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }
}
