<?php

namespace App\Controllers;

class Mahasiswa extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'mahasiswa';
        $this->model_name  = 'Users';
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
        $select          = ['*'];
        $base_query      = model($this->model_name)->select($select)->where('id_role', 5);
        $limit           = (int)$this->request->getVar('length');
        $offset          = (int)$this->request->getVar('start');
        $records_total   = $base_query->countAllResults(false);
        $array_query_key = ['program_studi', 'mulai_kuliah'];

        if (array_intersect(array_keys($_GET), $array_query_key)) {
            $get_program_studi = $this->request->getVar('program_studi');
            if ($get_program_studi) {
                $base_query->where('id_program_studi', $get_program_studi);
            }

            $get_mulai_kuliah = $this->request->getVar('mulai_kuliah');
            if ($get_mulai_kuliah) {
                $base_query->where('id_tahun_akademik_diterima', $get_mulai_kuliah);
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
            'nomor_identitas' => 'required|is_unique[users.nomor_identitas]',
            'nama'            => 'required',
            'jenis_kelamin'   => 'required',
            'email'           => 'permit_empty|valid_email',
            'no_hp'           => 'permit_empty|numeric',
            'program_studi'   => 'required',
            'tahun_akademik_diterima' => 'required',
            'kelas'           => 'required',
            'biaya_almamater'   => 'required',
            'biaya_ktm'         => 'required',
            'biaya_uang_gedung' => 'required',
            'spp'             => 'required',
            'biaya_uts'       => 'required',
            'biaya_uas'       => 'required',
            'biaya_ldkm'      => 'required',
            'biaya_mbkm'      => 'required',
            'biaya_bimbingan_skripsi' => 'required',
            'biaya_seminar_proposal'  => 'required',
            'biaya_sidang_skripsi'    => 'required',
            'biaya_yudisium' => 'required',
            'biaya_wisuda'   => 'required',
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
        $role = model('Role')->find(5);
        $program_studi = model('ProgramStudi')->find($this->request->getVar('program_studi'));
        $tahun_akademik_diterima = model('TahunAkademik')->find($this->request->getVar('tahun_akademik_diterima'));
        $spp = model('TarifSpp')->find($this->request->getVar('spp'));
        $nomor_identitas = $this->request->getVar('nomor_identitas');
        $data = [
            'username' => $nomor_identitas,
            'password' => password_hash($nomor_identitas, PASSWORD_DEFAULT),

            'id_role'         => $role['id'],
            'nama_role'       => $role['nama'],
            'slug_role'       => $role['slug'],
            'nomor_identitas' => $nomor_identitas,
            'nama'            => $this->request->getVar('nama'),
            'jenis_kelamin'   => $this->request->getVar('jenis_kelamin'),
            'tempat_lahir'    => $this->request->getVar('tempat_lahir'),
            'tanggal_lahir'   => $this->request->getVar('tanggal_lahir'),
            'alamat'          => $this->request->getVar('alamat'),
            'email'           => $this->request->getVar('email'),
            'no_hp'           => $this->request->getVar('no_hp'),
            'id_program_studi'        => $program_studi['id'],
            'jenjang_program_studi'   => $program_studi['jenjang'],
            'nama_program_studi'      => $program_studi['nama'],
            'singkatan_program_studi' => $program_studi['singkatan'],
            'id_tahun_akademik_diterima'     => $tahun_akademik_diterima['id'],
            'tahun_akademik_diterima'        => $tahun_akademik_diterima['tahun_akademik'],
            'tipe_tahun_akademik'            => $tahun_akademik_diterima['tipe'],
            'periode_mulai_tahun_akademik'   => $tahun_akademik_diterima['periode_mulai'],
            'periode_selesai_tahun_akademik' => $tahun_akademik_diterima['periode_selesai'],
            'semester'  => 1,
            'kelas'     => $this->request->getVar('kelas'),
            'biaya_almamater'   => $this->request->getVar('biaya_almamater',FILTER_SANITIZE_NUMBER_INT),
            'biaya_ktm'         => $this->request->getVar('biaya_ktm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uang_gedung' => $this->request->getVar('biaya_uang_gedung', FILTER_SANITIZE_NUMBER_INT),
            'id_spp'    => $spp['id'],
            'nama_spp'  => $spp['nama'],
            'biaya_spp' => $spp['biaya'],
            'biaya_uts' => $this->request->getVar('biaya_uts', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uas' => $this->request->getVar('biaya_uas', FILTER_SANITIZE_NUMBER_INT),
            'biaya_ldkm' => $this->request->getVar('biaya_ldkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_mbkm' => $this->request->getVar('biaya_mbkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_bimbingan_skripsi' => $this->request->getVar('biaya_bimbingan_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_seminar_proposal'  => $this->request->getVar('biaya_seminar_proposal', FILTER_SANITIZE_NUMBER_INT),
            'biaya_sidang_skripsi'    => $this->request->getVar('biaya_sidang_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_yudisium' => $this->request->getVar('biaya_yudisium', FILTER_SANITIZE_NUMBER_INT),
            'biaya_wisuda'   => $this->request->getVar('biaya_wisuda', FILTER_SANITIZE_NUMBER_INT),
            'status' => 'Aktif',
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
            'nomor_identitas' => "required|is_unique[users.nomor_identitas,id,$id]",
            'nama'            => 'required',
            'jenis_kelamin'   => 'required',
            'email'           => 'permit_empty|valid_email',
            'no_hp'           => 'permit_empty|numeric',
            'kelas'           => 'required',
            'biaya_almamater'   => 'required',
            'biaya_ktm'         => 'required',
            'biaya_uang_gedung' => 'required',
            'spp'             => 'required',
            'biaya_uts'       => 'required',
            'biaya_uas'       => 'required',
            'biaya_ldkm'      => 'required',
            'biaya_mbkm'      => 'required',
            'biaya_bimbingan_skripsi' => 'required',
            'biaya_seminar_proposal'  => 'required',
            'biaya_sidang_skripsi'    => 'required',
            'biaya_yudisium' => 'required',
            'biaya_wisuda'   => 'required',
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
        $spp = model('TarifSpp')->find($this->request->getVar('spp'));
        $nomor_identitas = $this->request->getVar('nomor_identitas');
        $data = [
            'nomor_identitas' => $nomor_identitas,
            'nama'            => $this->request->getVar('nama'),
            'jenis_kelamin'   => $this->request->getVar('jenis_kelamin'),
            'tempat_lahir'    => $this->request->getVar('tempat_lahir'),
            'tanggal_lahir'   => $this->request->getVar('tanggal_lahir'),
            'alamat'          => $this->request->getVar('alamat'),
            'email'           => $this->request->getVar('email'),
            'no_hp'           => $this->request->getVar('no_hp'),
            'semester'        => $this->request->getVar('semester'),
            'kelas'           => $this->request->getVar('kelas'),
            'biaya_almamater'   => $this->request->getVar('biaya_almamater',FILTER_SANITIZE_NUMBER_INT),
            'biaya_ktm'         => $this->request->getVar('biaya_ktm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uang_gedung' => $this->request->getVar('biaya_uang_gedung', FILTER_SANITIZE_NUMBER_INT),
            'id_spp'    => $spp['id'],
            'nama_spp'  => $spp['nama'],
            'biaya_spp' => $spp['biaya'],
            'biaya_uts' => $this->request->getVar('biaya_uts', FILTER_SANITIZE_NUMBER_INT),
            'biaya_uas' => $this->request->getVar('biaya_uas', FILTER_SANITIZE_NUMBER_INT),
            'biaya_ldkm' => $this->request->getVar('biaya_ldkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_mbkm' => $this->request->getVar('biaya_mbkm', FILTER_SANITIZE_NUMBER_INT),
            'biaya_bimbingan_skripsi' => $this->request->getVar('biaya_bimbingan_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_seminar_proposal'  => $this->request->getVar('biaya_seminar_proposal', FILTER_SANITIZE_NUMBER_INT),
            'biaya_sidang_skripsi'    => $this->request->getVar('biaya_sidang_skripsi', FILTER_SANITIZE_NUMBER_INT),
            'biaya_yudisium' => $this->request->getVar('biaya_yudisium', FILTER_SANITIZE_NUMBER_INT),
            'biaya_wisuda'   => $this->request->getVar('biaya_wisuda', FILTER_SANITIZE_NUMBER_INT),
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function updateStatusLulus($id = null)
    {
        $rules = [
            'tahun_akademik_lulus' => 'required',
            'persetujuan' => 'required',
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
        $tahun_akademik_lulus = model('TahunAkademik')->find($this->request->getVar('tahun_akademik_lulus'));
        $data = [
            'status' => 'Lulus',
            'id_tahun_akademik_lulus'   => $tahun_akademik_lulus['id'],
            'tahun_akademik_lulus'      => $tahun_akademik_lulus['tahun_akademik'],
            'tipe_tahun_akademik_lulus' => $tahun_akademik_lulus['tipe'],
        ];

        // model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Berhasil dinyatakan lulus',
            'route'   => $this->base_route,
        ]);
    }

    public function delete($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $gambar = $this->upload_path . $find_data['gambar'];
        if (is_file($gambar)) unlink($gambar);

        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }

    public function naikkanSemester()
    {
        $mahasiswa = model($this->model_name)
        ->where([
            'id_role' => 5,
            'status'  => 'Aktif',
        ])
        ->findAll();

        $data = [];
        foreach ($mahasiswa as $v) {
            $data[] = [
                'id'       => $v['id'],
                'semester' => (int)$v['semester'] + 1,
            ];
        }

        if ($data) {
            model($this->model_name)->updateBatch($data, 'id');
        }

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Semester berhasil dinaikkan',
            'route'   => $this->base_route,
        ]);
    }
}
