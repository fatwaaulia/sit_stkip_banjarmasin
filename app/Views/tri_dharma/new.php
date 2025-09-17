<?php
$dosen = model('Users')
->where('id_role', 4)
->where('status_akun', 'ENABLE')
->findAll();

$mahasiswa = model('Users')
->where('id_role', 5)
->where('status', 'Aktif')
->where('nomor_identitas !=', '')
->findAll();

$anggota = array_merge($dosen, $mahasiswa);
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
                            <label for="kategori" class="form-label">Kategori</label>
                            <select class="form-select" id="kategori" name="kategori">
                                <option value="">Pilih</option>
                                <?php
                                $kategori = ['PENELITIAN', 'PENGABDIAN', 'ARTIKEL PUBLIKASI'];
                                foreach ($kategori as $v) :
                                ?>
                                <option value="<?= $v ?>"><?= $v ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_kategori"></div>
                        </div>
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan Diterbitkan</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan_gdrive" class="form-label">Tautan Google Drive</label>
                            <input type="text" class="form-control" id="tautan_gdrive" name="tautan_gdrive" placeholder="Masukkan tautan gdrive">
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
                            <input type="date" class="form-control" id="tanggal_publikasi" name="tanggal_publikasi">
                            <div class="invalid-feedback" id="invalid_tanggal_publikasi"></div>
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label class="form-label">Anggota 1</label>
                            <input type="text" class="form-control" value="<?= userSession('nomor_identitas') ?> - <?= userSession('nama') ?> - <?= userSession('nama_program_studi') ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_2" class="form-label">Anggota 2 <span class="text-secondary">(Opsional)</span></label>
                            <select class="form-select" id="anggota_2" name="anggota_2">
                                <option value="">Pilih</option>
                                <?php foreach ($anggota as $v) : ?>
                                <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_anggota_2"></div>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_3" class="form-label">Anggota 3 <span class="text-secondary">(Opsional)</span></label>
                            <select class="form-select" id="anggota_3" name="anggota_3">
                                <option value="">Pilih</option>
                                <?php foreach ($anggota as $v) : ?>
                                <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_anggota_3"></div>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_4" class="form-label">Anggota 4 <span class="text-secondary">(Opsional)</span></label>
                            <select class="form-select" id="anggota_4" name="anggota_4">
                                <option value="">Pilih</option>
                                <?php foreach ($anggota as $v) : ?>
                                <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_anggota_4"></div>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_5" class="form-label">Anggota 5 <span class="text-secondary">(Opsional)</span></label>
                            <select class="form-select" id="anggota_5" name="anggota_5">
                                <option value="">Pilih</option>
                                <?php foreach ($anggota as $v) : ?>
                                <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_anggota_5"></div>
                        </div>
                        <div class="mb-3">
                            <label for="anggota_beda_kampus" class="form-label">Anggota Beda Kampus</label>
                            <textarea class="form-control" id="anggota_beda_kampus" name="anggota_beda_kampus" rows="3" placeholder="Masukkan anggota beda kampus"></textarea>
                            <div class="invalid-feedback" id="invalid_anggota_beda_kampus"></div>
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

dselect(dom('#anggota_2'), { search: true, clearable: true });
dselect(dom('#anggota_3'), { search: true, clearable: true });
dselect(dom('#anggota_4'), { search: true, clearable: true });
dselect(dom('#anggota_5'), { search: true, clearable: true });

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>create';
    submitData(dom('#form'), endpoint);
});
</script>
