<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4"><?= isset($title) ? $title : '' ?></h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <?php
            foreach ($responden as $k => $v) :
                $json_jawaban = json_decode($v['json_jawaban'], true);
            ?>
            <div class="card p-3 mb-3">
                <div class="mb-3">
                    <p class="fw-500 mb-0">Responden: <?= $v['nama_user'] ?></p>
                    <p class="mb-0"><?= $v['nama_role_user'] ?> <?= $v['jenjang_program_studi'] ?> <?= $v['singkatan_program_studi'] ?></p>
                    <p class="mb-0"><?= date('d-m-Y H:i:s', strtotime(toUserTime($v['created_at']))) ?></p>
                </div>
                <?php foreach ($json_jawaban as $k2 => $v2) : ?>
                <div class="mb-3">
                    <p class="fw-500 mb-0"><?= $k2 ?>. <?= $v2['pertanyaan'] ?></p>
                    <?= $v2['jawaban'] ?>
                </div>
                <?php endforeach; ?>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
