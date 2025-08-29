<?php
$uri = service('uri');
$uri->setSilent(true);
?>

<style>
.navbar { box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1)!important; }
@media (min-width: 1200px) {
    .navbar { padding-right: 10px!important; }
}
.navbar-toggler { border: none; }
.nav-link { color: #000000!important }
.nav-link:hover { color:var(--main-color)!important; }
.nav-active {
    color:var(--main-color)!important;
    font-weight: 600;
}
.dropdown-menu .nav-active:active {
    color:white!important;
    background-color:var(--main-color)!important;
}
</style>
<nav class="navbar navbar-expand-lg bg-light fixed-top" style="z-index: 100;">
    <div class="container">
        <a class="navbar-brand d-flex" href="<?= base_url() ?>">
            <img src="<?= appSettings('logo') ?>" style="height: 45px;" alt="<?= appSettings('nama_aplikasi') ?>">
            <div class="ms-3" style="font-size: 14px;">
                <small>VISIONER</small> <br>
                <span class="fw-500">STKIP Islam Sabilal Muhtadin</span>
            </div>
        </a>
        <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav w-100 pt-3 pb-2 py-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link <?= in_array($uri->getSegment(1), ['kalender-akademik', 'jadwal-kuliah', 'jadwal-kegiatan']) ? 'nav-active' : '' ?>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    AKADEMIK <i class="fa-solid fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu border-0">
                        <li><a class="dropdown-item text-nowrap <?= ($uri->getSegment(1) == 'kalender-akademik') ? 'nav-active' : '' ?>" href="<?= base_url() ?>kalender-akademik">Kalender Akademik</a></li>
                        <li><a class="dropdown-item text-nowrap <?= ($uri->getSegment(1) == 'jadwal-kuliah') ? 'nav-active' : '' ?>" href="<?= base_url() ?>jadwal-kuliah">Jadwal Kuliah</a></li>
                        <li><a class="dropdown-item text-nowrap <?= ($uri->getSegment(1) == 'jadwal-kegiatan') ? 'nav-active' : '' ?>" href="<?= base_url() ?>jadwal-kegiatan">Jadwal Kegiatan</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link <?= in_array($uri->getSegment(1), ['perolehan-dana', 'penggunaan-dana']) ? 'nav-active' : '' ?>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    KEUANGAN <i class="fa-solid fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu border-0">
                        <li><a class="dropdown-item text-nowrap <?= ($uri->getSegment(1) == 'perolehan-dana') ? 'nav-active' : '' ?>" href="<?= base_url() ?>perolehan-dana">Perolehan Dana</a></li>
                        <li><a class="dropdown-item text-nowrap <?= ($uri->getSegment(1) == 'penggunaan-dana') ? 'nav-active' : '' ?>" href="<?= base_url() ?>penggunaan-dana">Penggunaan Dana</a></li>
                    </ul>
                </li>
            </div>
        </div>
    </div>
</nav>
