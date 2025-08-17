<style>
.konten :where(span, p) {
    color: unset!important;
    background: unset!important;
    font-size: 1rem!important;
}
</style>

<section class="container" style="padding-top: 110px">
    <div class="row gx-lg-5">
        <div class="col-12 col-lg-8">
            <div class="mb-4">
                <h3><?= $berita['judul'] ?></h3>
                <?php
                $created_at = dateFormatter($berita['created_at'], 'd MMMM yyyy');
                $penulis = model('Users')->select(['id', 'nama'])->where('id', $berita['created_by'])->first()['nama'];
                ?>
                <p class="wow fadeInUp">
                    <span class="me-3">
                        <i class="fa-solid fa-calendar-days me-1"></i> <?= $created_at ?>
                    </span>
                    <span>
                        <i class="fa-solid fa-user me-1"></i> <?= $penulis ?>
                    </span>
                </p>
            </div>
            <?php if ($berita['sampul']) : ?>
            <img data-src="<?= webFile('image', 'berita', $berita['sampul'], $berita['updated_at']) ?>" class="w-100 lazy-shimmer" alt="<?= $berita['judul'] ?>" title="<?= $berita['judul'] ?>">
            <?php endif; ?>
            <div class="mt-4">
                <div class="konten text-justify mt-4">
                    <?= $berita['konten'] ?>
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
