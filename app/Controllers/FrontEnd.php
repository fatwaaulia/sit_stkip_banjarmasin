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

    public function galeri()
    {
        $base_query = db_connect()->table('Galeri')
            ->select([
                'galeri.*',
                'user.nama as created_by',
            ])
            ->join('users user', 'user.id = galeri.created_by')
            ->orderBy('galeri.created_at DESC');
        $limit    = 8; // jumlah data per page
        $page_now = $this->request->getVar('page', FILTER_VALIDATE_INT) ?? 1;
        $offset   = $page_now ? (($page_now - 1) * $limit) : 0;

        $array_query_key = ['created_by'];

        if (array_intersect(array_keys($_GET), $array_query_key)) {
            $get_created_by = $this->request->getVar('created_by');
            if ($get_created_by) {
                $base_query->where('created_by', $get_created_by);
            }
        }

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->limit($limit, $offset)->get()->getResultArray();

        $data = [
            'title'       => 'Galeri | ' . $this->app_settings['nama_aplikasi'],
            'galeri'      => $data,
            'total_pages' => ceil($total_rows / $limit),
            'page_now'    => $page_now,
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/galeri', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function berita()
    {
        $base_query = db_connect()->table('Berita')
        ->select([
            'berita.*',
            'user.nama as nama_penulis',
        ])
        ->join('users user', 'user.id = berita.created_by')
        ->orderBy('berita.created_at DESC');
        $limit    = 4; // jumlah data per page
        $page_now = $this->request->getVar('page', FILTER_VALIDATE_INT) ?? 1;
        $offset   = $page_now ? (($page_now - 1) * $limit) : 0;

        $array_query_key = ['created_by', 'search'];

        if (array_intersect(array_keys($_GET), $array_query_key)) {
            $get_created_by = $this->request->getVar('created_by');
            if ($get_created_by) {
                $base_query->where('created_by', $get_created_by);
            }

            $get_search = $this->request->getVar('search');
            if ($get_search) {
                $base_query->like('judul', $get_search);
            }
        }

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->limit($limit, $offset)->get()->getResultArray();

        $data = [
            'berita'        => $data,
            'total_pages'   => ceil($total_rows / $limit),
            'page_now'      => $page_now,
            'search'        => $get_search ?? '',
            'berita_rekomendasi' => model('Berita', false)->orderBy('created_at', 'RANDOM')->findAll(4),
            'title'         => 'Berita | ' . $this->app_settings['nama_aplikasi'],
        ];

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/berita', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }

    public function artikel($slug)
    {
        $model_berita = model('Berita');
        $berita = $model_berita->where('slug', $slug)->first();
        if (! $berita) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }

        $data = [
            'berita'             => $berita,
            'berita_rekomendasi' => $model_berita->orderBy('created_at', 'RANDOM')->findAll(4),
            'title'       => $berita['judul'],
            'favicon'     => webFile('image', 'berita', $berita['sampul'], $berita['updated_at']),
            'description' => strip_tags($berita['konten']),
        ];

        $model_berita->update($berita['id'], ['viewed' => (int)$berita['viewed'] + 1]);

        $view['navbar'] = view('frontend/components/navbar');
        $view['content'] = view('frontend/artikel', $data);
        $view['footer'] = view('frontend/components/footer');
        return view('frontend/header', $view);
    }
}
