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

    public function dosen()
    {
        $pertanyaan = model('Pertanyaan')->findAll();
        foreach ($pertanyaan as $v) {
            $responden = model('Responden')
            ->where([
                'id_pertanyaan' => $v['id'],
                'id_user' => userSession('id'),
            ])
            ->first();
            if (! $responden) {
                $tautan_pertanyaan = base_url(userSession('slug_role')) . '/responden/new?pertanyaan=' . $v['slug'];
                return redirect()->to($tautan_pertanyaan);
            }
        }

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

    public function tendik()
    {
        $pertanyaan = model('Pertanyaan')->findAll();
        foreach ($pertanyaan as $v) {
            $responden = model('Responden')
            ->where([
                'id_pertanyaan' => $v['id'],
                'id_user' => userSession('id'),
            ])
            ->first();
            if (! $responden) {
                $tautan_pertanyaan = base_url(userSession('slug_role')) . '/responden/new?pertanyaan=' . $v['slug'];
                return redirect()->to($tautan_pertanyaan)->with('message',
                '<script>
                Swal.fire({
                    icon: "info",
                    title: "Silakan beri jawaban Anda",
                    showConfirmButton: false,
                    timer: 2500,
                    timerProgressBar: true,
                });
                </script>');
            }
        }

        $data['title'] = 'Dashboard';

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view('dashboard/tendik', $data);
        return view('dashboard/header', $view);
    }
}
