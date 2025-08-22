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
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="mb-2">
                                    <span class="fw-600">Data Diri</span>
                                </div>
                                <div class="mb-3">
                                    <label for="nomor_identitas" class="form-label">NIM</label>
                                    <input type="number" class="form-control" id="nomor_identitas" name="nomor_identitas" value="<?= $data['nomor_identitas'] ?>" placeholder="Masukkan nomor identitas">
                                    <div class="invalid-feedback" id="invalid_nomor_identitas"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="nama" class="form-label">Nama Mahasiswa</label>
                                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $data['nama'] ?>" placeholder="Masukkan nama mahasiswa">
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
                                        <label class="form-check-label" for="<?= $v ?>">
                                            <?= $v ?>
                                        </label>
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
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<?= $data['email'] ?>" placeholder="name@gmail.com">
                                    <div class="invalid-feedback" id="invalid_email"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="no_hp" class="form-label">No. HP</label>
                                    <input type="number" class="form-control" id="no_hp" name="no_hp" value="<?= $data['no_hp'] ?>" placeholder="08xx">
                                    <div class="invalid-feedback" id="invalid_no_hp"></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="mb-2">
                                    <span class="fw-600">Detail Kuliah dan Biaya</span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Program Studi</label>
                                    <input type="text" class="form-control" value="<?= $data['jenjang_program_studi'] ?> - <?= $data['nama_program_studi'] ?>" disabled>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tahun Akademik Diterima</label>
                                    <input type="text" class="form-control" value="<?= $data['tahun_akademik_diterima'] ?> - <?= $data['tipe_tahun_akademik'] ?>" disabled>
                                </div>
                                <div class="row gx-3">
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="semester" class="form-label">Semester</label>
                                            <select class="form-select" id="semester" name="semester">
                                                <option value="">Pilih</option>
                                                <?php
                                                $semester = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14'];
                                                foreach ($semester as $v) :
                                                    $selected = ($v == $data['semester']) ? 'selected' : '';
                                                ?>
                                                <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <div class="invalid-feedback" id="invalid_semester"></div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="kelas" class="form-label">Kelas</label>
                                            <select class="form-select" id="kelas" name="kelas">
                                                <option value="">Pilih</option>
                                                <?php
                                                $kelas = ['A', 'B', 'C', 'D', 'E'];
                                                foreach ($kelas as $v) :
                                                    $selected = ($v == $data['kelas']) ? 'selected' : '';
                                                ?>
                                                <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <div class="invalid-feedback" id="invalid_kelas"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <input type="text" class="form-control" value="<?= $data['status'] ?>" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_almamater" class="form-label">Biaya Almamater</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_almamater" value="<?= dotsNumber($data['biaya_almamater']) ?>" placeholder="Masukkan biaya almamater" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_almamater"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_ktm" class="form-label">Biaya KTM</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_ktm" value="<?= dotsNumber($data['biaya_ktm']) ?>" placeholder="Masukkan biaya KTM" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_ktm"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_uang_gedung" class="form-label">Biaya Uang Gedung</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_uang_gedung" value="<?= dotsNumber($data['biaya_uang_gedung']) ?>" placeholder="Masukkan biaya uang gedung" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_uang_gedung"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="spp" class="form-label">SPP</label>
                                    <select class="form-select" id="spp" name="spp">
                                        <option value="">Pilih</option>
                                        <?php
                                        $spp = model('TarifSpp')->findAll();
                                        foreach ($spp as $v) :
                                            $selected = ($v['id'] == $data['id_spp']) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['nama'] ?> - <?= formatRupiah($v['biaya']) ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <div class="invalid-feedback" id="invalid_spp"></div>
                                </div>
                                <div class="row gx-3">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="biaya_uts" class="form-label">Biaya UTS</label>
                                            <input type="text" inputmode="numeric" class="form-control" name="biaya_uts" value="<?= dotsNumber($data['biaya_uts']) ?>" placeholder="Masukkan biaya UTS" oninput="this.value = dotsNumber(this.value)">
                                            <div class="invalid-feedback" id="invalid_biaya_uts"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                         <div class="mb-3">
                                            <label for="biaya_uas" class="form-label">Biaya UAS</label>
                                            <input type="text" inputmode="numeric" class="form-control" name="biaya_uas" value="<?= dotsNumber($data['biaya_uas']) ?>" placeholder="Masukkan biaya UAS" oninput="this.value = dotsNumber(this.value)">
                                            <div class="invalid-feedback" id="invalid_biaya_uas"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gx-3">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="biaya_ldkm" class="form-label">Biaya LDKM</label>
                                            <input type="text" inputmode="numeric" class="form-control" name="biaya_ldkm" value="<?= dotsNumber($data['biaya_ldkm']) ?>" placeholder="Masukkan biaya LDKM" oninput="this.value = dotsNumber(this.value)">
                                            <div class="invalid-feedback" id="invalid_biaya_ldkm"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                         <div class="mb-3">
                                            <label for="biaya_mbkm" class="form-label">Biaya MBKM</label>
                                            <input type="text" inputmode="numeric" class="form-control" name="biaya_mbkm" value="<?= dotsNumber($data['biaya_mbkm']) ?>" placeholder="Masukkan biaya MBKM" oninput="this.value = dotsNumber(this.value)">
                                            <div class="invalid-feedback" id="invalid_biaya_mbkm"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_bimbingan_skripsi" class="form-label">Biaya Bimbingan Skripsi</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_bimbingan_skripsi" value="<?= dotsNumber($data['biaya_bimbingan_skripsi']) ?>" placeholder="Masukkan biaya bimbingan skripsi" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_bimbingan_skripsi"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_seminar_proposal" class="form-label">Biaya Seminar Proposal</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_seminar_proposal" value="<?= dotsNumber($data['biaya_seminar_proposal']) ?>" placeholder="Masukkan biaya seminar proposal" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_seminar_proposal"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_sidang_skripsi" class="form-label">Biaya Sidang Skripsi</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_sidang_skripsi" value="<?= dotsNumber($data['biaya_sidang_skripsi']) ?>" placeholder="Masukkan biaya sidang skripsi" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_sidang_skripsi"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_yudisium" class="form-label">Biaya Yudisium</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_yudisium" value="<?= dotsNumber($data['biaya_yudisium']) ?>" placeholder="Masukkan biaya yudisium" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_yudisium"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="biaya_wisuda" class="form-label">Biaya Wisuda</label>
                                    <input type="text" inputmode="numeric" class="form-control" name="biaya_wisuda" value="<?= dotsNumber($data['biaya_wisuda']) ?>" placeholder="Masukkan biaya wisuda" oninput="this.value = dotsNumber(this.value)">
                                    <div class="invalid-feedback" id="invalid_biaya_wisuda"></div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3 float-end">
                            <a href="<?= $base_route ?>" class="btn btn-secondary me-2">Kembali</a>
                            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#spp'), { search: true });
dselect(dom('#semester'), { search: true });

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>update/<?= $data['id'] ?>';
    submitData(dom('#form'), endpoint);
});
</script>
