<?php
$get_nim = $_GET['nim'] ?? '';

$mahasiswa = model('Users')
->where([
    'id_role'         => 5,
    'nomor_identitas' => $get_nim,
])
->first();

if ($mahasiswa) {
    $daftar_tagihan = model('TagihanMahasiswa')
    ->where([
        'id_tahun_akademik >=' => $mahasiswa['id_tahun_akademik_diterima'],
    ])
    ->findAll();
} else {
    $daftar_tagihan = [];
}
?>

<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4"><?= isset($title) ? $title : '' ?></h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6 col-lg-5 col-xl-4">
                        <form action="" method="get">
                            <div class="d-flex align-items-end gap-2 w-100">
                                <div class="flex-grow-1">
                                    <label for="nim" class="form-label">NIM</label>
                                    <input type="number" class="form-control" id="nim" name="nim" value="<?= $get_nim ?>" placeholder="Masukkan nim">
                                </div>
                                <button type="submit" class="btn btn-primary" title="Cari">
                                    <i class="fa-solid fa-search"></i>
                                    <span class="ms-1 d-md-none">Cari</span>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-12 col-md-6 col-lg-7 col-xl-8">
                        <?php if ($mahasiswa) : ?>
                        <table class="table">
                            <tr>
                                <td class="fw-500">Nama Mahasiswa</td>
                                <td>: <?= $mahasiswa['nama'] ?> (<?= $mahasiswa['nomor_identitas'] ?>)</td>
                            </tr>
                            <tr>
                                <td class="fw-500">Program Studi</td>
                                <td>: <?= $mahasiswa['jenjang_program_studi'] ?> - <?= $mahasiswa['nama_program_studi'] ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Mulai Kuliah</td>
                                <td>: <?= $mahasiswa['tahun_akademik_diterima'] ?> - <?= $mahasiswa['tipe_tahun_akademik'] ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Semester dan Kelas</td>
                                <td>: <?= $mahasiswa['semester'] ?> - <?= $mahasiswa['kelas'] ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Status</td>
                                <td>: <?= $mahasiswa['status'] ?></td>
                            </tr>
                        </table>
                        <?php else : if ($get_nim != '') : ?>
                        <span class="fw-500 text-danger">Mahasiswa tidak ditemukan!</span>
                        <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>
                <h5 class="my-3">Daftar Tagihan</h5>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th class="text-center">No.</th>
                            <th>Tahun Akademik</th>
                            <th>Jenis Tagihan</th>
                            <th>Nominal</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $total_tagihan = 0;
                        foreach ($daftar_tagihan as $key => $v) :
                            $status_mahasiswa = model('StatusMahasiswa')->where('id_mahasiswa', $mahasiswa['id'])->findAll();
                            foreach ($status_mahasiswa as $v2) {
                                if (in_array($v2['status'], ['Cuti', 'DO'])) {
                                    if ($v['id_tahun_akademik'] >= $v2['id_tahun_akademik']) {
                                        continue 2;
                                    }
                                }

                                if ($v2['status'] == 'Aktif') {
                                    if (
                                        ($v['id_tahun_akademik'] >= $v2['id_tahun_akademik']) &&
                                        ($v['id_tahun_akademik'] <= $v2['id_tahun_akademik_selesai_cuti'])
                                    ) {
                                        continue 2;
                                    }
                                }
                            }

                            $biaya = 0;
                            if ($v['kategori'] == 'PERORANGAN') {
                                if (! in_array($mahasiswa['id'], json_decode($v['json_id_mahasiswa']))) {
                                    continue;
                                }

                                // Tagihan Perorangan
                                if ($v['jenis'] == 'LDKM') {
                                    $biaya = $mahasiswa['biaya_ldkm'];
                                } elseif ($v['jenis'] == 'MBKM') {
                                    $biaya = $mahasiswa['biaya_mbkm'];
                                } elseif ($v['jenis'] == 'BIMBINGAN SKRIPSI') {
                                    $biaya = $mahasiswa['biaya_bimbingan_skripsi'];
                                } elseif ($v['jenis'] == 'SEMINAR PROPOSAL') {
                                    $biaya = $mahasiswa['biaya_seminar_proposal'];
                                } elseif ($v['jenis'] == 'SIDANG SKRIPSI') {
                                    $biaya = $mahasiswa['biaya_sidang_skripsi'];
                                } elseif ($v['jenis'] == 'YUDISIUM') {
                                    $biaya = $mahasiswa['biaya_yudisium'];
                                } elseif ($v['jenis'] == 'WISUDA') {
                                    $biaya = $mahasiswa['biaya_wisuda'];
                                }
                            }

                            // Tagihan Maba
                            if ($v['jenis'] == 'ALMAMATER') {
                                $biaya = $mahasiswa['biaya_almamater'];
                            } elseif ($v['jenis'] == 'KTM') {
                                $biaya = $mahasiswa['biaya_ktm'];
                            } elseif ($v['jenis'] == 'UANG GEDUNG') {
                                $biaya = $mahasiswa['biaya_uang_gedung'];
                            }

                            // Tagihan Semester
                            if ($v['jenis'] == 'SPP') {
                                $biaya = $mahasiswa['biaya_spp'];
                            } elseif ($v['jenis'] == 'UTS') {
                                $biaya = $mahasiswa['biaya_uts'];
                            } elseif ($v['jenis'] == 'UAS') {
                                $biaya = $mahasiswa['biaya_uas'];
                            }

                            $pembayaran_mahasiswa = model('PembayaranMahasiswa')
                            ->where([
                                'id_tagihan_mahasiswa' => $v['id'],
                                'id_mahasiswa'         => $mahasiswa['id'],
                            ])->first();

                            if ($pembayaran_mahasiswa) {
                                $status = $pembayaran_mahasiswa['status'];
                                $class_status = 'badge text-bg-success';
                            } else {
                                $status = 'Belum Lunas';
                                $class_status = 'badge text-bg-warning';
                            }

                            $total_tagihan += $biaya;
                        ?>
                        <tr>
                            <td class="text-center"><?= $key+1 ?></td>
                            <td><?= $v['tahun_akademik'] ?> - <?= $v['tipe_tahun_akademik'] ?></td>
                            <td><?= $v['jenis'] ?></td>
                            <td><?= formatRupiah($biaya) ?></td>
                            <td>
                                <span class="<?= $class_status ?> me-2">
                                    <?= $status ?>
                                </span>
                                <?php if ($status == 'Belum Lunas') : ?>
                                <a class="fw-500" data-bs-toggle="modal" data-bs-target="#setujui_<?= $key ?>">
                                    Setujui?
                                </a>
                                <div class="modal fade" id="setujui_<?= $key ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5">Konfirmasi Pembayaran</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <label class="form-label">Nama Mahasiswa</label>
                                                    <input type="text" class="form-control" value="<?= $mahasiswa['nama'] ?>" disabled>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Program Studi</label>
                                                    <input type="text" class="form-control" value="<?= $mahasiswa['jenjang_program_studi'] ?> - <?= $mahasiswa['nama_program_studi'] ?>" disabled>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Jenis Tagihan</label>
                                                    <input type="text" class="form-control" value="<?= $v['jenis'] ?>" disabled>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Nominal</label>
                                                    <input type="text" class="form-control" value="<?= formatRupiah($biaya) ?>" disabled>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                <form id="form_<?= $key ?>">
                                                    <input type="hidden" name="id_tagihan_mahasiswa" value="<?= $v['id'] ?>">
                                                    <input type="hidden" name="id_mahasiswa" value="<?= $mahasiswa['id'] ?>">
                                                    <input type="hidden" name="nominal" value="<?= $biaya ?>">
                                                    <button type="submit" class="btn btn-primary">Lunas</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                dom('#form_<?= $key ?>').addEventListener('submit', function(event) {
                                    event.preventDefault();
                                    const endpoint = '<?= $base_api ?>create';
                                    submitData(dom('#form_<?= $key ?>'), endpoint);
                                });
                                </script>
                                <?php endif; ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-center">Total</td>
                            <td colspan="2"></td>
                            <td class="fw-600"><?= formatRupiah($total_tagihan) ?></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>
