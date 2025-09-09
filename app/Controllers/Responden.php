<?php

namespace App\Controllers;

class Responden extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'responden';
        $this->model_name  = str_replace(' ', '', ucwords(str_replace('_', ' ', $this->base_name)));
        $this->upload_path = dirUpload() . $this->base_name . '/';
    }

    /*--------------------------------------------------------------
    # Front-End
    --------------------------------------------------------------*/
    public function main()
    {
        $slug = $this->request->getVar('pertanyaan');
        $data_pertanyaan = model('Pertanyaan')->where('slug', $slug)->first();
        $responden = model('Responden')->where('id_pertanyaan', $data_pertanyaan['id'])->findAll();

        $data = [
            'responden' => $responden,
            'title'      => ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/main', $data);
        return view('dashboard/header', $view);
    }

    public function new()
    {
        $slug = $this->request->getVar('pertanyaan');
        $data_pertanyaan = model('Pertanyaan')->where('slug', $slug)->first();
        $data = [
            'data' => $data_pertanyaan,
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'    => $data_pertanyaan['judul'],
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function create()
    {
        $data_pertanyaan = model('Pertanyaan')->find($this->request->getVar('pertanyaan'));
        $json_pertanyaan = json_decode($data_pertanyaan['json_pertanyaan'], true);

        // Lolos Validasi
        $jawaban = $this->request->getVar('jawaban');
        $json_jawaban = [];
        foreach ($jawaban as $key => $v) {
            $pertanyaan = $json_pertanyaan[$key+1]['pertanyaan'] ?? '';
            $json_jawaban[$key+1] = [
                'pertanyaan' => $pertanyaan,
                'jawaban'    => $v,
            ];
        }

        $data = [
            'id_pertanyaan' => $data_pertanyaan['id'],
            'id_user' => userSession('id'),
            'nama_role_user' => userSession('nama_role'),
            'nama_user' => userSession('nama'),
            'jenjang_program_studi' => userSession('jenjang_program_studi'),
            'nama_program_studi' => userSession('nama_program_studi'),
            'singkatan_program_studi' => userSession('singkatan_program_studi'),
            'json_jawaban' => json_encode($json_jawaban),
        ];

        model($this->model_name)->insert($data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Terima kasih atas jawaban Anda',
            'route'   => base_url(userSession('slug_role')) . '/dashboard',
        ]);
    }
}
