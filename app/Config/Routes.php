<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->set404Override(
    function() {
        $data['title'] = '404';
        $data['content'] = view('errors/error_404');

        if (userSession()) {
            $data['sidebar'] = view('dashboard/sidebar');
            return view('dashboard/header', $data);
        } else {
            $uri = service('uri');
            $uri->setSilent();
            $segment_1 = $uri->getSegment(1);
            $array_slug_role = model('Role')->findColumn('slug');
            if (in_array($segment_1, $array_slug_role)) {
                redirect()->route('login')->send();
                exit;
            }

            $data['navbar'] = view('frontend/components/navbar');
            $data['footer'] = view('frontend/components/footer');
            return view('frontend/header', $data);
        }
    }
);

/*--------------------------------------------------------------
  # Front-End
--------------------------------------------------------------*/
$routes->get('/', 'Auth::login');

$routes->get('permintaan-legalisir', 'FrontEnd::permintaanLegalisir');
$routes->post('api/permintaan-legalisir/create', 'PermintaanLegalisir::create');
$routes->get('permintaan-legalisir/detail', 'FrontEnd::permintaanLegalisirDetail');

$routes->get('pendaftaran-mahasiswa', 'FrontEnd::pendaftaranMahasiswa');
$routes->post('api/pendaftar-mahasiswa/create', 'PendaftarMahasiswa::create');
$routes->get('pendaftaran-mahasiswa/detail', 'FrontEnd::pendaftaranMahasiswaDetail');

$routes->get('register-dosen', 'FrontEnd::registerDosen');
$routes->post('api/dosen/create', 'Dosen::create');

$routes->get('register-tendik', 'FrontEnd::registerTendik');
$routes->post('api/tendik/create', 'Tendik::create');

$routes->post('session/set/timezone', function() {
    $timezone = service('request')->getVar('timezone');
    session()->set('timezone', $timezone);
});

/*--------------------------------------------------------------
  # Autentikasi
--------------------------------------------------------------*/
// login
$routes->get('login', 'Auth::login');
$routes->post('api/login', 'Auth::loginProcess');
$routes->get('logout', 'Auth::logout');
// lupa password
$routes->get('password/forgot', 'Auth::forgotPassword');
$routes->get('password/forgot', 'Auth::forgotPassword');
$routes->post('api/password/forgot', 'Auth::forgotPasswordSave', ['filter' => 'csrf']);
$routes->get('password/reset/(:segment)', 'Auth::resetPassword/$1');
$routes->post('api/password/reset/(:segment)', 'Auth::resetPasswordSave/$1', ['filter' => 'csrf']);
// register
$routes->get('register', 'Auth::register');
$routes->post('api/register', 'Auth::registerProcess', ['filter' => 'csrf']);
// email layout
$routes->get('email-layout', 'AppSettings::emailLayout');

/*--------------------------------------------------------------
  # Menu Dashboard dan Profil
--------------------------------------------------------------*/
$id_role   = userSession('id_role');
$id_roles   = userSession('id_roles') ?: [];
$slug_role = userSession('slug_role');

if (userSession()) {
    $camelcase_slug_role = lcfirst(str_replace(' ', '', ucwords(str_replace('-', ' ', strtolower($slug_role)))));
    $routes->get("$slug_role/dashboard", "Dashboard::$camelcase_slug_role", ['filter' => 'EnsureLogin']);
}

if ($id_role == 4) {
    $routes->get("$slug_role/profile", "Profile::dosen", ['filter' => 'EnsureLogin']);
    $routes->group("api/profile", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update', 'Profile::updateProfileDosen');
        $routes->post('delete/photo', 'Profile::deletePhoto');
    });
}

if ($id_role == 16) {
    $routes->get("$slug_role/profile", "Profile::tendik", ['filter' => 'EnsureLogin']);
    $routes->group("api/profile", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update', 'Profile::updateProfileTendik');
        $routes->post('delete/photo', 'Profile::deletePhoto');
    });
}

