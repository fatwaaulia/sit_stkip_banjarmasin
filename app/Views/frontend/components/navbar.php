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
                <div class="fw-500">STKIP Islam Sabilal Muhtadin</div>
                <small>KAMPUS VISIONER</small>
            </div>
        </a>
        <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav w-100 pt-3 pb-2 py-md-0">
                <a class="nav-link <?= ($uri->getSegment(1) == 'pendaftaran-mahasiswa') ? 'nav-active' : '' ?>" href="<?= base_url() ?>pendaftaran-mahasiswa">Pendaftaran Mahasiswa</a>
                <a class="nav-link <?= ($uri->getSegment(1) == 'permintaan-legalisir') ? 'nav-active' : '' ?>" href="<?= base_url() ?>permintaan-legalisir">Permintaan Legalisir</a>
            </div>
        </div>
    </div>
</nav>
