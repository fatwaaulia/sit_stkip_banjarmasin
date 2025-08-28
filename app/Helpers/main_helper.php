<?php

use Config\App;
use CodeIgniter\I18n\Time;

function encode($string)
{
    $key = "bismillah";
    return base64_encode(openssl_encrypt($string, 'aes-256-ecb', $key, 0));
}

function decode($string)
{
    $key = 'bismillah';
    return openssl_decrypt(base64_decode($string), 'aes-256-ecb', $key, 0);
}

function userSession($field = null)
{
    if (! session()->isLogin) return '';

    $id_user = session()->get('id_user');
    $user = model('Users')->find($id_user);
    
    if (! $user) return 'Pengguna tidak ditemukan!';

    if ($field) {
        $user_session = $user[$field];
    } else {
        $user_session = $user;
    }

    return $user_session;
}

function appSettings($field = null)
{
    $app_settings = model('AppSettings')->find(1);

    $app_settings['logo'] = webFile('image', 'app_settings', $app_settings['logo'], $app_settings['updated_at']);
    $app_settings['favicon'] = webFile('image', 'app_settings', $app_settings['favicon'], $app_settings['updated_at']);

    if ($field) {
        $app_settings = $app_settings[$field];
    }

    return $app_settings;
}

function dataTablesSearch($columns, $search, $select, $base_query) {
    $searchable = array_filter($columns);
    if ($search && $searchable) {
        $aliases = [];
        $has_alias = false;
        foreach ((array)$select as $s) {
            if (preg_match('/(.+)\s+as\s+(.+)/i', $s, $match)) {
                $aliases[trim($match[2])] = trim($match[1]);
                $has_alias = true;
            }
        }
        $base_query->groupStart();
        foreach ($searchable as $col) {
            $column_name = ($has_alias && !in_array($col, $aliases)) ? "a.{$col}" : $col;
            $base_query->orLike($column_name, $search);
        }
        $base_query->groupEnd();
    }
}

function dotsNumber($angka)
{
    return number_format($angka, 0, ',', '.');
}

function formatRupiah($angka)
{
    $angka = (int)$angka;
    $abs = number_format(abs($angka), 0, ',', '.');
    return ($angka < 0 ? '-Rp' : 'Rp') . $abs;
}

/*--------------------------------------------------------------
  # Time Management
--------------------------------------------------------------*/
function userLocalTime($datetime) {
    $date = new DateTime($datetime, new DateTimeZone('Asia/Jakarta'));
    $timezone = session('timezone') ?? 'Asia/Jakarta';
    $date->setTimezone(new DateTimeZone($timezone));
    return $date->format('Y-m-d H:i:s');
}

function dateFormatter($tanggal, $format)
{
    $date = Time::parse($tanggal, 'Asia/Jakarta', 'id_ID');
    return $date->toLocalizedString($format); // cccc, d MMMM yyyy HH:mm:ss
}

/*--------------------------------------------------------------
  # File Management
--------------------------------------------------------------*/
function dirUpload()
{
    return config(App::class)->dirUpload;
}

function webFile($type = '', $folder_name = '', $filename = '', $updated_at = null)
{
    $webfile_url = config(App::class)->webfileURL;
    $path = '';

    if ($type == 'image') {
        $path = $webfile_url . 'default.png';
    }

    if ($type == 'image_user') {
        $path = $webfile_url . 'user-default.png';
    }

    if ($filename) {
        $path = $webfile_url . "$folder_name/$filename?v=" . date('His', strtotime($updated_at));
    }

    return $path;
}

function compressConvertImage($get_file, $upload_path, $filename)
{
    $image = service('image');
    $image->withFile($get_file);
    $image->convert(IMAGETYPE_JPEG);
    $image->flatten(255, 255, 255);
    if ($image->getWidth() > 800 || $image->getHeight() > 800) $image->resize(800, 800, true);
    $image->save($upload_path . $filename, 60);
}

function lowCompressConvertImage($get_file, $upload_path, $filename)
{
    $image = service('image');
    $image->withFile($get_file);
    $image->convert(IMAGETYPE_JPEG);
    $image->flatten(255, 255, 255);
    $image->save($upload_path . $filename, 60);
}

