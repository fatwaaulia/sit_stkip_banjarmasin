<?php
$dosen = model('Users', false)->where('id_role', 4)->findAll();
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
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
            <div class="card p-3">
                <form id="form">
                    <div class="mb-3">
                        <label for="operator_kerja" class="form-label">Operator Kerja</label>
                        <select id="operator_kerja" name="operator_kerja">
                            <option value="">Pilih</option>
                            <?php
                            foreach ($dosen as $v) :
                                $multi_role = array_keys((array) json_decode($v['multi_role'], true));
                                $selected = in_array(19, $multi_role) ? 'selected' : '';
                            ?>
                            <option value="<?= $v['id'] ?>" <?= $selected ?>>
                                <?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?>
                            </option>
                            <?php endforeach; ?>
                        </select>
                        <div class="form-text">
                            Akses: Dokumen Template
                        </div>
                        <div class="invalid-feedback" id="invalid_operator_kerja"></div>
                    </div>
                    <div class="mb-3">
                        <label for="operator_kemahasiswaan" class="form-label">Operator Kemahasiswaan</label>
                        <select id="operator_kemahasiswaan" name="operator_kemahasiswaan">
                            <option value="">Pilih</option>
                            <?php
                            foreach ($dosen as $v) :
                                $multi_role = array_keys((array) json_decode($v['multi_role'], true));
                                $selected = in_array(20, $multi_role) ? 'selected' : '';
                            ?>
                            <option value="<?= $v['id'] ?>" <?= $selected ?>>
                                <?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?>
                            </option>
                            <?php endforeach; ?>
                        </select>
                        <div class="form-text">
                            Akses: Dokumen Kemahasiswaan
                        </div>
                        <div class="invalid-feedback" id="invalid_operator_kemahasiswaan"></div>
                    </div>
                    <div class="mt-3 float-end">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>

<script>
dselect(dom('#operator_kerja'), { search: true, clearable: true });
dselect(dom('#operator_kemahasiswaan'), { search: true, clearable: true });

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>update';
    submitData(dom('#form'), endpoint);
});
</script>
