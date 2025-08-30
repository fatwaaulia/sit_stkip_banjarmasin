<link rel="stylesheet" href="<?= base_url() ?>assets/modules/dselect/dselect.min.css">
<script src="<?= base_url() ?>assets/modules/dselect/dselect.min.js"></script>

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
                        <input type="hidden" class="form-control" name="jenis" value="Keluar">
                        <div class="mb-3">
                            <label class="form-label">Jenis</label>
                            <input type="text" class="form-control" value="Keluar" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="sumber_dana" class="form-label">Sumber Dana</label>
                            <select class="form-select" id="sumber_dana" name="sumber_dana">
                                <option value="">Pilih</option>
                                <?php
                                $sumber_dana = model('MasterDana')
                                ->where('jenis', 'Keluar')
                                ->findAll();
                                foreach ($sumber_dana as $v) :
                                ?>
                                <option value="<?= $v['id'] ?>"><?= $v['nama'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_sumber_dana"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nominal" class="form-label">Nominal</label>
                            <input type="text" inputmode="numeric" class="form-control" id="nominal" name="nominal" placeholder="Masukkan nominal" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_nominal"></div>
                        </div>
                        <div class="mb-3">
                            <label for="catatan" class="form-label">Catatan</label>
                            <input type="text" class="form-control" id="catatan" name="catatan" placeholder="Masukkan catatan">
                            <div class="invalid-feedback" id="invalid_catatan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tanggal" class="form-label">Tanggal</label>
                            <input type="datetime-local" class="form-control" id="tanggal" name="tanggal" value="<?= date('Y-m-d H:i') ?>">
                            <div class="invalid-feedback" id="invalid_tanggal"></div>
                        </div>
                        <div class="mt-3 float-end">
                            <a href="<?= $base_route ?>" class="btn btn-secondary me-2">Kembali</a>
                            <button type="submit" class="btn btn-primary">Tambahkan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#sumber_dana'), { search: true });

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>create';
    submitData(dom('#form'), endpoint);
});
</script>