/*--------------------------------------------------------------
  # Menu Sidebar
--------------------------------------------------------------*/
function menuSidebar()
{
    $menu_sidebar = [
		[
			'title'	=> 'Dashboard',
			'icon'	=> 'fa-solid fa-chart-line',
			'url'	=> base_url(userSession('slug_role')) . '/dashboard',
			'role'	=> [1, 2, 3, 5],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Laman Akreditasi',
			'icon'	=> 'fa-solid fa-house',
			'url'	=> '/',
			'role'	=> [1, 2, 3],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'KEUANGAN',
			'role'	=> [1, 2],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Perolehan Dana',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/perolehan-dana',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Penggunaan Dana',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/penggunaan-dana',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Neraca',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/neraca',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Penyusutan Inventaris',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/penyusutan-inventaris',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Tagihan Mahasiswa',
			'icon'	=> 'fa-solid fa-tag',
			'url'	=> base_url(userSession('slug_role')) . '/tagihan-mahasiswa',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pembayaran Mahasiswa',
			'icon'	=> 'fa-solid fa-rupiah-sign',
			'url'	=> base_url(userSession('slug_role')) . '/pembayaran-mahasiswa',
			'role'	=> [1, 2, 5],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Status Bayar',
			'icon'	=> 'fa-solid fa-hourglass-half',
			'url'	=> base_url(userSession('slug_role')) . '/status-bayar',
			'role'	=> [1, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'PIMPINAN',
			'role'	=> [1],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Program Kerja',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/program-kerja',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'AKADEMIK',
			'role'	=> [1, 3],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Kalender Akademik',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/kalender-akademik',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Jadwal Kuliah', // Link SK
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/jadwal-kuliah',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Jadwal Kegiatan', // Link SK
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/jadwal-kegiatan',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'KEMAHASISWAAN',
			'role'	=> [1],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'Mahasiswa Cuti / DO',
			'icon'	=> 'fa-solid fa-toggle-off',
			'url'	=> base_url() . userSession('slug_role') . '/status-mahasiswa',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'MASTER DATA',
			'role'	=> [1, 3],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Role',
			'icon'	=> 'fa-solid fa-user-tag',
			'url'	=> base_url(userSession('slug_role')) . '/role',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'User Management',
			'icon'	=> 'fa-solid fa-user-group',
			'url'	=> base_url(userSession('slug_role')) . '/users',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Tahun Akademik',
			'icon'	=> 'fa-solid fa-clone',
			'url'	=> base_url(userSession('slug_role')) . '/tahun-akademik',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Program Studi',
			'icon'	=> 'fa-solid fa-people-roof',
			'url'	=> base_url(userSession('slug_role')) . '/program-studi',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Dosen',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/dosen',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Mahasiswa',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/mahasiswa',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Tarif SPP',
			'icon'	=> 'fa-solid fa-tag',
			'url'	=> base_url(userSession('slug_role')) . '/tarif-spp',
			'role'	=> [1, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'AKUN',
			'role'	=> [1, 2, 3, 5],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'App Settings',
			'icon'	=> 'fa-solid fa-gear',
			'url'	=> base_url(userSession('slug_role')) . '/app-settings',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Maintenance',
			'icon'	=> 'fa-solid fa-screwdriver-wrench',
			'role'	=> [1],
			'type'	=> 'collapse',
			'collapse' => [
				[
					'title'	=> 'Email',
					'url'	=> base_url(userSession('slug_role')) . '/maintenance/email',
				],
				[
					'title'	=> 'Notifikasi',
					'url'	=> base_url(userSession('slug_role')) . '/maintenance/notifikasi',
				],
			],
		],
        [
			'title'	=> 'Log Login',
			'icon'	=> 'fa-solid fa-lock',
			'url'	=> base_url(userSession('slug_role')) . '/log-login',
			'role'	=> [1],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Profil',
			'icon'	=> 'fa-solid fa-user',
			'url'	=> base_url(userSession('slug_role')) . '/profile',
			'role'	=> [1, 2, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Keluar',
			'icon'	=> 'fa-solid fa-arrow-right-from-bracket',
			'url'	=> base_url('logout'),
			'role'	=> [1, 2, 3, 5],
			'type'	=> 'no-collapse',
		],
	];

    return $menu_sidebar;
}

function roleAccessByTitle($title) {
    $sidebar = menuSidebar();
    foreach ($sidebar as $item) {
		if (in_array(($item['type'] ?? ''), ['no-collapse', 'collapse'])) {
			if (($item['title'] ?? '') == $title) {
				return $item['role'];
			}
		}
    }
    return [];
}

/*--------------------------------------------------------------
  # Sistem
--------------------------------------------------------------*/
function biayaKuliahMahasiswa($id_mahasiswa, $jenis_tagihan)
{
    $mahasiswa = model('Users')->find($id_mahasiswa);

    $biaya = 0;
    // Tagihan Perorangan
    if ($jenis_tagihan == 'LDKM') {
        $biaya = $mahasiswa['biaya_ldkm'];
    } elseif ($jenis_tagihan == 'MBKM') {
        $biaya = $mahasiswa['biaya_mbkm'];
    } elseif ($jenis_tagihan == 'BIMBINGAN SKRIPSI') {
        $biaya = $mahasiswa['biaya_bimbingan_skripsi'];
    } elseif ($jenis_tagihan == 'SEMINAR PROPOSAL') {
        $biaya = $mahasiswa['biaya_seminar_proposal'];
    } elseif ($jenis_tagihan == 'SIDANG SKRIPSI') {
        $biaya = $mahasiswa['biaya_sidang_skripsi'];
    } elseif ($jenis_tagihan == 'YUDISIUM') {
        $biaya = $mahasiswa['biaya_yudisium'];
    } elseif ($jenis_tagihan == 'WISUDA') {
        $biaya = $mahasiswa['biaya_wisuda'];
    }

    // Tagihan Maba
    if ($jenis_tagihan == 'ALMAMATER') {
        $biaya = $mahasiswa['biaya_almamater'];
    } elseif ($jenis_tagihan == 'KTM') {
        $biaya = $mahasiswa['biaya_ktm'];
    } elseif ($jenis_tagihan == 'UANG GEDUNG') {
        $biaya = $mahasiswa['biaya_uang_gedung'];
    }

    // Tagihan Semester
    if ($jenis_tagihan == 'SPP') {
        $biaya = $mahasiswa['biaya_spp'];
    } elseif ($jenis_tagihan == 'UTS') {
        $biaya = $mahasiswa['biaya_uts'];
    } elseif ($jenis_tagihan == 'UAS') {
        $biaya = $mahasiswa['biaya_uas'];
    }

    return $biaya;
}