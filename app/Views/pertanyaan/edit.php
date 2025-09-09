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
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="<?= $data['judul'] ?>" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <hr style="border: 1px solid #dee2e6; opacity:unset;">
                        <?php
                        for ($i = 1; $i <= 7; $i++) :
                            $pertanyaan = json_decode($data['json_pertanyaan'], true);
                            $pertanyaan = $pertanyaan[$i]['pertanyaan'] ?? '';
                        ?>
                        <div class="mb-3">
                            <label class="form-label">Pertanyaan <?= $i ?></label>
                            <input type="text" class="form-control" name="pertanyaan[]" value="<?= $pertanyaan ?>" placeholder="<?= ($i <= 2) ? 'Masukkan pertanyaan ' . $i : 'Opsional' ?>">
                        </div>
                        <?php endfor; ?>
                        <div class="mt-3 float-end">
                            <a href="<?= $base_route ?>" class="btn btn-secondary me-1">Kembali</a>
                            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
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
    const endpoint = '<?= $base_api ?>update/<?= $data['id'] ?>';
    submitData(dom('#form'), endpoint);
});
</script>
