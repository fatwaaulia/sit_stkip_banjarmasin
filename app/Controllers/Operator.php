<?php

namespace App\Controllers;

class Operator extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'operator';
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
    public function update()
    {
        $rules = [
            'operator_kerja' => 'permit_empty',
            'operator_kemahasiswaan' => 'permit_empty',
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
        $operator_kerja = $this->request->getVar('operator_kerja');
        if ($operator_kerja) {
            $dosen_operator_kerja = model('Users')->find($operator_kerja);
            $role_operator_kerja = model('Role')->find(19);
    
            $multi_role_dosen_operator_kerja = json_decode($dosen_operator_kerja['multi_role'], true);
            $multi_role_dosen_operator_kerja[$role_operator_kerja['id']] = [
                'nama_role' => $role_operator_kerja['nama'],
                'slug_role' => $role_operator_kerja['slug'],
            ];

            $data = [
                'multi_role' => json_encode($multi_role_dosen_operator_kerja),
            ];
            model('Users')->update($dosen_operator_kerja['id'], $data);
        } else {
            $dosen = model('Users')->where('id_role', 4)->findAll();
            foreach ($dosen as $v) {
                $multi_role = array_keys((array) json_decode($v['multi_role'], true)) ?? [];
                if (! in_array(19, $multi_role)) continue;

                $multi_role_dosen_operator_kerja = json_decode($v['multi_role'], true);
                unset($multi_role_dosen_operator_kerja[19]);

                $data = [
                    'multi_role' => json_encode($multi_role_dosen_operator_kerja),
                ];
                model('Users')->update($v['id'], $data);
            }
        }

        $operator_kemahasiswaan = $this->request->getVar('operator_kemahasiswaan');
        if ($operator_kemahasiswaan) {
            $dosen_operator_kemahasiswaan = model('Users')->find($operator_kemahasiswaan);
            $role_operator_kemahasiswaan = model('Role')->find(20);
    
            $multi_role_dosen_operator_kemahasiswaan = json_decode($dosen_operator_kemahasiswaan['multi_role'], true);
            $multi_role_dosen_operator_kemahasiswaan[$role_operator_kemahasiswaan['id']] = [
                'nama_role' => $role_operator_kemahasiswaan['nama'],
                'slug_role' => $role_operator_kemahasiswaan['slug'],
            ];

            $data = [
                'multi_role' => json_encode($multi_role_dosen_operator_kemahasiswaan),
            ];
            model('Users')->update($dosen_operator_kemahasiswaan['id'], $data);
        } else {
            $dosen = model('Users')->where('id_role', 4)->findAll();
            foreach ($dosen as $v) {
                $multi_role = array_keys((array) json_decode($v['multi_role'], true)) ?? [];
                if (! in_array(20, $multi_role)) continue;

                $multi_role_dosen_operator_kemahasiswaan = json_decode($v['multi_role'], true);
                unset($multi_role_dosen_operator_kemahasiswaan[20]);

                $data = [
                    'multi_role' => json_encode($multi_role_dosen_operator_kemahasiswaan),
                ];
                model('Users')->update($v['id'], $data);
            }
        }

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }
}
