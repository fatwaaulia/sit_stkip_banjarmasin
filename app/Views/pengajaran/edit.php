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
                                <label class="form-label">Program Studi</label>
                                <input type="text" class="form-control" value="<?= $data['jenjang_program_studi'] ?> - <?= $data['nama_program_studi'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                                <input type="text" class="form-control" id="tahun_akademik" name="tahun_akademik" value="<?= $data['tahun_akademik'] ?>" placeholder="Cth. 2024/2025">
                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                            </div>
                            <div class="mb-3">
                                <label for="kode" class="form-label">Kode</label>
                                <input type="text" class="form-control" id="kode" name="kode" value="<?= $data['kode'] ?>" placeholder="Masukkan kode">
                                <div class="invalid-feedback" id="invalid_kode"></div>
                            </div>
                            <div class="mb-3">
                                <label for="nama_mata_kuliah" class="form-label">Nama Mata Kuliah</label>
                                <input type="text" class="form-control" id="nama_mata_kuliah" name="nama_mata_kuliah" value="<?= $data['nama_mata_kuliah'] ?>" placeholder="Masukkan nama mata kuliah">
                                <div class="invalid-feedback" id="invalid_nama_mata_kuliah"></div>
                            </div>
                            <div class="mb-3">
                                <label for="sks" class="form-label">SKS</label>
                                <input type="text" class="form-control" id="sks" name="sks" value="<?= $data['sks'] ?>" placeholder="Masukkan sks">
                                <div class="invalid-feedback" id="invalid_sks"></div>
                            </div>
                            <div class="mb-3">
                                <label for="hari" class="form-label">Hari</label>
                                <select class="form-select" id="hari" name="hari">
                                    <option value="">Pilih</option>
                                    <?php
                                    $hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
                                    foreach ($hari as $v) :
                                        $selected = ($v == $data['hari']) ? 'selected' : '';
                                    ?>
                                    <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <div class="invalid-feedback" id="invalid_hari"></div>
                            </div>
                            <div class="row gx-2">
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="jam_mulai" class="form-label">Jam Mulai</label>
                                        <input type="time" class="form-control" id="jam_mulai" name="jam_mulai" value="<?= toUserTime($data['jam_mulai']) ?>" placeholder="Masukkan jam mulai">
                                        <div class="invalid-feedback" id="invalid_jam_mulai"></div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="jam_selesai" class="form-label">Jam Selesai</label>
                                        <input type="time" class="form-control" id="jam_selesai" name="jam_selesai" value="<?= toUserTime($data['jam_selesai']) ?>" placeholder="Masukkan jam selesai">
                                        <div class="invalid-feedback" id="invalid_jam_selesai"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="ruangan" class="form-label">Ruangan</label>
                                <input type="text" class="form-control" id="ruangan" name="ruangan" value="<?= $data['ruangan'] ?>" placeholder="Masukkan ruangan">
                                <div class="invalid-feedback" id="invalid_ruangan"></div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Dosen Pengampu</label>
                                <input type="text" class="form-control" value="<?= $data['dosen_pengampu'] ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="tautan" class="form-label">Tautan</label>
                                <input type="text" class="form-control" id="tautan" name="tautan" value="<?= $data['tautan'] ?>" placeholder="Masukkan tautan">
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
