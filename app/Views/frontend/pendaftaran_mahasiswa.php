<?php
$tahun_akademik_aktif = model('TahunAkademik')->orderBy('id DESC')->first();

if ($tahun_akademik_aktif) {
    $tahun_akademik_header = $tahun_akademik_aktif['tahun_akademik'] . ' - ' . $tahun_akademik_aktif['tipe'];
} else {
    $tahun_akademik_header = '-';
}

$tarif_spp = model('TarifSpp')->findAll();

$buka_pendaftaran_mahasiswa = true;
if (!$tarif_spp || appSettings('buka_pendaftaran_mahasiswa') == 'Tutup') {
    $buka_pendaftaran_mahasiswa = false;
}
?>

<link rel="stylesheet" href="<?= base_url() ?>assets/modules/dselect/dselect.min.css">
<script src="<?= base_url() ?>assets/modules/dselect/dselect.min.js"></script>

<section class="container-fluid min-vh-100" style="background:radial-gradient(circle at 30% 30%,#66c28a 0%,#00993c 55%,#005c24 100%);">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-md-6 col-lg-9 col-xl-8">
                                <h4><?= isset($title) ? $title : '' ?></h4>
                                <p class="mb-0">Tahun Ajaran <?= $tahun_akademik_header ?></p>
                            </div>
                            <div class="col-12 col-md-6 col-lg-3 col-xl-4">
                                <div class="text-end">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#lacakPendaftarMahasiswa">Lacak Pendaftar</a>
                                </div>
                                <div class="modal fade" id="lacakPendaftarMahasiswa" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Lacak Pendaftar Mahasiswa</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form action="<?= base_url() ?>pendaftaran-mahasiswa/detail" method="get">
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="email" class="form-label">Email</label>
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Masukkan email Anda" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                                    <button type="submit" class="btn btn-primary">Cari Sekarang</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr style="border: 1px solid #eee">
                        <?php if (! $buka_pendaftaran_mahasiswa) : ?>
                        <div>
                            <h3>Pendaftaran Mahasiswa ditutup.</h3>
                            <?php
                            if (in_array(userSession('id_role'), [1, 17, 2])) {
                                echo empty($tarif_spp) ? 'Tarif SPP Belum Dibuat.' : ''; echo '<br>';
                                echo '<a href="' . base_url(userSession('slug_role')) . '/tarif-spp" target="_blank">Buat Tarif SPP</a>';
                            }
                            ?>
                        </div>
                        <?php else : ?>
                        <form id="form">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-2">
                                        <span class="fw-600">Data Diri</span>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nama" class="form-label">Nama Pendaftar</label>
                                        <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama pendaftar">
                                        <div class="invalid-feedback" id="invalid_nama"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Jenis Kelamin</label>
                                        <?php
                                        $jenis_kelamin = ['Laki-laki', 'Perempuan'];
                                        foreach ($jenis_kelamin as $v) :
                                        ?>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="<?= $v ?>" name="jenis_kelamin" value="<?= $v ?>">
                                            <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                        </div>
                                        <?php endforeach; ?>
                                        <div class="invalid-feedback" id="invalid_jenis_kelamin"></div>
                                    </div>
                                    <div class="row gx-3">
                                        <div class="col-12 col-md-6">
                                            <div class="mb-3">
                                                <label for="tempat_lahir" class="form-label">Tempat Lahir</label>
                                                <input type="text" class="form-control" id="tempat_lahir" name="tempat_lahir" placeholder="Masukkan tempat lahir">
                                                <div class="invalid-feedback" id="invalid_tempat_lahir"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="mb-3">
                                                <label for="tanggal_lahir" class="form-label">Tanggal Lahir</label>
                                                <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir">
                                                <div class="invalid-feedback" id="invalid_tanggal_lahir"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Agama</label>
                                        <?php
                                        $agama = ['Islam', 'Kristen Protestan', 'Katolik', 'Hindu', 'Buddha', 'Konghucu'];
                                        foreach ($agama as $v) :
                                        ?>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="<?= $v ?>" name="agama" value="<?= $v ?>">
                                            <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                        </div>
                                        <?php endforeach; ?>
                                        <div class="invalid-feedback" id="invalid_agama"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="alamat" class="form-label">Alamat</label>
                                        <textarea class="form-control" id="alamat" name="alamat" rows="3" placeholder="Masukkan alamat"></textarea>
                                        <div class="invalid-feedback" id="invalid_alamat"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status Perkawinan</label>
                                        <?php
                                        $status_perkawinan = ['Belum Kawin', 'Kawin', 'Cerai Hidup', 'Cerai Mati'];
                                        foreach ($status_perkawinan as $v) :
                                        ?>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="<?= $v ?>" name="status_perkawinan" value="<?= $v ?>">
                                            <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                        </div>
                                        <?php endforeach; ?>
                                        <div class="invalid-feedback" id="invalid_status_perkawinan"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="kewarganegaraan" class="form-label">Kewarganegaraan</label>
                                        <input type="text" class="form-control" id="kewarganegaraan" name="kewarganegaraan" value="Indonesia" placeholder="Indonesia">
                                        <div class="invalid-feedback" id="invalid_kewarganegaraan"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="name@gmail.com">
                                        <div class="invalid-feedback" id="invalid_email"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp" class="form-label">No. HP</label>
                                        <input type="number" class="form-control" id="no_hp" name="no_hp" placeholder="08xx">
                                        <div class="invalid-feedback" id="invalid_no_hp"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="asal_sekolah" class="form-label">Asal Sekolah</label>
                                        <input type="text" class="form-control" id="asal_sekolah" name="asal_sekolah" placeholder="Masukkan asal sekolah">
                                        <div class="invalid-feedback" id="invalid_asal_sekolah"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nomor_ijazah" class="form-label">Nomor Ijazah</label>
                                        <input type="text" class="form-control" id="nomor_ijazah" name="nomor_ijazah" placeholder="Masukkan nomor ijazah">
                                        <div class="invalid-feedback" id="invalid_nomor_ijazah"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="tahun_ijazah" class="form-label">Tahun Ijazah</label>
                                        <input type="number" min="1900" max="2100" step="1" class="form-control" id="tahun_ijazah" name="tahun_ijazah" placeholder="Masukkan tahun ijazah">
                                        <div class="invalid-feedback" id="invalid_tahun_ijazah"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nilai_rata_rata" class="form-label">Nilai Rata Rata</label>
                                        <input type="text" class="form-control" id="nilai_rata_rata" name="nilai_rata_rata" placeholder="Masukkan nilai rata rata" oninput="this.value = this.value.replace(/[^0-9.]/g, '')">
                                        <div class="invalid-feedback" id="invalid_nilai_rata_rata"></div>
                                    </div>
                                    <div class="mb-2">
                                        <span class="fw-600">Data Ayah</span>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nama_ayah" class="form-label">Nama Ayah</label>
                                        <input type="text" class="form-control" id="nama_ayah" name="nama_ayah" placeholder="Masukkan nama ayah">
                                        <div class="invalid-feedback" id="invalid_nama_ayah"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp_ayah" class="form-label">No. HP Ayah</label>
                                        <input type="number" class="form-control" id="no_hp_ayah" name="no_hp_ayah" placeholder="Masukkan no hp ayah">
                                        <div class="invalid-feedback" id="invalid_no_hp_ayah"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pekerjaan_ayah" class="form-label">Pekerjaan Ayah</label>
                                        <input type="text" class="form-control" id="pekerjaan_ayah" name="pekerjaan_ayah" placeholder="Masukkan pekerjaan ayah">
                                        <div class="invalid-feedback" id="invalid_pekerjaan_ayah"></div>
                                    </div>
                                    <div class="mb-2">
                                        <span class="fw-600">Data Ibu</span>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nama_ibu" class="form-label">Nama Ibu</label>
                                        <input type="text" class="form-control" id="nama_ibu" name="nama_ibu" placeholder="Masukkan nama ibu">
                                        <div class="invalid-feedback" id="invalid_nama_ibu"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp_ibu" class="form-label">No. HP Ibu</label>
                                        <input type="number" class="form-control" id="no_hp_ibu" name="no_hp_ibu" placeholder="Masukkan no hp ibu">
                                        <div class="invalid-feedback" id="invalid_no_hp_ibu"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pekerjaan_ibu" class="form-label">Pekerjaan Ibu</label>
                                        <input type="text" class="form-control" id="pekerjaan_ibu" name="pekerjaan_ibu" placeholder="Masukkan pekerjaan ibu">
                                        <div class="invalid-feedback" id="invalid_pekerjaan_ibu"></div>
                                    </div>
                                    <div class="mb-2">
                                        <span class="fw-600">Data Wali</span>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nama_wali" class="form-label">Nama Wali</label>
                                        <input type="text" class="form-control" id="nama_wali" name="nama_wali" placeholder="Masukkan nama wali">
                                        <div class="invalid-feedback" id="invalid_nama_wali"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp_wali" class="form-label">No. HP Wali</label>
                                        <input type="number" class="form-control" id="no_hp_wali" name="no_hp_wali" placeholder="Masukkan no hp wali">
                                        <div class="invalid-feedback" id="invalid_no_hp_wali"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pekerjaan_wali" class="form-label">Pekerjaan Wali</label>
                                        <input type="text" class="form-control" id="pekerjaan_wali" name="pekerjaan_wali" placeholder="Masukkan pekerjaan wali">
                                        <div class="invalid-feedback" id="invalid_pekerjaan_wali"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Foto Pendaftar</label>
                                        <div class="d-flex">
                                            <div class="position-relative">
                                                <img src="<?= webFile('image_user') ?>" class="wh-150 cover-center rounded-circle" id="frame_foto">
                                                <div class="position-absolute" style="bottom: 0px; right: 0px;">
                                                    <button class="btn btn-secondary rounded-circle" style="padding: 8px;" type="button" onclick="dom('#foto').click()">
                                                        <i class="fa-solid fa-camera fa-lg"></i>
                                                    </button>
                                                    <input type="file" class="form-control d-none" id="foto" name="foto" accept=".png,.jpg,.jpeg" onchange="dom('#frame_foto').src = window.URL.createObjectURL(this.files[0]);">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback" id="invalid_foto"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="program_studi" class="form-label">Program Studi</label>
                                        <select class="form-select" id="program_studi" name="program_studi">
                                            <option value="">Pilih</option>
                                            <?php
                                            $program_studi = model('ProgramStudi')->findAll();
                                            foreach ($program_studi as $v) :
                                            ?>
                                            <option value="<?= $v['id'] ?>"><?= $v['jenjang'] ?> - <?= $v['nama'] ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <div class="invalid-feedback" id="invalid_program_studi"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="sumber_informasi" class="form-label">Sumber Informasi</label>
                                        <input type="text" class="form-control" id="sumber_informasi" name="sumber_informasi" placeholder="Cth. media sosial, teman, saudara dsb.">
                                        <div class="invalid-feedback" id="invalid_sumber_informasi"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="kode_pendaftaran" class="form-label">Kode Pendaftaran</label>
                                        <input type="text" class="form-control" id="kode_pendaftaran" name="kode_pendaftaran" placeholder="Masukkan kode pendaftaran">
                                        <div class="invalid-feedback" id="invalid_kode_pendaftaran"></div>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" name="persetujuan" value="true" id="checkDefault">
                                        <label class="form-check-label" for="checkDefault">
                                            Saya memastikan bawah data diatas telah benar.
                                        </label>
                                        <div class="invalid-feedback" id="invalid_persetujuan"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3 float-end">
                                <button type="submit" class="btn btn-primary">Mendaftar Sekarang</button>
                            </div>
                        </form>
                        <script>
                        dselect(dom('#program_studi'), { search: true });
                        
                        dom('#form').addEventListener('submit', function(event) {
                            event.preventDefault();
                            const endpoint = '<?= base_url() ?>api/pendaftar-mahasiswa/create';
                            submitData(dom('#form'), endpoint);
                        });
                        </script>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
