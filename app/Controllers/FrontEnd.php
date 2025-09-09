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

    public function permintaanLegalisir()
    {
        $data = [
            'title'    => 'Permintaan Legalisir',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/permintaan_legalisir', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function permintaanLegalisirDetail()
    {
        $email = $this->request->getVar('email', FILTER_SANITIZE_EMAIL);
        $find_data = model('PermintaanLegalisir')->where('email', $email)->first();
        if (! $find_data) {
            return redirect()->to(base_url('permintaan-legalisir'))->with('message',
            '<script>
            Swal.fire({
                icon: "error",
                title: "Permintaan tidak ditemukan!",
                showConfirmButton: false,
                timer: 2500,
                timerProgressBar: true,
            });
            </script>');
        }

        $data = [
            'title' => 'Detail Permintaan Legalisir',
            'data'  => $find_data,
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/detail_permintaan_legalisir', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function pendaftaranMahasiswa()
    {
        $data = [
            'title'    => 'Formulir Pendaftaran Mahasiswa',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/pendaftaran_mahasiswa', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function pendaftaranMahasiswaDetail()
    
    {
        $email = $this->request->getVar('email', FILTER_SANITIZE_EMAIL);

        $find_data = model('Users')
        ->where('email', $email)
        ->whereIn('status', ['Menunggu Konfirmasi', 'Ditolak'])
        ->first();
        if (! $find_data) {
            return redirect()->to(base_url('pendaftaran-mahasiswa'))->with('message',
            '<script>
            Swal.fire({
                icon: "error",
                title: "Pendaftar mahasiswa tidak ditemukan!",
                showConfirmButton: false,
                timer: 2500,
                timerProgressBar: true,
            });
            </script>');
        }
        
        $data = [
            'title' => 'Detail Pendaftar Mahasiswa - ' . $find_data['nama'],
            'data'  => $find_data,
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/detail_pendaftaran_mahasiswa', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function registerDosen()
    {
        $data = [
            'title'    => 'Register Dosen',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/register_dosen', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function registerTendik()
    {
        $data = [
            'title'    => 'Register Tendik',
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/register_tendik', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }
}
