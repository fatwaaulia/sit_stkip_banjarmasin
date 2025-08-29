<section class="container">
    <div class="row">
        <div class="col-12">
            <h4><?= $kalender_akademik_terbaru['judul'] ?></h4>
            <p class="mb-0">Diterbitkan oleh Akademik pada <?= dateFormatter($kalender_akademik_terbaru['created_at'], 'd MMMM yyyy') ?></p>
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12 col-lg-10 col-xl-9">
            <img data-src="<?= webFile('image', 'kalender_akademik', $kalender_akademik_terbaru['gambar'], $kalender_akademik_terbaru['updated_at']) ?>" class="w-100 cover-center lazy-shimmer" title="<?= $kalender_akademik_terbaru['judul'] ?>">
        </div>
        <div class="col-12 col-lg-2 col-xl-3 mt-5 mt-lg-0">
            <h5 class="mb-4">Kalender Akademik Sebelumnya</h5>
            <?php
            foreach ($kalender_akademik as $v) :
                $ext = pathinfo($v['gambar'], PATHINFO_EXTENSION); 
                $filename_download = url_title($v['judul'], '-', true) . ".$ext";
            ?>
            <div class="mb-5">
                <img data-src="<?= webFile('image', 'kalender_akademik', $v['gambar'], $v['updated_at']) ?>" class="w-100 cover-center responsive-aspect lazy-shimmer" title="<?= $v['judul'] ?>">
                <p class="mt-4 fw-500 d-flex justify-content-between">
                    <span><?= $v['judul'] ?></span>
                    <a href="<?= webFile('image', 'kalender_akademik', $v['gambar'], $v['updated_at']) ?>" download="<?= $filename_download ?>">
                        <i class="fa-solid fa-circle-arrow-down fa-lg" title="Unduh"></i>
                    </a>
                </p>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
