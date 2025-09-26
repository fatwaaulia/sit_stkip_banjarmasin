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
                            <label for="judul" class="form-label">Program Studi</label>
                            <input type="text" class="form-control" id="judul" value="<?= $data['jenjang_program_studi'] ?> - <?= $data['nama_program_studi'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="<?= $data['judul'] ?>" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" value="<?= $data['tautan'] ?>" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="dokumen" class="form-label">Dokumen</label>
                            <input type="file" class="form-control" id="dokumen" name="dokumen" accept="application/pdf">
                            <div class="form-text">
                                Maksimal 1 mb, pdf
                            </div>
                            <div class="invalid-feedback" id="invalid_dokumen"></div>
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label class="form-label">Dosen 1 <span class="text-secondary">(Opsional)</span></label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_dosen_1'] ?> - <?= $data['nama_dosen_1'] ?> - <?= $data['nama_program_studi_dosen_1'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Dosen 2 <span class="text-secondary">(Opsional)</span></label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_dosen_2'] ?> - <?= $data['nama_dosen_2'] ?> - <?= $data['nama_program_studi_dosen_2'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Dosen 3 <span class="text-secondary">(Opsional)</span></label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_dosen_3'] ?> - <?= $data['nama_dosen_3'] ?> - <?= $data['nama_program_studi_dosen_3'] ?>" disabled>
                        </div>
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
