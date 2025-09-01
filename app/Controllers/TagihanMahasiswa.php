<?php

namespace App\Controllers;

class TagihanMahasiswa extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'tagihan_mahasiswa';
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
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime(userLocalTime($v['created_at'])));
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
            'jenis' => 'required',
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
        $kategori = $this->request->getVar('kategori');
        $tahun_akademik = model('TahunAkademik')->orderBy('id DESC')->first();
        $jenis = $this->request->getVar('jenis');
        $biaya_yudisium_wisuda = $this->request->getVar('biaya_yudisium_wisuda', FILTER_SANITIZE_NUMBER_INT) ?? 0;


        $json_id_mahasiswa = '';
        if ($kategori == 'PERORANGAN') {
            $json_id_mahasiswa = $this->request->getVar('json_id_mahasiswa');

            if (! $json_id_mahasiswa) {
                return $this->response->setStatusCode(400)->setJSON([
                    'status'  => 'error',
                    'message' => 'Pastikan sudah centang mahasiswa',
                ]);
            }

            if ($jenis == 'YUDISIUM') {
                model('Users')
                ->where('id_role', 5)
                ->whereIn('id', json_decode($json_id_mahasiswa))
                ->set(['biaya_yudisium' => $biaya_yudisium_wisuda])
                ->update();
            }
            if ($jenis == 'WISUDA') {
                model('Users')
                ->where('id_role', 5)
                ->whereIn('id', json_decode($json_id_mahasiswa))
                ->set(['biaya_wisuda' => $biaya_yudisium_wisuda])
                ->update();
            }
        }

        $data_biaya = [];
        if ($kategori == 'MABA') {
            $id_program_studi = $this->request->getPost('id_program_studi');
            $biaya            = $this->request->getPost('biaya');
            foreach ($id_program_studi as $i => $id) {
                $program_studi = model('ProgramStudi')->find($id);
                $data_biaya[] = [
                    'id_program_studi'   => $id,
                    'jenjang_program_studi' => $program_studi['jenjang'],
                    'nama_program_studi' => $program_studi['nama'],
                    'biaya'              => (int) str_replace('.', '', $biaya[$i]),
                ];
            }
        }

        $data = [
            'kategori'                       => $kategori,
            'jenis'                          => $jenis,
            'json_id_mahasiswa'              => $json_id_mahasiswa,
            'id_tahun_akademik'              => $tahun_akademik['id'],
            'tahun_akademik'                 => $tahun_akademik['tahun_akademik'],
            'tipe_tahun_akademik'            => $tahun_akademik['tipe'],
            'periode_mulai_tahun_akademik'   => $tahun_akademik['periode_mulai'],
            'periode_selesai_tahun_akademik' => $tahun_akademik['periode_selesai'],
            'json_biaya'                     => json_encode($data_biaya),
            'biaya_yudisium_wisuda'          => $biaya_yudisium_wisuda,
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
        $kategori = $find_data['kategori'];

        if ($kategori == 'PERORANGAN') {
            $json_id_mahasiswa = ($this->request->getVar('json_id_mahasiswa'));
        } else {
            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Tidak dapat diproses',
            ]);
        }

        $jenis = $find_data['jenis'];
        $biaya_yudisium_wisuda = $find_data['biaya_yudisium_wisuda'];
        
        $json_id_mahasiswa = '';
        if ($kategori == 'PERORANGAN') {
            $json_id_mahasiswa = $this->request->getVar('json_id_mahasiswa');

            if (! $json_id_mahasiswa) {
                return $this->response->setStatusCode(400)->setJSON([
                    'status'  => 'error',
                    'message' => 'Pastikan sudah centang mahasiswa',
                ]);
            }

            if ($jenis == 'YUDISIUM') {
                model('Users')
                ->where('id_role', 5)
                ->whereIn('id', json_decode($json_id_mahasiswa))
                ->set(['biaya_yudisium' => $biaya_yudisium_wisuda])
                ->update();
            }
            if ($jenis == 'WISUDA') {
                model('Users')
                ->where('id_role', 5)
                ->whereIn('id', json_decode($json_id_mahasiswa))
                ->set(['biaya_wisuda' => $biaya_yudisium_wisuda])
                ->update();
            }
        }

        $data = [
            'json_id_mahasiswa' => $json_id_mahasiswa,
            'biaya_yudisium_wisuda' => $biaya_yudisium_wisuda,
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
        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }
}
