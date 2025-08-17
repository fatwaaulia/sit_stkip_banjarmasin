<style>
.header {
    background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(<?= base_url('assets/img/api-biru.png') ?>);
    height: 50vh;
    display: flex;
    align-items: center;
}
</style>

<div class="container-fluid header cover-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <div class="position-relative text-white text-center" id="headerTitle">
                    <h2 class="fw-600 mt-5">
                        Galeri
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="container-fluid position-relative bg-white">
    <div class="container">
        <div class="row g-3">
            <div class="col-12 col-md-7 col-lg-8 col-xl-6">
                <h3 class="fw-600 linear-color-blue" style="position: relative; display: inline-block;">
                    Galeri
                    <span style="position: absolute; left: 0; right: 0; bottom: -8px; height: 4px; background-color: black; display: block;"></span>
                </h3>
            </div>
            <div class="col-12 col-md-5 col-lg-4 col-xl-3 offset-xxl-3">
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
        </div>
        <div class="row g-3 g-md-4 mt-2">
            <?php foreach ($galeri as $v) : ?>
            <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                <a <?= !$v['tautan'] ?: 'href="' . $v['tautan'] . '"' ?> target="_blank">
                    <div class="position-relative my-2">
                        <img data-src="<?= webFile('image', 'galeri', $v['gambar'], $v['updated_at']) ?>" class="w-100 cover-center responsive-aspect lazy-shimmer" title="<?= $v['judul'] ?>">
                        <div class="position-absolute bottom-0 w-100 text-white p-2 pt-5" style="border-radius: 0 0 var(--border-radius) var(--border-radius);background: linear-gradient(to top, rgba(0, 0, 0, 1), rgba(0, 0, 0, 0));">
                            <i class="fa-solid fa-arrow-up-right-from-square mt-2 <?= (! $v['tautan']) ? 'd-none' : '' ?>"></i>
                        </div>
                    </div>
                    <p class="fw-600 mt-3 mb-2 text-two-line text-dark wow fadeInUp" title="<?= $v['judul'] ?>"><?= $v['judul'] ?></p>
                    <div class="text-two-line text-dark mb-2 wow fadeInUp" style="line-height: 1.2;">
                        <small class="mb-0 text-primary">
                        <?= $v['created_by'] ?>
                        </small>
                    </div>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item <?= $page_now <= 1 ? 'disabled' : ''; ?>">
                            <a class="page-link" href="<?= base_url() ?>galeri?<?= http_build_query(array_merge($_GET, ['page' => $page_now - 1])); ?>" aria-label="Previous">
                                <span aria-hidden="true" class="<?= $page_now <= 1 ? 'text-secondary' : ''; ?>">&laquo;</span>
                            </a>
                        </li>
                        <?php
                        for ($i = 1; $i <= $total_pages; $i++) :
                            $active = ($page_now == $i) ? 'active' : '';
                        ?>
                        <li class="page-item <?= $active; ?>">
                            <a class="page-link" href="<?= base_url() ?>galeri?<?= http_build_query(array_merge($_GET, ['page' => $i])); ?>"><?= $i; ?></a>
                        </li>
                        <?php endfor; ?>
                        <li class="page-item <?= $page_now >= $total_pages ? 'disabled' : ''; ?>">
                            <a class="page-link" href="<?= base_url() ?>galeri?<?= http_build_query(array_merge($_GET, ['page' => $page_now + 1])); ?>" aria-label="Next">
                                <span aria-hidden="true" class="<?= $page_now >= $total_pages ? 'text-secondary' : ''; ?>">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
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
