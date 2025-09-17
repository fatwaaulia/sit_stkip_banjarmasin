<?php
$dosen = model('Users')
->where('id_role', 4)
->where('id_program_studi', userSession('id_program_studi'))
->where('status_akun', 'ENABLE')
->findAll();
?>

<link href="<?= base_url() ?>assets/modules/summernote/summernote-lite.min.css" rel="stylesheet">
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
                        <div class="mb-3">
                            <div class="mb-3">
                                <label for="judul" class="form-label">Judul</label>
                                <input type="text" class="form-control" id="judul" name="judul" placeholder="Masukkan judul">
                                <div class="invalid-feedback" id="invalid_judul"></div>
                            </div>
                            <div class="mb-3">
                                <label for="tautan" class="form-label">Tautan</label>
                                <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan">
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
                            <div class="mb-3">
                                <label for="dosen_1" class="form-label">Dosen 1 <span class="text-secondary">(Opsional)</span></label>
                                <select class="form-select" id="dosen_1" name="dosen_1">
                                    <option value="">Pilih</option>
                                    <?php foreach ($dosen as $v) : ?>
                                    <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <div class="invalid-feedback" id="invalid_dosen_1"></div>
                            </div>
                            <div class="mb-3">
                                <label for="dosen_2" class="form-label">Dosen 2 <span class="text-secondary">(Opsional)</span></label>
                                <select class="form-select" id="dosen_2" name="dosen_2">
                                    <option value="">Pilih</option>
                                    <?php foreach ($dosen as $v) : ?>
                                    <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <div class="invalid-feedback" id="invalid_dosen_2"></div>
                            </div>
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

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<script src="<?= base_url() ?>assets/modules/summernote/summernote-lite.min.js"></script>
<script src="<?= base_url() ?>assets/modules/summernote/lang/summernote-id-ID.js"></script>
<script>
$(document).ready(function() {
    $('#anggota_beda_kampus').summernote({
        placeholder: 'Asal Kampus - Nomor Identitas - Nama Lengkap',
        lang: 'id-ID', // default: 'en-US'
        tabsize: 2,
        height: 250,
        toolbar: [
            ['font', ['bold', 'underline']],
            ['para', ['ul', 'ol', 'paragraph']],
        ]
    });
});

dselect(dom('#dosen_1'), { search: true, clearable: true });
dselect(dom('#dosen_2'), { search: true, clearable: true });

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>create';
    submitData(dom('#form'), endpoint);
});
</script>
