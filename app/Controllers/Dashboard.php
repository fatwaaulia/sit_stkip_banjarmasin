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

    public function started()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/started', $data);
        return view('dashboard/header', $view);
    }
}
