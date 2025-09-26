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
                            <label class="form-label">Jenis</label>
                            <input type="text" class="form-control" value="Masuk" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Sumber Dana</label>
                            <input type="text" class="form-control" value="<?= $data['nama_kategori_dana'] ?> - <?= $data['nama_sumber_dana'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="nominal" class="form-label">Nominal</label>
                            <input type="text" inputmode="numeric" class="form-control" id="nominal" name="nominal" value="<?= dotsNumber(abs($data['nominal'])) ?>" placeholder="Masukkan nominal" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_nominal"></div>
                        </div>
                        <div class="mb-3">
                            <label for="catatan" class="form-label">Catatan</label>
                            <input type="text" class="form-control" id="catatan" name="catatan" value="<?= $data['catatan'] ?>" placeholder="Masukkan catatan">
                            <div class="invalid-feedback" id="invalid_catatan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nomor_bukti" class="form-label">Nomor Bukti</label>
                            <input type="text" class="form-control" id="nomor_bukti" name="nomor_bukti" value="<?= $data['nomor_bukti'] ?>" placeholder="Masukkan nomor bukti">
                            <div class="invalid-feedback" id="invalid_nomor_bukti"></div>
                        </div>
                        <div class="mb-3">
                            <label for="jenis_saldo" class="form-label">Jenis Saldo</label>
                            <select class="form-select" id="jenis_saldo" name="jenis_saldo">
                                <option value="">Pilih</option>
                                <?php
                                $jenis_saldo = ['Kas', 'Bank'];
                                foreach ($jenis_saldo as $v) :
                                    $selected = ($v == $data['jenis_saldo']) ? 'selected' : '';
                                ?>
                                <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_jenis_saldo"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tanggal" class="form-label">Tanggal</label>
                            <input type="datetime-local" class="form-control" id="tanggal" name="tanggal" value="<?= $data['tanggal'] ?? date('Y-m-d H:i') ?>">
                            <div class="invalid-feedback" id="invalid_tanggal"></div>
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
