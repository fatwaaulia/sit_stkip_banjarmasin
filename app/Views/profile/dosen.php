<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4">Profil</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form id="form">
                        <div class="mb-3">
                            <label for="nomor_identitas" class="form-label">NIDN / NIDK</label>
                            <input type="text" class="form-control" id="nomor_identitas" name="nomor_identitas" value="<?= $data['nomor_identitas'] ?>" placeholder="Masukkan nomor identitas">
                            <div class="invalid-feedback" id="invalid_nomor_identitas"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Dosen</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="<?= $data['nama'] ?>" placeholder="Masukkan nama dosen">
                            <div class="invalid-feedback" id="invalid_nama"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Jenis Kelamin</label>
                            <?php
                            $jenis_kelamin = ['Laki-laki', 'Perempuan'];
                            foreach ($jenis_kelamin as $v) :
                                $checked = ($v == $data['jenis_kelamin']) ? 'checked' : '';
                            ?>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="<?= $v ?>" name="jenis_kelamin" value="<?= $v ?>" <?= $checked ?>>
                                <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                            </div>
                            <?php endforeach; ?>
                            <div class="invalid-feedback" id="invalid_jenis_kelamin"></div>
                        </div>
                        <div class="row gx-3">
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label for="tempat_lahir" class="form-label">Tempat Lahir</label>
                                    <input type="text" class="form-control" id="tempat_lahir" name="tempat_lahir" value="<?= $data['tempat_lahir'] ?>" placeholder="Masukkan tempat lahir">
                                    <div class="invalid-feedback" id="invalid_tempat_lahir"></div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label for="tanggal_lahir" class="form-label">Tanggal Lahir</label>
                                    <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir" value="<?= $data['tanggal_lahir'] ?>">
                                    <div class="invalid-feedback" id="invalid_tanggal_lahir"></div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="alamat" class="form-label">Alamat</label>
                            <textarea class="form-control" id="alamat" name="alamat" rows="3" placeholder="Masukkan alamat"><?= $data['alamat'] ?></textarea>
                            <div class="invalid-feedback" id="invalid_alamat"></div>
                        </div>
                        <div class="mb-3">
                            <label for="jabatan_fungsional" class="form-label">Jabatan Fungsional</label>
                            <input type="text" class="form-control" id="jabatan_fungsional" name="jabatan_fungsional" value="<?= $data['jabatan_fungsional'] ?>" placeholder="Masukkan jabatan fungsional">
                            <div class="invalid-feedback" id="invalid_jabatan_fungsional"></div>
                        </div>
                        <div class="mb-3">
                            <label for="jabatan_struktural" class="form-label">Jabatan Struktural</label>
                            <input type="text" class="form-control" id="jabatan_struktural" name="jabatan_struktural" value="<?= $data['jabatan_struktural'] ?>" placeholder="Masukkan jabatan struktural">
                            <div class="invalid-feedback" id="invalid_jabatan_struktural"></div>
                        </div>
                        <div class="mb-3">
                            <label for="program_studi" class="form-label">Program Studi</label>
                            <select class="form-select" id="program_studi" name="program_studi">
                                <option value="">Pilih</option>
                                <?php
                                $program_studi = model('ProgramStudi')->findAll();
                                foreach ($program_studi as $v) :
                                    $selected = ($v['id'] == $data['id_program_studi']) ? 'selected' : '';
                                ?>
                                <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['jenjang'] ?> - <?= $v['nama'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_program_studi"></div>
                        </div>
                        <div class="mb-3">
                            <label for="motto_kerja" class="form-label">Motto Kerja</label>
                            <textarea class="form-control" id="motto_kerja" name="motto_kerja" rows="3" placeholder="Masukkan motto kerja"><?= $data['motto_kerja'] ?></textarea>
                            <div class="invalid-feedback" id="invalid_motto_kerja"></div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Ubah Password</label><span class="text-secondary"> (Opsional)</span>
                            <div class="mb-2 position-relative">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan password">
                                <div class="invalid-feedback" id="invalid_password"></div>
                                <img src="<?= base_url('assets/icons/show.png') ?>" class="position-absolute" id="eye_password">
                            </div>
                            <div class="position-relative">
                                <input type="password" class="form-control" id="passconf" name="passconf" placeholder="Confirm password">
                                <div class="invalid-feedback" id="invalid_passconf"></div>
                                <img src="<?= base_url('assets/icons/show.png') ?>" class="position-absolute" id="eye_passconf">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3 float-end">Simpan Perubahan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function toggleVisibility(inputElement, eyeElement) {
    const showIcon = "<?= base_url('assets/icons/show.png') ?>";
    const hideIcon = "<?= base_url('assets/icons/hide.png') ?>";
    inputElement.type = inputElement.type === 'password' ? 'text' : 'password';
    eyeElement.src = inputElement.type === 'password' ? showIcon : hideIcon;
}

dom('#eye_password').addEventListener('click', () => {
    toggleVisibility(dom('#password'), dom('#eye_password'));
});

dom('#eye_passconf').addEventListener('click', () => {
    toggleVisibility(dom('#passconf'), dom('#eye_passconf'));
});
</script>

<script>
dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>update';
    submitData(dom('#form'), endpoint);
});

dom('#form_ubah_password').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>update/password';
    submitData(dom('#form_ubah_password'), endpoint);
});
</script>
