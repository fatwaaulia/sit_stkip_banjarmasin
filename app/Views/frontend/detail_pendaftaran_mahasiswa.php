<section class="container-fluid min-vh-100" style="background:radial-gradient(circle at 30% 30%,#66c28a 0%,#00993c 55%,#005c24 100%);">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="col-12">
                            <h4>Status : <?= $data['status'] ?></h4>
                            <p>Tanggal Mendaftar : <?= date('d-m-Y H:i:s', strtotime(toUserTime($data['mendaftar_at']))) ?></p>
                            <hr style="border: 1px solid #eee">
                            <div class="mb-2">
                                <span class="fw-600">Data Diri</span>
                            </div>
                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama Pendaftar</label>
                                <input type="text" class="form-control" id="nama" name="nama" value="<?= $data['nama'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Kelamin</label>
                                <?php
                                $jenis_kelamin = ['Laki-laki', 'Perempuan'];
                                foreach ($jenis_kelamin as $v) :
                                    $checked = ($v == $data['jenis_kelamin']) ? 'checked' : '';
                                ?>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="<?= $v ?>" value="<?= $v ?>" <?= $checked ?> disabled>
                                    <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                </div>
                                <?php endforeach; ?>
                            </div>
                            <div class="row gx-3">
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="tempat_lahir" class="form-label">Tempat Lahir</label>
                                        <input type="text" class="form-control" value="<?= $data['tempat_lahir'] ?>" disabled>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="tanggal_lahir" class="form-label">Tanggal Lahir</label>
                                        <input type="date" class="form-control" value="<?= $data['tanggal_lahir'] ?>" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Agama</label>
                                <?php
                                $agama = ['Islam', 'Kristen Protestan', 'Katolik', 'Hindu', 'Buddha', 'Konghucu'];
                                foreach ($agama as $v) :
                                    $checked = ($v == $data['agama']) ? 'checked' : '';
                                ?>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="<?= $v ?>" <?= $checked ?> disabled>
                                    <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                </div>
                                <?php endforeach; ?>
                            </div>
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat</label>
                                <textarea class="form-control" id="alamat" rows="3" disabled><?= $data['alamat'] ?></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Status Perkawinan</label>
                                <?php
                                $status_perkawinan = ['Belum Kawin', 'Kawin', 'Cerai Hidup', 'Cerai Mati'];
                                foreach ($status_perkawinan as $v) :
                                    $checked = ($v == $data['status_perkawinan']) ? 'checked' : '';
                                ?>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="<?= $v ?>" value="<?= $v ?>" <?= $checked ?> disabled>
                                    <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                </div>
                                <?php endforeach; ?>
                                <div class="invalid-feedback" id="invalid_status_perkawinan"></div>
                            </div>
                            <div class="mb-3">
                                <label for="kewarganegaraan" class="form-label">Kewarganegaraan</label>
                                <input type="text" class="form-control" value="<?= $data['kewarganegaraan'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control"  value="<?= $data['email'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="no_hp" class="form-label">No. HP</label>
                                <input type="number" class="form-control"  value="<?= $data['no_hp'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="asal_sekolah" class="form-label">Asal Sekolah</label>
                                <input type="text" class="form-control" value="<?= $data['asal_sekolah'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="nomor_ijazah" class="form-label">Nomor Ijazah</label>
                                <input type="text" class="form-control"  value="<?= $data['nomor_ijazah'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="tahun_ijazah" class="form-label">Tahun Ijazah</label>
                                <input type="text" class="form-control" value="<?= $data['tahun_ijazah'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="nilai_rata_rata" class="form-label">Nilai Rata Rata</label>
                                <input type="text" class="form-control" value="<?= $data['nilai_rata_rata'] ?>" disabled>
                            </div>
                            <div class="mb-2">
                                <span class="fw-600">Data Ayah</span>
                            </div>
                            <div class="mb-3">
                                <label for="nama_ayah" class="form-label">Nama Ayah</label>
                                <input type="text" class="form-control" value="<?= $data['nama_ayah'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="no_hp_ayah" class="form-label">No. HP Ayah</label>
                                <input type="number" class="form-control" value="<?= $data['no_hp_ayah'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="pekerjaan_ayah" class="form-label">Pekerjaan Ayah</label>
                                <input type="text" class="form-control" value="<?= $data['pekerjaan_ayah'] ?>" disabled>
                            </div>
                            <div class="mb-2">
                                <span class="fw-600">Data Ibu</span>
                            </div>
                            <div class="mb-3">
                                <label for="nama_ibu" class="form-label">Nama Ibu</label>
                                <input type="text" class="form-control" id="nama_ibu" value="<?= $data['nama_ibu'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="no_hp_ibu" class="form-label">No. HP Ibu</label>
                                <input type="number" class="form-control" id="no_hp_ibu" value="<?= $data['no_hp_ibu'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="pekerjaan_ibu" class="form-label">Pekerjaan Ibu</label>
                                <input type="text" class="form-control" id="pekerjaan_ibu" value="<?= $data['pekerjaan_ibu'] ?>" disabled>
                            </div>
                            <div class="mb-2">
                                <span class="fw-600">Data Wali</span>
                            </div>
                            <div class="mb-3">
                                <label for="nama_wali" class="form-label">Nama Wali</label>
                                <input type="text" class="form-control" id="nama_wali" value="<?= $data['nama_wali'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="no_hp_wali" class="form-label">No. HP Wali</label>
                                <input type="number" class="form-control" id="no_hp_wali" value="<?= $data['no_hp_wali'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="pekerjaan_wali" class="form-label">Pekerjaan Wali</label>
                                <input type="text" class="form-control" id="pekerjaan_wali" value="<?= $data['pekerjaan_wali'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Foto Pendaftar</label>
                                <div class="d-flex">
                                    <div class="position-relative">
                                        <img src="<?= webFile('image_user', 'users', $data['foto'], $data['updated_at']) ?>" class="wh-150 cover-center rounded-circle" id="frame_foto">
                                    </div>
                                </div>
                                <div class="invalid-feedback" id="invalid_foto"></div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Sumber Informasi</label>
                                <input type="text" class="form-control" value="<?= $data['jenjang_program_studi'] ?> - <?= $data['nama_program_studi'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="sumber_informasi" class="form-label">Sumber Informasi</label>
                                <input type="text" class="form-control" value="<?= $data['sumber_informasi'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <input type="text" class="form-control" value="<?= $data['status'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tanggal Mendaftar</label>
                                <input type="text" class="form-control" value="<?= date('d-m-Y H:i:s', strtotime(toUserTime($data['mendaftar_at']))) ?>" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
