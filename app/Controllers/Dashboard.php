<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    public function superadmin()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/superadmin', $data);
        return view('dashboard/header', $view);
    }

    public function adminUtama()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/superadmin', $data);
        return view('dashboard/header', $view);
    }

    public function keuangan()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/keuangan', $data);
        return view('dashboard/header', $view);
    }

    public function wakaAkademik()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/waka_akademik', $data);
        return view('dashboard/header', $view);
    }

    public function stafAkademik()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/staf_akademik', $data);
        return view('dashboard/header', $view);
    }

    public function dosen()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/dosen', $data);
        return view('dashboard/header', $view);
    }

    public function mahasiswa()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/mahasiswa', $data);
        return view('dashboard/header', $view);
    }

    public function pimpinan()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/pimpinan', $data);
        return view('dashboard/header', $view);
    }

    public function kaprodi()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/kaprodi', $data);
        return view('dashboard/header', $view);
    }

    public function wakaKemahasiswaanKerjasama()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/waka_kemahasiswaan_kerjasama', $data);
        return view('dashboard/header', $view);
    }

    public function lpm()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/lpm', $data);
        return view('dashboard/header', $view);
    }

    public function lppm()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/lppm', $data);
        return view('dashboard/header', $view);
    }

    public function stafAdministrasi()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/staf_administrasi', $data);
        return view('dashboard/header', $view);
    }

    public function pustakawan()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/pustakawan', $data);
        return view('dashboard/header', $view);
    }

    public function biroAlumni()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/biroalumni', $data);
        return view('dashboard/header', $view);
    }

    public function uptPlp()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/uptplp', $data);
        return view('dashboard/header', $view);
    }

    public function tendik()
    {
        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/tendik', $data);
        return view('dashboard/header', $view);
    }
}