if (! in_array($id_role, [4, 16])) {
    $routes->get("$slug_role/profile", "Profile::profilev1", ['filter' => 'EnsureLogin']);
    $routes->group("api/profile", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update', 'Profile::updateProfilev1');
        $routes->post('update/password', 'Profile::updatePassword');
        $routes->post('delete/photo', 'Profile::deletePhoto');
    });
}

/*--------------------------------------------------------------
  # Menu Sidebar
--------------------------------------------------------------*/
if (in_array(userSession('id_role'), [1, 17])) {
    $routes->group("$slug_role/app-settings", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'AppSettings::edit');
    });
    $routes->group("api/app-settings", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update/(:segment)', 'AppSettings::update/$1');
    });
}

if (in_array(userSession('id_role'), [1, 17])) {
    $routes->group("$slug_role/maintenance", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('email', 'Maintenance::email');
    });
    $routes->group("api/maintenance", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('email', 'Maintenance::sendEmail');
    });
}

if (in_array(userSession('id_role'), [1, 17])) {
    $routes->get("$slug_role/log-login", 'LogLogin::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/log-login', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LogLogin::index');
        $routes->post('delete/(:segment)', 'LogLogin::delete/$1');
    });
}

if (in_array($id_role, [1, 17, 4, 16])) {
    $routes->group("$slug_role/pertanyaan", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Pertanyaan::main');
        $routes->get('new', 'Pertanyaan::new');
        $routes->get('edit/(:segment)', 'Pertanyaan::edit/$1');
    });
    $routes->group('api/pertanyaan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Pertanyaan::index');
        $routes->post('create', 'Pertanyaan::create');
        $routes->post('update/(:segment)', 'Pertanyaan::update/$1');
        $routes->post('delete/(:segment)', 'Pertanyaan::delete/$1');
    });
}

