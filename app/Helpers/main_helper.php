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
        if ($field == 'id_roles') {
            if (!empty($user['multi_role'])) {
                $id_role = [$user['id_role']];
                $multi_role = array_keys(json_decode($user['multi_role'], true));
            } else {
                $id_role = [$user['id_role']];
                $multi_role = [];
            }
            $user_session = array_merge($id_role, $multi_role);
        } else {
            $user_session = $user[$field];
        }
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

function formatRupiah($angka)
{
    $angka = (int)$angka;
    $abs = number_format(abs($angka), 0, ',', '.');
    return ($angka < 0 ? '-Rp' : 'Rp') . $abs;
}

function dotsNumber($angka)
{
    return number_format($angka, 0, ',', '.');
}

function numberOnly($str) {
    return (int) preg_replace('/\D/', '', $str);
}


/*--------------------------------------------------------------
  # Time Management
--------------------------------------------------------------*/
function toUserTime($datetime) {
    $user_timezone = session('timezone') ?? config(\Config\App::class)->appTimezone;
    $system_timezone = config(\Config\App::class)->appTimezone;
    $date = new DateTime($datetime, new DateTimeZone($system_timezone));
    $date->setTimezone(new DateTimeZone($user_timezone));

    $input_format = (strlen($datetime) > 10) ? 'Y-m-d H:i:s' : 'Y-m-d';
    return $date->format($input_format);
}

function toSystemTime($datetime) {
    $user_timezone = session('timezone') ?? config(\Config\App::class)->appTimezone;
    $system_timezone = config(\Config\App::class)->appTimezone;
    $date = new DateTime($datetime, new DateTimeZone($user_timezone));
    $date->setTimezone(new DateTimeZone($system_timezone));

    $input_format = (strlen($datetime) > 10) ? 'Y-m-d H:i:s' : 'Y-m-d';
    return $date->format($input_format);
}

