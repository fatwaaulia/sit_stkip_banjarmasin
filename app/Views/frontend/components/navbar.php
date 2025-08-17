<?php
$app_settings = model('AppSettings')->find(1);
$logo_web = webFile('image', 'app_settings', $app_settings['logo'], $app_settings['updated_at']);
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
        <a class="navbar-brand" href="<?= base_url() ?>">
            <img src="<?= $logo_web ?>" style="height: 45px;" alt="<?= $app_settings['nama_aplikasi'] ?>">
        </a>
        <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav w-100 pt-3 pb-2 py-md-0">
                <a class="nav-link <?= ($uri->getSegment(1) == '') ? 'nav-active' : '' ?>" href="<?= base_url() ?>">Beranda</a>
                <a class="nav-link <?= ($uri->getSegment(1) == 'galeri') ? 'nav-active' : '' ?>" href="<?= base_url() ?>galeri">Galeri</a>
                <div class="ms-lg-auto mt-3 mt-lg-0">
                    <?php
                    if (userSession()) :
                        $foto = webFile('image_user', 'users', userSession('foto'), userSession('updated_at'));
                    ?>
                    <a href="<?= base_url('login') ?>">
                        <img src="<?= $foto ?>" alt="<?= userSession('nama') ?>" title="<?= userSession('nama') ?>" class="rounded-circle wh-40 cover-center">
                    </a>
                    <?php else : ?>
                    <div class="d-flex justify-content-start">
                        <a href="<?= base_url('login') ?>" class="btn btn-primary me-2">Login</a>
                        <a href="<?= base_url('register') ?>" class="btn btn-primary">Register</a>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</nav>