if (in_array($id_role, [1, 17, 4, 16])) {
    $routes->group("$slug_role/responden", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Responden::main');
        $routes->get('new', 'Responden::new');
    });
    $routes->group('api/responden', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Responden::index');
        $routes->post('create', 'Responden::create');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Keluar Masuk Uang'))) {
    $routes->group("$slug_role/keuangan", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Keuangan::main');
        $routes->get('new/uang-masuk', 'Keuangan::newUangMasuk/$1');
        $routes->get('new/uang-keluar', 'Keuangan::newUangKeluar/$1');
        $routes->get('edit/uang-masuk/(:segment)', 'Keuangan::editUangMasuk/$1');
        $routes->get('edit/uang-keluar/(:segment)', 'Keuangan::editUangKeluar/$1');
    });
    $routes->group('api/keuangan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Keuangan::index');
        $routes->post('create', 'Keuangan::create');
        $routes->post('update/(:segment)', 'Keuangan::update/$1');
        $routes->post('delete/(:segment)', 'Keuangan::delete/$1');
        $routes->get('export-excel', 'Keuangan::exportExcel');
        $routes->get('grafik', 'Keuangan::grafikKeuangan');
        $routes->get('sumber-pemasukan-terbesar/grafik', 'Keuangan::grafikSumberPemasukanTerbesar');
        $routes->get('sumber-pengeluaran-terbesar/grafik', 'Keuangan::grafikSumberPengeluaranTerbesar');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Log Keuangan'))) {
    $routes->group("$slug_role/log-keuangan", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LogKeuangan::main');
    });
    $routes->group('api/log-keuangan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LogKeuangan::index');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Perolehan Dana'))) {
    $routes->group("$slug_role/perolehan-dana", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PerolehanDana::main');
    });
    $routes->group('api/perolehan-dana', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('export-excel', 'PerolehanDana::exportExcel');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Penggunaan Dana'))) {
    $routes->group("$slug_role/penggunaan-dana", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PenggunaanDana::main');
    });
    $routes->group('api/penggunaan-dana', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('export-excel', 'PenggunaanDana::exportExcel');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Neraca'))) {
    $routes->group("$slug_role/neraca", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Neraca::main');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Penyusutan Inventaris'))) {
    $routes->group("$slug_role/penyusutan-inventaris", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PenyusutanInventaris::main');
    });
    $routes->group('api/penyusutan-inventaris', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PenyusutanInventaris::index');
        $routes->post('create', 'PenyusutanInventaris::create');
        $routes->post('update/(:segment)', 'PenyusutanInventaris::update/$1');
        $routes->post('delete/(:segment)', 'PenyusutanInventaris::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tagihan Mahasiswa'))) {
    $routes->group("$slug_role/tagihan-mahasiswa", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TagihanMahasiswa::main');
        $routes->get('new', 'TagihanMahasiswa::new');
        $routes->get('edit/(:segment)', 'TagihanMahasiswa::edit/$1');
    });
    $routes->group('api/tagihan-mahasiswa', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TagihanMahasiswa::index');
        $routes->post('create', 'TagihanMahasiswa::create');
        $routes->post('update/(:segment)', 'TagihanMahasiswa::update/$1');
        $routes->post('delete/(:segment)', 'TagihanMahasiswa::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pembayaran Mahasiswa'))) {
    $routes->group("$slug_role/pembayaran-mahasiswa", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PembayaranMahasiswa::main');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Perencanaan Pimpinan'))) {
    $routes->get("$slug_role/perencanaan-pimpinan", 'PerencanaanPimpinan::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/perencanaan-pimpinan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PerencanaanPimpinan::index');
        $routes->post('create', 'PerencanaanPimpinan::create');
        $routes->post('update/(:segment)', 'PerencanaanPimpinan::update/$1');
        $routes->post('delete/(:segment)', 'PerencanaanPimpinan::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Laporan Pertanggungjawaban'))) {
    $routes->get("$slug_role/laporan-pertanggungjawaban", 'LaporanPertanggungjawaban::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/laporan-pertanggungjawaban', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LaporanPertanggungjawaban::index');
        $routes->post('create', 'LaporanPertanggungjawaban::create');
        $routes->post('update/(:segment)', 'LaporanPertanggungjawaban::update/$1');
        $routes->post('delete/(:segment)', 'LaporanPertanggungjawaban::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Kalender Akademik'))) {
    $routes->get("$slug_role/kalender-akademik", 'KalenderAkademik::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/kalender-akademik', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'KalenderAkademik::index');
        $routes->post('create', 'KalenderAkademik::create');
        $routes->post('update/(:segment)', 'KalenderAkademik::update/$1');
        $routes->post('delete/(:segment)', 'KalenderAkademik::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Dosen Pendamping'))) {
    $routes->group("$slug_role/dosen-pendamping", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'DosenPendamping::main');
        $routes->get('new', 'DosenPendamping::new');
        $routes->get('edit/(:segment)', 'DosenPendamping::edit/$1');
    });
    $routes->group('api/dosen-pendamping', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'DosenPendamping::index');
        $routes->post('create', 'DosenPendamping::create');
        $routes->post('update/(:segment)', 'DosenPendamping::update/$1');
        $routes->post('delete/(:segment)', 'DosenPendamping::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pembimbing Skripsi'))) {
    $routes->get("$slug_role/pembimbing-skripsi", 'PembimbingSkripsi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/pembimbing-skripsi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PembimbingSkripsi::index');
        $routes->post('create', 'PembimbingSkripsi::create');
        $routes->post('update/(:segment)', 'PembimbingSkripsi::update/$1');
        $routes->post('delete/(:segment)', 'PembimbingSkripsi::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('SPMI'))) {
    $routes->get("$slug_role/spmi", 'Spmi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/spmi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Spmi::index');
        $routes->post('create', 'Spmi::create');
        $routes->post('update/(:segment)', 'Spmi::update/$1');
        $routes->post('delete/(:segment)', 'Spmi::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('LKPT'))) {
    $routes->get("$slug_role/lkpt", 'Lkpt::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/lkpt', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Lkpt::index');
        $routes->post('create', 'Lkpt::create');
        $routes->post('update/(:segment)', 'Lkpt::update/$1');
        $routes->post('delete/(:segment)', 'Lkpt::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Standar PT'))) {
    $routes->get("$slug_role/standar-pt", 'StandarPt::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/standar-pt', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'StandarPt::index');
        $routes->post('create', 'StandarPt::create');
        $routes->post('update/(:segment)', 'StandarPt::update/$1');
        $routes->post('delete/(:segment)', 'StandarPt::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Jadwal Kuliah'))) {
    $routes->get("$slug_role/jadwal-kuliah", 'JadwalKuliah::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/jadwal-kuliah', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'JadwalKuliah::index');
        $routes->post('create', 'JadwalKuliah::create');
        $routes->post('delete/(:segment)', 'JadwalKuliah::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Jadwal Kegiatan'))) {
    $routes->get("$slug_role/jadwal-kegiatan", 'JadwalKegiatan::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/jadwal-kegiatan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'JadwalKegiatan::index');
        $routes->post('create', 'JadwalKegiatan::create');
        $routes->post('update/(:segment)', 'JadwalKegiatan::update/$1');
        $routes->post('delete/(:segment)', 'JadwalKegiatan::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pendaftar Mahasiswa'))) {
    $routes->group("$slug_role/pendaftar-mahasiswa", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PendaftarMahasiswa::main');
        $routes->get('edit/(:segment)', 'PendaftarMahasiswa::edit/$1');
    });
    $routes->group('api/pendaftar-mahasiswa', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PendaftarMahasiswa::index');
        $routes->post('update/(:segment)', 'PendaftarMahasiswa::update/$1');
        $routes->post('delete/(:segment)', 'PendaftarMahasiswa::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Mahasiswa'))) {
    $routes->group("$slug_role/mahasiswa", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Mahasiswa::main');
        $routes->get('new', 'Mahasiswa::new');
        $routes->get('edit/(:segment)', 'Mahasiswa::edit/$1');
    });
    $routes->group('api/mahasiswa', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Mahasiswa::index');
        $routes->post('create', 'Mahasiswa::create');
        $routes->post('update/(:segment)', 'Mahasiswa::update/$1');
        $routes->post('delete/(:segment)', 'Mahasiswa::delete/$1');
        $routes->get('naikkan-semester', 'Mahasiswa::naikkanSemester');
        $routes->post('update/(:segment)/status-lulus', 'Mahasiswa::updateStatusLulus/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Mahasiswa Cuti / DO'))) {
    $routes->get("$slug_role/status-mahasiswa", 'StatusMahasiswa::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/status-mahasiswa', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'StatusMahasiswa::index');
        $routes->post('create', 'StatusMahasiswa::create');
        $routes->post('update/(:segment)', 'StatusMahasiswa::update/$1');
        $routes->post('delete/(:segment)', 'StatusMahasiswa::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Mahasiswa Lulus'))) {
    $routes->group("$slug_role/mahasiswa-lulus", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'MahasiswaLulus::main');
        $routes->get('detail/(:segment)', 'MahasiswaLulus::detail/$1');
    });
    $routes->group('api/mahasiswa-lulus', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'MahasiswaLulus::index');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Dosen'))) {
    $routes->group("$slug_role/dosen", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Dosen::main');
        $routes->get('new', 'Dosen::new');
        $routes->get('edit/(:segment)', 'Dosen::edit/$1');
    });
    $routes->group('api/dosen', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Dosen::index');
        $routes->post('update/(:segment)', 'Dosen::update/$1');
        $routes->post('delete/(:segment)', 'Dosen::delete/$1');
        $routes->post('foto/delete/(:segment)', 'Users::hapusFoto/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tendik'))) {
    $routes->group("$slug_role/tendik", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Tendik::main');
        $routes->get('new', 'Tendik::new');
        $routes->get('edit/(:segment)', 'Tendik::edit/$1');
    });
    $routes->group('api/tendik', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Tendik::index');
        $routes->post('update/(:segment)', 'Tendik::update/$1');
        $routes->post('delete/(:segment)', 'Tendik::delete/$1');
        $routes->post('foto/delete/(:segment)', 'Users::hapusFoto/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Surat Tugas Penelitian'))) {
    $routes->get("$slug_role/surat-tugas-penelitian", 'SuratTugasPenelitian::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/surat-tugas-penelitian', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'SuratTugasPenelitian::index');
        $routes->post('create', 'SuratTugasPenelitian::create');
        $routes->post('update/(:segment)', 'SuratTugasPenelitian::update/$1');
        $routes->post('delete/(:segment)', 'SuratTugasPenelitian::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tri Dharma'))) {
    $routes->group("$slug_role/tri-dharma", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TriDharma::main');
        $routes->get('new', 'TriDharma::new');
        $routes->get('edit/(:segment)', 'TriDharma::edit/$1');
    });
    $routes->group('api/tri-dharma', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TriDharma::index');
        $routes->post('create', 'TriDharma::create');
        $routes->post('update/(:segment)', 'TriDharma::update/$1');
        $routes->post('delete/(:segment)', 'TriDharma::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pengajaran'))) {
    $routes->group("$slug_role/pengajaran", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Pengajaran::main');
        $routes->get('new', 'Pengajaran::new');
        $routes->get('edit/(:segment)', 'Pengajaran::edit/$1');
    });
    $routes->group('api/pengajaran', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Pengajaran::index');
        $routes->post('create', 'Pengajaran::create');
        $routes->post('update/(:segment)', 'Pengajaran::update/$1');
        $routes->post('delete/(:segment)', 'Pengajaran::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pengembangan Kompetensi'))) {
    $routes->group("$slug_role/pengembangan-kompetensi", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PengembanganKompetensi::main');
        $routes->get('new', 'PengembanganKompetensi::new');
        $routes->get('edit/(:segment)', 'PengembanganKompetensi::edit/$1');
    });
    $routes->group('api/pengembangan-kompetensi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PengembanganKompetensi::index');
        $routes->post('create', 'PengembanganKompetensi::create');
        $routes->post('update/(:segment)', 'PengembanganKompetensi::update/$1');
        $routes->post('delete/(:segment)', 'PengembanganKompetensi::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Permintaan Legalisir'))) {
    $routes->get("$slug_role/permintaan-legalisir", 'PermintaanLegalisir::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/permintaan-legalisir', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PermintaanLegalisir::index');
        $routes->post('update/(:segment)', 'PermintaanLegalisir::update/$1');
        $routes->post('delete/(:segment)', 'PermintaanLegalisir::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Surat Peringatan'))) {
    $routes->get("$slug_role/surat-peringatan", 'SuratPeringatan::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/surat-peringatan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'SuratPeringatan::index');
        $routes->post('create', 'SuratPeringatan::create');
        $routes->post('update/(:segment)', 'SuratPeringatan::update/$1');
        $routes->post('delete/(:segment)', 'SuratPeringatan::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pencatatan Surat'))) {
    $routes->get("$slug_role/pencatatan-surat", 'PencatatanSurat::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/pencatatan-surat', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PencatatanSurat::index');
        $routes->post('create', 'PencatatanSurat::create');
        $routes->post('update/(:segment)', 'PencatatanSurat::update/$1');
        $routes->post('delete/(:segment)', 'PencatatanSurat::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Buku'))) {
    $routes->get("$slug_role/buku", 'Buku::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/buku', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Buku::index');
        $routes->post('create', 'Buku::create');
        $routes->post('update/(:segment)', 'Buku::update/$1');
        $routes->post('delete/(:segment)', 'Buku::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Buku Rusak'))) {
    $routes->get("$slug_role/buku-rusak", 'BukuRusak::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/buku-rusak', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'BukuRusak::index');
        $routes->post('create', 'BukuRusak::create');
        $routes->post('update/(:segment)', 'BukuRusak::update/$1');
        $routes->post('delete/(:segment)', 'BukuRusak::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Pengajuan Buku Baru'))) {
    $routes->get("$slug_role/pengajuan-buku-baru", 'PengajuanBukuBaru::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/pengajuan-buku-baru', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PengajuanBukuBaru::index');
        $routes->post('create', 'PengajuanBukuBaru::create');
        $routes->post('update/(:segment)', 'PengajuanBukuBaru::update/$1');
        $routes->post('delete/(:segment)', 'PengajuanBukuBaru::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Kegiatan Perpustakaan'))) {
    $routes->get("$slug_role/kegiatan-perpustakaan", 'KegiatanPerpustakaan::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/kegiatan-perpustakaan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'KegiatanPerpustakaan::index');
        $routes->post('create', 'KegiatanPerpustakaan::create');
        $routes->post('update/(:segment)', 'KegiatanPerpustakaan::update/$1');
        $routes->post('delete/(:segment)', 'KegiatanPerpustakaan::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Mahasiswa Praktik Lapangan'))) {
    $routes->get("$slug_role/mahasiswa-praktik-lapangan", 'MahasiswaPraktikLapangan::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/mahasiswa-praktik-lapangan', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'MahasiswaPraktikLapangan::index');
        $routes->post('create', 'MahasiswaPraktikLapangan::create');
        $routes->post('update/(:segment)', 'MahasiswaPraktikLapangan::update/$1');
        $routes->post('delete/(:segment)', 'MahasiswaPraktikLapangan::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tracer Studi'))) {
    $routes->get("$slug_role/tracer-studi", 'TracerStudi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/tracer-studi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TracerStudi::index');
        $routes->post('create', 'TracerStudi::create');
        $routes->post('update/(:segment)', 'TracerStudi::update/$1');
        $routes->post('delete/(:segment)', 'TracerStudi::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Laporan Promosi'))) {
    $routes->get("$slug_role/laporan-promosi", 'LaporanPromosi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/laporan-promosi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LaporanPromosi::index');
        $routes->post('create', 'LaporanPromosi::create');
        $routes->post('delete/(:segment)', 'LaporanPromosi::delete/$1');
    });
}

