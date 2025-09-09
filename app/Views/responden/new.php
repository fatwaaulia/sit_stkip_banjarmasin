<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4"><?= isset($title) ? $title : '' ?></h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form id="form">
                        <input type="hidden" name="pertanyaan" value="<?= $data['id'] ?>">
                        <?php
                        for ($i = 1; $i <= 7; $i++) :
                            $json_pertanyaan = json_decode($data['json_pertanyaan'], true);
                            $pertanyaan = $json_pertanyaan[$i]['pertanyaan'] ?? '';
                            if (empty($pertanyaan)) continue;
                        ?>
                        <div class="mb-3">
                            <label class="form-label"><?= $i ?>. <?= $pertanyaan ?></label>
                            <textarea class="form-control" name="jawaban[]" rows="3" placeholder="Jawab disini" required></textarea>
                        </div>
                        <?php endfor; ?>
                        <div class="mt-3 float-end">
                            <a href="<?= base_url(userSession('slug_role')) ?>/pertanyaan" class="btn btn-secondary me-2">Kembali</a>
                            <button type="submit" class="btn btn-primary">Simpan Jawaban</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>create';
    submitData(dom('#form'), endpoint);
});
</script>
