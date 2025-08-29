<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    public function admin()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/admin', $data);
        return view('dashboard/header', $view);
    }

    public function keuangan()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/keuangan', $data);
        return view('dashboard/header', $view);
    }

    public function mahasiswa()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/mahasiswa', $data);
        return view('dashboard/header', $view);
    }
}
