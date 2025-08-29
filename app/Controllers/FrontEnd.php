<?php

namespace App\Controllers;

class FrontEnd extends BaseController
{
    protected $app_settings;

    public function __construct()
    {
        if (strpos($_SERVER['HTTP_HOST'], 'www.') === 0) {
            $url = 'http://' . substr($_SERVER['HTTP_HOST'], 4) . $_SERVER['REQUEST_URI'];
            header('Location: ' . $url);
            exit();
        }

        // if (!isset($_SERVER['HTTPS']) || $_SERVER['HTTPS'] !== 'on') {
        //     $url = 'https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        //     header('Location: ' . $url);
        //     exit();
        // }

        $this->app_settings = model('AppSettings')->find(1);
    }

    public function beranda()
    {
        $data['title'] = $this->app_settings['nama_aplikasi'];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/beranda', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function kalenderAkademik()
    {
        $data = [
            'kalender_akademik' => model('KalenderAkademik')->orderBy('id DESC')->limit(6)->findAll(),
            'kalender_akademik_terbaru' => model('KalenderAkademik')->orderBy('id DESC')->first(),
            'title' => 'Kalender Akademik',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/kalender_akademik', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function jadwalKuliah()
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data' => base_url('api/jadwal-kuliah') . $query,
            'title'    => 'Jadwal Kuliah',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/jadwal_kuliah', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function jadwalKegiatan()
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data' => base_url('api/jadwal-kegiatan') . $query,
            'title'    => 'Jadwal Kegiatan',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/jadwal_kegiatan', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }
}
