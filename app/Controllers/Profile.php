<?php

namespace App\Controllers;

class Profile extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'profile';
        $this->model_name  = 'Users';
        $this->upload_path = dirUpload() . 'users/';
    }

    /*--------------------------------------------------------------
    # Front-End
    --------------------------------------------------------------*/
    public function profilev1()
    {
        $id = userSession('id');

        $data = [
            'base_api' => $this->base_api,
            'data'     => model($this->model_name)->find($id),
            'title'    => 'Profil',
        ];
        
        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/v1', $data);
        return view('dashboard/header', $view);
    }

    public function dosen()
    {
        $id = userSession('id');

        $data = [
            'base_api' => $this->base_api,
            'data'     => model($this->model_name)->find($id),
            'title'    => 'Profil',
        ];
        
        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/dosen', $data);
        return view('dashboard/header', $view);
    }

    public function tendik()
    {
        $id = userSession('id');

        $data = [
            'base_api' => $this->base_api,
            'data'     => model($this->model_name)->find($id),
            'title'    => 'Profil',
        ];
        
        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/tendik', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function updateProfilev1()
    {
        $id = userSession('id');
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'foto'     => 'max_size[foto,2048]|ext_in[foto,png,jpg,jpeg]|mime_in[foto,image/png,image/jpeg]|is_image[foto]',
            'nama'     => 'required',
            'alamat'   => 'max_length[255]',
            'no_hp'    => 'permit_empty|numeric|min_length[10]|max_length[20]',
            'username' => "required|alpha_numeric|is_unique[users.username,id,$id]",
        ];
        if (!$this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $foto = $this->request->getFile('foto');
        if ($foto->isValid()) {
            $filename_foto = $find_data['foto'] ?: $foto->getRandomName();
            if ($foto->getExtension() != 'jpg') {
                $filename_foto = str_replace($foto->getExtension(), 'jpg', $filename_foto);
            }
            compressConvertImage($foto, $this->upload_path, $filename_foto);
        } else {
            $filename_foto = $find_data['foto'];
        }

        $data = [
            'nama'          => ucwords($this->request->getVar('nama')),
            'foto'          => $filename_foto,
            'jenis_kelamin' => $this->request->getVar('jenis_kelamin'),
            'alamat'        => $this->request->getVar('alamat'),
            'no_hp'         => $this->request->getVar('no_hp'),
            'username'      => $this->request->getVar('username'),
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function updateProfileDosen()
    {
        $id = userSession('id');
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'foto'     => 'max_size[foto,2048]|ext_in[foto,png,jpg,jpeg]|mime_in[foto,image/png,image/jpeg]|is_image[foto]',
            'nomor_identitas' => "required|is_unique[users.nomor_identitas,id,$id]",
            'nama'            => 'required',
            'jenis_kelamin'   => 'required',
            'tempat_lahir'    => 'required',
            'tanggal_lahir'   => 'required',
            'alamat'          => 'required',
            'jabatan_fungsional' => 'required',
            'jabatan_struktural' => 'required',
            'program_studi'    => 'required',
            'motto_kerja'       => 'required',
            'password' => 'permit_empty|min_length[3]|matches[passconf]',
            'passconf' => 'permit_empty|min_length[3]|matches[password]',
            'email'    => "required|valid_email|is_unique[users.email,id,$id]",
            'no_hp'    => 'required|numeric|min_length[10]|max_length[20]',
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
        $foto = $this->request->getFile('foto');
        if ($foto->isValid()) {
            $filename_foto = $find_data['foto'] ?: $foto->getRandomName();
            if ($foto->getExtension() != 'jpg') {
                $filename_foto = str_replace($foto->getExtension(), 'jpg', $filename_foto);
            }
            compressConvertImage($foto, $this->upload_path, $filename_foto);
        } else {
            $filename_foto = $find_data['foto'];
        }

        $program_studi = model('ProgramStudi')->find($this->request->getVar('program_studi'));
        $password = trim($this->request->getVar('password'));
        $data = [
            'foto'          => $filename_foto,
            'nomor_identitas' => $this->request->getVar('nomor_identitas'),
            'nama'            => $this->request->getVar('nama'),
            'jenis_kelamin'   => $this->request->getVar('jenis_kelamin'),
            'tempat_lahir'    => $this->request->getVar('tempat_lahir'),
            'tanggal_lahir'   => $this->request->getVar('tanggal_lahir'),
            'alamat'          => $this->request->getVar('alamat'),
            'email'         => $this->request->getVar('email', FILTER_SANITIZE_EMAIL),
            'no_hp'         => $this->request->getVar('no_hp'),

            'jabatan_fungsional' => $this->request->getVar('jabatan_fungsional'),
            'jabatan_struktural' => $this->request->getVar('jabatan_struktural'),
            'motto_kerja' => $this->request->getVar('motto_kerja'),

            'id_program_studi'        => $program_studi['id'],
            'jenjang_program_studi'   => $program_studi['jenjang'],
            'nama_program_studi'      => $program_studi['nama'],
            'singkatan_program_studi' => $program_studi['singkatan'],

            'password'      => $password != '' ? password_hash($password, PASSWORD_DEFAULT) : $find_data['password'],
            'password_asli' => $password != '' ? $password : $find_data['password_asli'],
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function updateProfileTendik()
    {
        $id = userSession('id');
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'foto'     => 'max_size[foto,2048]|ext_in[foto,png,jpg,jpeg]|mime_in[foto,image/png,image/jpeg]|is_image[foto]',
            'nomor_identitas' => "required|is_unique[users.nomor_identitas,id,$id]",
            'nama'            => 'required',
            'jenis_kelamin'   => 'required',
            'tempat_lahir'    => 'required',
            'tanggal_lahir'   => 'required',
            'alamat'          => 'required',
            'jabatan_fungsional' => 'required',
            'jabatan_struktural' => 'required',
            'motto_kerja'       => 'required',
            'password' => 'permit_empty|min_length[3]|matches[passconf]',
            'passconf' => 'permit_empty|min_length[3]|matches[password]',
            'email'    => "required|valid_email|is_unique[users.email,id,$id]",
            'no_hp'    => 'required|numeric|min_length[10]|max_length[20]',
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
        $foto = $this->request->getFile('foto');
        if ($foto->isValid()) {
            $filename_foto = $find_data['foto'] ?: $foto->getRandomName();
            if ($foto->getExtension() != 'jpg') {
                $filename_foto = str_replace($foto->getExtension(), 'jpg', $filename_foto);
            }
            compressConvertImage($foto, $this->upload_path, $filename_foto);
        } else {
            $filename_foto = $find_data['foto'];
        }

        $password = trim($this->request->getVar('password'));
        $data = [
            'foto'          => $filename_foto,
            'nomor_identitas' => $this->request->getVar('nomor_identitas'),
            'nama'            => $this->request->getVar('nama'),
            'jenis_kelamin'   => $this->request->getVar('jenis_kelamin'),
            'tempat_lahir'    => $this->request->getVar('tempat_lahir'),
            'tanggal_lahir'   => $this->request->getVar('tanggal_lahir'),
            'alamat'          => $this->request->getVar('alamat'),
            'email'         => $this->request->getVar('email', FILTER_SANITIZE_EMAIL),
            'no_hp'         => $this->request->getVar('no_hp'),

            'jabatan_fungsional' => $this->request->getVar('jabatan_fungsional'),
            'jabatan_struktural' => $this->request->getVar('jabatan_struktural'),
            'motto_kerja' => $this->request->getVar('motto_kerja'),

            'password'      => $password != '' ? password_hash($password, PASSWORD_DEFAULT) : $find_data['password'],
            'password_asli' => $password != '' ? $password : $find_data['password_asli'],
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function updatePassword()
    {
        $id = userSession('id');
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'oldpass'  => 'required',
            'password' => 'required|min_length[3]|matches[passconf]',
            'passconf' => 'required|min_length[3]|matches[password]',
        ];
        if (!$this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $oldpass = trim($this->request->getVar('oldpass'));
        $password = trim($this->request->getVar('password'));

        if (! password_verify($oldpass, $find_data['password'])) {
            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Password saat ini salah!',
            ]);
        }

        $data = [
            'password' => password_hash($password, PASSWORD_DEFAULT),
            'password_asli' => $password != '' ? $password : $find_data['password_asli'],
        ];

        model($this->model_name)->update($id, $data);
        session()->remove(['isLogin', 'user']);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Password berhasil diubah. Silakan login kembali.',
            'route'   => base_url('login/admin'),
        ]);
    }

    public function deletePhoto()
    {
        $id = userSession('id');
        $find_data = model($this->model_name)->find($id);

        $foto = $this->upload_path . $find_data['foto'];
        if (is_file($foto)) unlink($foto);

        model($this->model_name)->update($id, ['foto' => '']);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Foto berhasil dihapus',
        ]);
    }
}
