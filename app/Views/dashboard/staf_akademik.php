<?php
$tahun_akademik_aktif = model('TahunAkademik')->orderBy('id DESC')->first();

if ($tahun_akademik_aktif) {
    $tahun_akademik_aktif = $tahun_akademik_aktif['tahun_akademik'] . ' - ' . $tahun_akademik_aktif['tipe'];
} else {
    $tahun_akademik_aktif = '-';
}

$pendaftar_mahasiswa = model('Users')
->where([
    'id_role' => 5,
    'status'  => 'Menunggu Konfirmasi',
])->countAllResults();

$mahasiswa_aktif = model('Users')
->where([
    'id_role' => 5,
    'status'  => 'Aktif',
])->countAllResults();
?>

<style>
table tr { font-weight: 600; }

table tr td { padding: 6px; }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card mt-4 bg-primary-subtle">
                <div class="card-body d-flex justify-content-between">
                    <h5 class="mb-0"><?= $tahun_akademik_aktif ?></h5>
                    <h5 class="mb-0"><?= dateFormatter(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-3 mt-2">
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(255, 205, 86, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-address-card me-1"></i>
                        Pendaftar Mahasiswa
                    </p>
                    <h4 class="mb-0"><?= $pendaftar_mahasiswa ?></h4>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(75, 192, 192, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-address-card me-1"></i>
                        Mahasiswa Aktif
                    </p>
                    <h4 class="mb-0"><?= $mahasiswa_aktif ?></h4>
                </div>
            </div>
        </div>
    </div>
</div>
