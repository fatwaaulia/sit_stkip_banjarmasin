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
                            <label for="judul" class="form-label">Kategori</label>
                            <input type="text" class="form-control" id="judul" value="<?= $data['kategori'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="<?= $data['judul'] ?>" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan Diterbitkan</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" value="<?= $data['tautan'] ?>" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan_gdrive" class="form-label">Tautan Google Drive</label>
                            <input type="text" class="form-control" id="tautan_gdrive" name="tautan_gdrive" value="<?= $data['tautan_gdrive'] ?>" placeholder="Masukkan tautan gdrive">
                            <div class="invalid-feedback" id="invalid_tautan_gdrive"></div>
                        </div>
                        <div class="mb-3">
                            <label for="dokumen" class="form-label">Dokumen</label>
                            <input type="file" class="form-control" id="dokumen" name="dokumen" accept="application/pdf">
                            <div class="form-text">
                                Maksimal 1 mb, pdf
                            </div>
                            <div class="invalid-feedback" id="invalid_dokumen"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tanggal_publikasi" class="form-label">Tanggal Publikasi</label>
                            <input type="date" class="form-control" id="tanggal_publikasi" name="tanggal_publikasi" value="<?= toUserTime($data['tanggal_publikasi']) ?>">
                            <div class="invalid-feedback" id="invalid_tanggal_publikasi"></div>
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label class="form-label">Anggota 1</label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_anggota_1'] ?> - <?= $data['nama_anggota_1'] ?> - <?= $data['nama_program_studi_anggota_1'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 2</label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_anggota_2'] ?> - <?= $data['nama_anggota_2'] ?> - <?= $data['nama_program_studi_anggota_2'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 3</label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_anggota_3'] ?> - <?= $data['nama_anggota_3'] ?> - <?= $data['nama_program_studi_anggota_3'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 4</label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_anggota_4'] ?> - <?= $data['nama_anggota_4'] ?> - <?= $data['nama_program_studi_anggota_4'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 5</label>
                            <input type="text" class="form-control" value="<?= $data['nomor_identitas_anggota_5'] ?> - <?= $data['nama_anggota_5'] ?> - <?= $data['nama_program_studi_anggota_5'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_beda_kampus" class="form-label">Anggota Beda Kampus</label>
                            <div><?= $data['anggota_beda_kampus'] ?></div>
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
