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
                            <label for="jenis" class="form-label">Jenis</label>
                            <select class="form-select" id="jenis" name="jenis">
                                <option value="">Pilih</option>
                                <?php
                                $jenis = ['MASUK', 'KELUAR'];
                                foreach ($jenis as $v) :
                                    $selected = ($v == $data['jenis']) ? 'selected' : '';
                                ?>
                                <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_jenis"></div>
                        </div>
                        <div class="mb-3">
                            <label for="penerima" class="form-label">Penerima</label>
                            <input type="text" class="form-control" id="penerima" name="penerima" value="<?= $data['penerima'] ?>" placeholder="Masukkan penerima">
                            <div class="invalid-feedback" id="invalid_penerima"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tujuan" class="form-label">Tujuan</label>
                            <input type="text" class="form-control" id="tujuan" name="tujuan" value="<?= $data['tujuan'] ?>" placeholder="Masukkan tujuan">
                            <div class="invalid-feedback" id="invalid_tujuan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nomor_surat" class="form-label">Nomor Surat</label>
                            <input type="text" class="form-control" id="nomor_surat" name="nomor_surat" value="<?= $data['nomor_surat'] ?>" placeholder="Masukkan nomor surat">
                            <div class="invalid-feedback" id="invalid_nomor_surat"></div>
                        </div>
                        <div class="mb-3">
                            <label for="perihal" class="form-label">Perihal</label>
                            <input type="text" class="form-control" id="perihal" name="perihal" value="<?= $data['perihal'] ?>" placeholder="Masukkan perihal">
                            <div class="invalid-feedback" id="invalid_perihal"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" value="<?= $data['tautan'] ?>" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="dokumen" class="form-label">Dokumen</label>
                            <input type="file" class="form-control" id="dokumen" name="dokumen" accept="application/pdf">
                            <div class="invalid-feedback" id="invalid_dokumen"></div>
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
