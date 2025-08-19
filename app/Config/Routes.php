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
            $data['navbar'] = view('frontend/components/navbar');
            $data['footer'] = view('frontend/components/footer');
            return view('frontend/header', $data);
        }
    }
);

/*--------------------------------------------------------------
  # Front-End
--------------------------------------------------------------*/
$routes->get('/', 'FrontEnd::beranda');

$uri = service('uri');

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
$slug_role = userSession('slug_role');

if (in_array($id_role, [1, 2])) {
    $routes->get("$slug_role/dashboard", "Dashboard::$slug_role", ['filter' => 'EnsureLogin']);
    $routes->get("$slug_role/profile", "Profile::profilev1", ['filter' => 'EnsureLogin']);
    $routes->group("api/profile", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update', 'Profile::updateProfilev1');
        $routes->post('update/password', 'Profile::updatePassword');
        $routes->post('delete/photo', 'Profile::deletePhoto');
    });
}

if ($id_role == 3) {
    $routes->get("$slug_role/dashboard", "Dashboard::$slug_role", ['filter' => 'EnsureLogin']);
    $routes->get("$slug_role/profile", "Profile::profilev2", ['filter' => 'EnsureLogin']);
    $routes->group('api/profile', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update', 'Profile::updateProfilev2');
        $routes->post('update/password', 'Profile::updatePassword');
        $routes->post('delete/photo', 'Profile::deletePhoto');
    });
}

/*--------------------------------------------------------------
  # Menu Sidebar
--------------------------------------------------------------*/
if (userSession('id_role') == 1) {
    $routes->group("$slug_role/app-settings", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'AppSettings::edit');
    });
    $routes->group("api/app-settings", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update/(:segment)', 'AppSettings::update/$1');
    });
}

if (userSession('id_role') == 1) {
    $routes->group("$slug_role/maintenance", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('email', 'Maintenance::email');
    });
    $routes->group("api/maintenance", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('email', 'Maintenance::sendEmail');
    });
}

if (userSession('id_role') == 1) {
    $routes->get("$slug_role/log-login", 'LogLogin::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/log-login', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'LogLogin::index');
        $routes->post('delete/(:segment)', 'LogLogin::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Perolehan Dana'))) {
    $routes->group("$slug_role/perolehan-dana", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PerolehanDana::main');
    });
    $routes->group('api/perolehan-dana', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update/(:segment)', 'PerolehanDana::update/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Penggunaan Dana'))) {
    $routes->group("$slug_role/penggunaan-dana", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PenggunaanDana::main');
    });
    $routes->group('api/penggunaan-dana', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->post('update/(:segment)', 'PenggunaanDana::update/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Neraca'))) {
    $routes->group("$slug_role/neraca", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Neraca::main');
    });
}

if (in_array($id_role, roleAccessByTitle('Penyusutan Inventaris'))) {
    $routes->get("$slug_role/penyusutan-inventaris", 'PenyusutanInventaris::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/penyusutan-inventaris', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'PenyusutanInventaris::index');
        $routes->post('create', 'PenyusutanInventaris::create');
        $routes->post('update/(:segment)', 'PenyusutanInventaris::update/$1');
        $routes->post('delete/(:segment)', 'PenyusutanInventaris::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Tahun Akademik'))) {
    $routes->get("$slug_role/tahun-akademik", 'TahunAkademik::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/tahun-akademik', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'TahunAkademik::index');
        $routes->post('create', 'TahunAkademik::create');
        $routes->post('update/(:segment)', 'TahunAkademik::update/$1');
        $routes->post('delete/(:segment)', 'TahunAkademik::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Program Studi'))) {
    $routes->get("$slug_role/program-studi", 'ProgramStudi::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/program-studi', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'ProgramStudi::index');
        $routes->post('create', 'ProgramStudi::create');
        $routes->post('update/(:segment)', 'ProgramStudi::update/$1');
        $routes->post('delete/(:segment)', 'ProgramStudi::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Dosen'))) {
    $routes->group("$slug_role/dosen", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Dosen::main');
        $routes->get('new', 'Dosen::new');
        $routes->get('edit/(:segment)', 'Dosen::edit/$1');
    });
    $routes->group('api/dosen', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Dosen::index');
        $routes->post('create', 'Dosen::create');
        $routes->post('update/(:segment)', 'Dosen::update/$1');
        $routes->post('delete/(:segment)', 'Dosen::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('Mahasiswa'))) {
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
    });
}

/*--------------------------------------------------------------
  # Master Data
--------------------------------------------------------------*/
if (in_array($id_role, roleAccessByTitle('Role'))) {
    $routes->get("$slug_role/role", 'Role::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/role', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Role::index');
        $routes->post('create', 'Role::create');
        $routes->post('update/(:segment)', 'Role::update/$1');
        $routes->post('delete/(:segment)', 'Role::delete/$1');
    });
}

if (in_array($id_role, roleAccessByTitle('User Management'))) {
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
