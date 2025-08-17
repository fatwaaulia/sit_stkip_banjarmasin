<?php
$get_created_by = $_GET['created_by'] ?? '';
?>

<style>
.header {
    background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(<?= base_url('assets/img/api-biru.png') ?>);
    height: 50vh;
    display: flex;
    align-items: center;
}
</style>

<div class="container-fluid header cover-center d-flex align-items-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <div class="position-relative text-white text-center" id="headerTitle">
                    <h2 class="fw-600 mt-5">
                        Berita
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="container">
    <div class="row g-3 mb-4">
        <div class="col-12 offset-md-2 col-md-5 offset-lg-4 col-lg-4 offset-xxl-5 col-xl-3 order-2 order-md-1">
            <select class="form-select" id="admin" onchange="location = this.value;">
                <option value="<?= current_url() ?>">Semua Admin</option>
                <?php
                $created_by = model('Users')->select(['id', 'id_role', 'nama', 'username'])->whereIn('id_role', [1, 2])->findAll();
                foreach ($created_by as $v) :
                    $selected = (($_GET['created_by'] ?? '') == $v['username']) ? 'selected' : '';
                ?>
                <option value="<?= current_url() . '?created_by=' . $v['id'] ?>" <?= $selected ?>><?= $v['nama'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-12 col-md-5 col-lg-4 col-xl-4 order-1 order-md-2">
            <form action="" method="get">
                <div class="input-group">
                    <input type="search" class="form-control" name="search" value="<?= $search; ?>" pattern="[A-Za-z0-9 ]+" placeholder="Masukkan sesuatu" required>
                    <button type="submit" class="btn bg-primary-subtle text-primary-emphasis" type="button">Cari</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row gx-lg-5">
        <div class="col-12 col-xl-8">
            <div class="row mb-2">
                <div class="col-lg-6">
                    <p class="fw-600 wow fadeInUp" style="border-left:4px solid var(--main-color)">&nbsp; Berita Terbaru</p>
                </div>
            </div>
            <div class="row g-3 g-md-4">
                <?php
                if ($search && (count($berita) == 0)) echo '<p class="text-center mt-4 mb-0">Pencarian tidak ditemukan!</p>';
                foreach ($berita as $v) :
                ?>
                <div class="col-6 col-md-4 col-lg-4 col-xl-6 d-flex">
                    <div class="card w-100 mb-0" style="cursor: pointer;" onclick="window.location='<?= base_url($v['slug']) ?>'">
                        <img data-src="<?= webFile('image', 'berita', $v['sampul'], $v['updated_at']) ?>" class="cover-center w-100 responsive-aspect lazy-shimmer" title="<?= $v['judul'] ?>" style="border-radius:var(--border-radius) var(--border-radius) 0 0">
                        <div class="card-body d-flex flex-column">
                            <p class="fw-600 mb-2 text-two-line wow fadeInUp" title="<?= $v['judul'] ?>"><?= $v['judul'] ?></p>
                            <div class="text-two-line text-dark mb-2 wow fadeInUp" style="line-height: 1.2;">
                                <small class="mb-0 text-primary">
                                    <?= $v['nama_penulis'] ?>
                                </small>
                            </div>
                            <div class="mt-auto">
                                <div class="wow fadeInUp my-2">
                                    <i class="fa-solid fa-calendar-days me-1"></i> <?= dateFormatter($v['created_at'], 'd MMMM yyyy') ?>
                                </div>
                                <span class="text-two-line konten wow fadeInUp"><?= strip_tags($v['konten']) ?></span>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
            <div class="row mt-5">
                <div class="col-12">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item <?= $page_now <= 1 ? 'disabled' : ''; ?>">
                                <a class="page-link" href="<?= current_url() ?>?<?= http_build_query(array_merge($_GET, ['page' => $page_now - 1])); ?>" aria-label="Previous">
                                    <span aria-hidden="true" class="<?= $page_now <= 1 ? 'text-secondary' : ''; ?>">&laquo;</span>
                                </a>
                            </li>
                            <?php
                            for ($i = 1; $i <= $total_pages; $i++) :
                                $active = ($page_now == $i) ? 'active' : '';
                            ?>
                            <li class="page-item <?= $active; ?>">
                                <a class="page-link" href="<?= current_url() ?>?<?= http_build_query(array_merge($_GET, ['page' => $i])); ?>"><?= $i; ?></a>
                            </li>
                            <?php endfor; ?>
                            <li class="page-item <?= $page_now >= $total_pages ? 'disabled' : ''; ?>">
                                <a class="page-link" href="<?= current_url() ?>?<?= http_build_query(array_merge($_GET, ['page' => $page_now + 1])); ?>" aria-label="Next">
                                    <span aria-hidden="true" class="<?= $page_now >= $total_pages ? 'text-secondary' : ''; ?>">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-4 mt-5 mt-lg-0">
            <div class="position-sticky" style="top:90px">
                <p class="fw-600 wow fadeInUp mb-3" style="border-left:4px solid var(--main-color);">&nbsp; Rekomendasi</p>
                <?php foreach ($berita_rekomendasi as $v) : ?>
                <div class="card mb-3" style="max-height: 100px; cursor: pointer;" onclick="window.location='<?= base_url($v['slug']) ?>'">
                    <div class="row">
                        <div class="col-4">
                            <img data-src="<?= webFile('image', 'berita', $v['sampul'], $v['updated_at']) ?>" class="w-100 cover-center lazy-shimmer" style="height: 100px; border-radius: var(--border-radius) 0 0 var(--border-radius)" alt="<?= $v['judul'] ?>" title="<?= $v['judul'] ?>">
                        </div>
                        <div class="col-8 ps-1 py-3 pe-4">
                            <p class="fw-600 mb-2 text-two-line wow fadeInUp" title="<?= $v['judul'] ?>"><?= $v['judul'] ?></p>
                            <div class="wow fadeInUp">
                                <i class="fa-solid fa-calendar-days me-1 mt-2"></i> <?= dateFormatter($v['created_at'], 'd MMMM yyyy') ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('scroll', () => {
    const headerTitle = document.getElementById('headerTitle');
    const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    headerTitle.style.bottom = -(scrollTop / 1.85) + "px";
});
</script>