/*--------------------------------------------------------------
  # Master Data
--------------------------------------------------------------*/
if (array_intersect($id_roles, [1])) {
    $routes->get("$slug_role/role", 'Role::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/role', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Role::index');
        $routes->post('create', 'Role::create');
        $routes->post('update/(:segment)', 'Role::update/$1');
        $routes->post('delete/(:segment)', 'Role::delete/$1');
    });
}

if (array_intersect($id_roles, [1])) {
    $routes->group("$slug_role/users", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Users::main');
        $routes->get('new', 'Users::new');
        $routes->get('edit/(:segment)', 'Users::edit/$1');
    });
    $routes->group('api/users', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Users::index');
        $routes->post('create', 'Users::create');
        $routes->post('update/(:segment)', 'Users::update/$1');
        $routes->post('delete/(:segment)', 'Users::delete/$1');
        $routes->post('foto/delete/(:segment)', 'Users::hapusFoto/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tahun Akademik'))) {
    $routes->get("$slug_role/tahun-akademik", 'TahunAkademik::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/tahun-akademik', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TahunAkademik::index');
        $routes->post('create', 'TahunAkademik::create');
        $routes->post('update/(:segment)', 'TahunAkademik::update/$1');
        $routes->post('delete/(:segment)', 'TahunAkademik::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Program Studi'))) {
    $routes->get("$slug_role/program-studi", 'ProgramStudi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/program-studi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'ProgramStudi::index');
        $routes->post('create', 'ProgramStudi::create');
        $routes->post('update/(:segment)', 'ProgramStudi::update/$1');
        $routes->post('delete/(:segment)', 'ProgramStudi::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Tarif SPP'))) {
    $routes->get("$slug_role/tarif-spp", 'TarifSpp::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/tarif-spp', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TarifSpp::index');
        $routes->post('create', 'TarifSpp::create');
        $routes->post('update/(:segment)', 'TarifSpp::update/$1');
        $routes->post('delete/(:segment)', 'TarifSpp::delete/$1');
    });
}

if (array_intersect($id_roles, roleAccessByTitle('Master Dana'))) {
    $routes->get("$slug_role/master-dana", 'MasterDana::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/master-dana', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'MasterDana::index');
        $routes->post('create', 'MasterDana::create');
        $routes->post('update/(:segment)', 'MasterDana::update/$1');
        $routes->post('delete/(:segment)', 'MasterDana::delete/$1');
    });
}