function toIndonesianDate($tanggal, $format)
{
    $system_timezone = config(\Config\App::class)->appTimezone;
    $date = Time::parse($tanggal, $system_timezone, 'id_ID');
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
			'role'	=> [1, 17, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Pertanyaan',
			'icon'	=> 'fa-solid fa-question',
			'url'	=> base_url(userSession('slug_role')) . '/pertanyaan',
			'role'	=> [1, 17],
			'type'	=> 'no-collapse',
		],
                [
            'title'	=> 'Dosen / Tendik',
            'role'	=> [1, 17, 4],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Tri Dharma',
			'icon'	=> 'fa-solid fa-flask',
			'url'	=> base_url(userSession('slug_role')) . '/tri-dharma',
			'role'	=> [1, 17, 3, 4, 7, 8, 11],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pengajaran',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url(userSession('slug_role')) . '/pengajaran',
			'role'	=> [1, 17, 4],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pengembangan Kompetensi',
			'icon'	=> 'fa-solid fa-flask',
			'url'	=> base_url(userSession('slug_role')) . '/pengembangan-kompetensi',
			'role'	=> [1, 17, 4, 7, 3, 9, 10, 11, 12],
			'type'	=> 'no-collapse',
		],

        // HEADING
        [
			'title'	=> 'KEUANGAN',
			'role'	=> [2],
			'type'	=> 'heading',
		],
        [
            'title'	=> 'KETUA',
            'role'	=> [7],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'WAKA AKADEMIK',
			'role'	=> [3],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'WAKA KEMAHASISWAAN DAN KERJASAMA',
			'role'	=> [9],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'STAF AKADEMIK',
			'role'	=> [6],
			'type'	=> 'heading',
		],
        [
            'title'	=> 'KAPRODI',
            'role'	=> [8],
            'type'	=> 'heading',
        ],
        [
            'title'	=> 'LPM',
            'role'	=> [10],
            'type'	=> 'heading',
        ],
        [
            'title'	=> 'PUSTAKAWAN',
            'role'	=> [13],
            'type'	=> 'heading',
        ],
        [
            'title'	=> 'UPT PLP',
            'role'	=> [15],
            'type'	=> 'heading',
        ],
        [
            'title'	=> 'BIRO ALUMNI',
            'role'	=> [14],
            'type'	=> 'heading',
        ],
        // END - HEADING

        [
			'title'	=> 'KEUANGAN',
			'role'	=> [1, 17],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'Keluar Masuk Uang',
			'icon'	=> 'fa-solid fa-arrow-down-up-across-line',
			'url'	=> base_url(userSession('slug_role')) . '/keuangan',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Log Keuangan',
			'icon'	=> 'fa-solid fa-arrows-to-eye',
			'url'	=> base_url(userSession('slug_role')) . '/log-keuangan',
			'role'	=> [1, 17],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Perolehan Dana',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/perolehan-dana',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Penggunaan Dana',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/penggunaan-dana',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Neraca',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/neraca',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Penyusutan Inventaris',
			'icon'	=> 'fa-solid fa-money-check',
			'url'	=> base_url() . userSession('slug_role') . '/penyusutan-inventaris',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Tagihan Mahasiswa',
			'icon'	=> 'fa-solid fa-tag',
			'url'	=> base_url(userSession('slug_role')) . '/tagihan-mahasiswa',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pembayaran Mahasiswa',
			'icon'	=> 'fa-solid fa-rupiah-sign',
			'url'	=> base_url(userSession('slug_role')) . '/pembayaran-mahasiswa',
			'role'	=> [1, 17, 2, 5, 7, 8],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'KETUA',
			'role'	=> [1, 17],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Perencanaan Pimpinan',
			'icon'	=> 'fa-solid fa-sheet-plastic',
			'url'	=> base_url() . userSession('slug_role') . '/perencanaan-pimpinan',
			'role'	=> [1, 17, 7],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Laporan Pertanggungjawaban',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url() . userSession('slug_role') . '/laporan-pertanggungjawaban',
			'role'	=> [1, 17, 7],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'WAKA AKADEMIK / KEMAHASISWAAN DAN KERJASAMA',
			'role'	=> [1, 17],
			'type'	=> 'heading',
		],
		[
			'title'	=> 'Kalender Akademik',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/kalender-akademik',
			'role'	=> [1, 17, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Jadwal Kegiatan',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/jadwal-kegiatan',
			'role'	=> [1, 17, 3, 4, 5, 8],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'STAF AKADEMIK',
			'role'	=> [1, 17],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'Pendaftar Mahasiswa',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/pendaftar-mahasiswa',
			'role'	=> [1, 17, 6],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Mahasiswa',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/mahasiswa',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Mahasiswa Cuti / DO',
			'icon'	=> 'fa-solid fa-toggle-off',
			'url'	=> base_url() . userSession('slug_role') . '/status-mahasiswa',
			'role'	=> [1, 17, 6],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Dosen',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/dosen',
			'role'	=> [1, 17],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Tendik',
			'icon'	=> 'fa-solid fa-address-card',
			'url'	=> base_url(userSession('slug_role')) . '/tendik',
			'role'	=> [1, 17],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'KAPRODI',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Dosen Pendamping',
			'icon'	=> 'fa-solid fa-voicemail',
			'url'	=> base_url(userSession('slug_role')) . '/dosen-pendamping',
			'role'	=> [1, 17, 3, 4, 5, 8, 10],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Jadwal Kuliah',
			'icon'	=> 'fa-solid fa-calendar',
			'url'	=> base_url() . userSession('slug_role') . '/jadwal-kuliah',
			'role'	=> [1, 17, 3, 4, 5, 8],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'LPM',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'SPMI',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url() . userSession('slug_role') . '/spmi',
			'role'	=> [1, 17, 10],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'LKPT',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url() . userSession('slug_role') . '/lkpt',
			'role'	=> [1, 17, 10, 11],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Standar PT',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url() . userSession('slug_role') . '/standar-pt',
			'role'	=> [1, 17, 10],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'LPPM',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Surat Tugas Penelitian',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url() . userSession('slug_role') . '/surat-tugas-penelitian',
			'role'	=> [1, 17, 11],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'STAF ADMINISTRASI',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Permintaan Legalisir',
			'icon'	=> 'fa-solid fa-bell-concierge',
			'url'	=> base_url(userSession('slug_role')) . '/permintaan-legalisir',
			'role'	=> [1, 17, 12],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Surat Peringatan',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url(userSession('slug_role')) . '/surat-peringatan',
			'role'	=> [1, 17, 2, 3, 7, 9, 12],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pencatatan Surat',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url(userSession('slug_role')) . '/pencatatan-surat',
			'role'	=> [1, 17, 3, 7, 8, 9, 10, 11, 12],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'PUSTAKAWAN',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Buku',
			'icon'	=> 'fa-solid fa-book',
			'url'	=> base_url(userSession('slug_role')) . '/buku',
			'role'	=> [1, 17, 3, 13],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Buku Rusak',
			'icon'	=> 'fa-solid fa-book',
			'url'	=> base_url(userSession('slug_role')) . '/buku-rusak',
			'role'	=> [1, 17, 3, 13],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Pengajuan Buku Baru',
			'icon'	=> 'fa-solid fa-book',
			'url'	=> base_url(userSession('slug_role')) . '/pengajuan-buku-baru',
			'role'	=> [1, 17, 3, 13],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Kegiatan Perpustakaan',
			'icon'	=> 'fa-solid fa-book-open-reader',
			'url'	=> base_url(userSession('slug_role')) . '/kegiatan-perpustakaan',
			'role'	=> [1, 17, 13],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'UPT PLP',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Mahasiswa Praktik Lapangan',
			'icon'	=> 'fa-solid fa-user-doctor',
			'url'	=> base_url(userSession('slug_role')) . '/mahasiswa-praktik-lapangan',
			'role'	=> [1, 17, 3, 7, 9, 15],
			'type'	=> 'no-collapse',
		],
        [
            'title'	=> 'BIRO ALUMNI',
            'role'	=> [1, 17],
            'type'	=> 'heading',
        ],
        [
			'title'	=> 'Mahasiswa Lulus',
			'icon'	=> 'fa-solid fa-user-graduate',
			'url'	=> base_url(userSession('slug_role')) . '/mahasiswa-lulus',
			'role'	=> [1, 17, 14],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Tracer Studi',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url(userSession('slug_role')) . '/tracer-studi',
			'role'	=> [1, 17, 3, 7, 9, 14],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Laporan Promosi',
			'icon'	=> 'fa-solid fa-file',
			'url'	=> base_url(userSession('slug_role')) . '/laporan-promosi',
			'role'	=> [1, 17, 7, 9, 14],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'MASTER DATA',
			'role'	=> [1, 17, 2, 3],
			'type'	=> 'heading',
		],
		// [
		// 	'title'	=> 'User Management',
		// 	'icon'	=> 'fa-solid fa-user-group',
		// 	'url'	=> base_url(userSession('slug_role')) . '/users',
		// 	'role'	=> [1, 17],
		// 	'type'	=> 'no-collapse',
		// ],
		[
			'title'	=> 'Tahun Akademik',
			'icon'	=> 'fa-solid fa-clone',
			'url'	=> base_url(userSession('slug_role')) . '/tahun-akademik',
			'role'	=> [1, 17, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Program Studi',
			'icon'	=> 'fa-solid fa-people-roof',
			'url'	=> base_url(userSession('slug_role')) . '/program-studi',
			'role'	=> [1, 17, 3],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Tarif SPP',
			'icon'	=> 'fa-solid fa-tag',
			'url'	=> base_url(userSession('slug_role')) . '/tarif-spp',
			'role'	=> [1, 17, 2],
			'type'	=> 'no-collapse',
		],
        [
			'title'	=> 'Master Dana',
			'icon'	=> 'fa-solid fa-sack-dollar',
			'url'	=> base_url(userSession('slug_role')) . '/master-dana',
			'role'	=> [2],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'AKUN',
			'role'	=> [1, 17, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
			'type'	=> 'heading',
		],
        [
			'title'	=> 'App Settings',
			'icon'	=> 'fa-solid fa-gear',
			'url'	=> base_url(userSession('slug_role')) . '/app-settings',
			'role'	=> [1, 17],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Profil',
			'icon'	=> 'fa-solid fa-user',
			'url'	=> base_url(userSession('slug_role')) . '/profile',
			'role'	=> [1, 17, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
			'type'	=> 'no-collapse',
		],
		[
			'title'	=> 'Keluar',
			'icon'	=> 'fa-solid fa-arrow-right-from-bracket',
			'url'	=> base_url('logout'),
			'role'	=> [1, 17, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
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
    if ($jenis_tagihan == 'PENDAFTARAN') {
        $biaya = $mahasiswa['biaya_pendaftaran'];
    } elseif ($jenis_tagihan == 'ALMAMATER') {
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