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

if (in_array($id_role, roleAccessByTitle('Form Input'))) {
    $routes->group("$slug_role/form-input", ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'FormInput::main');
        $routes->get('new', 'FormInput::new');
        $routes->get('edit/(:segment)', 'FormInput::edit/$1');
        $routes->get('unduh-pdf', 'FormInput::unduhPDF');
    });
    $routes->group('api/form-input', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'FormInput::index');
        $routes->get('detail/(:segment)', 'FormInput::detail/$1');
        $routes->post('create', 'FormInput::create');
        $routes->post('update/(:segment)', 'FormInput::update/$1');
        $routes->post('delete/(:segment)', 'FormInput::delete/$1');
        $routes->get('export-excel', 'FormInput::exportExcel');
    });
}

if (in_array($id_role, roleAccessByTitle('Kategori'))) {
    $routes->get("$slug_role/kategori", 'Kategori::main', ['filter' => 'EnsureLogin']);
    $routes->group('api/kategori', ['filter' => 'EnsureLogin'], static function ($routes) {
        $routes->get('/', 'Kategori::index');
        $routes->post('create', 'Kategori::create');
        $routes->post('update/(:segment)', 'Kategori::update/$1');
        $routes->post('delete/(:segment)', 'Kategori::delete/$1');
    });
}
