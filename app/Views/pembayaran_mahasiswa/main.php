<?php
$get_tagihan_mahasiswa = $_GET['tagihan_mahasiswa'] ?? '';
$get_status = $_GET['status'] ?? '';
$get_program_studi = $_GET['program_studi'] ?? '';
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/datatables/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/dselect/dselect.min.css">
<script src="<?= base_url() ?>assets/modules/dselect/dselect.min.js"></script>

<style>
table tr th { text-align: center!important; }
</style>

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
                    <div class="col-12">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                                    <label for="tagihan_mahasiswa" class="form-label">Tagihan Mahasiswa</label>
                                    <select class="form-select" id="tagihan_mahasiswa" name="tagihan_mahasiswa">
                                        <option value="">Pilih</option>
                                        <?php
                                        $tagihan_mahasiswa = model('TagihanMahasiswa')->orderBy('id DESC')->findAll();
                                        foreach ($tagihan_mahasiswa as $v) :
                                            $selected = ($v['id'] == $get_tagihan_mahasiswa) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['jenis'] ?> - <?= $v['tahun_akademik'] ?> - <?= $v['tipe_tahun_akademik'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-select" id="status" name="status">
                                        <option value="">Semua</option>
                                        <?php
                                        $status = ['Lunas', 'Belum Lunas'];
                                        foreach ($status as $v) :
                                            $selected = ($v == $get_status) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                                    <label for="program_studi" class="form-label">Program Studi</label>
                                    <select class="form-select" id="program_studi" name="program_studi">
                                        <option value="">Semua</option>
                                        <?php
                                        $program_studi = model('ProgramStudi')->findAll();
                                        foreach ($program_studi as $v) :
                                            $selected = ($v['id'] == $get_program_studi) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['jenjang'] ?> - <?= $v['nama'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-2 col-lg-2 col-xl-2 d-flex justify-content-start align-items-end">
                                    <button type="submit" class="btn btn-primary me-2 w-100" title="Filter">
                                        <i class="fa-solid fa-filter"></i>
                                        <span class="ms-1 d-md-none">Filter</span>
                                    </button>
                                    <a href="<?= $base_route ?>" class="btn btn-outline-danger w-100" title="Reset">
                                        <i class="fa-solid fa-filter-circle-xmark"></i>
                                        <span class="ms-1 d-md-none">Reset</span>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th rowspan="2">No.</th>
                            <th rowspan="2">NIM</th>
                            <th rowspan="2">Nama Mahasiswa</th>
                            <th colspan="2">Tahap 1</th>
                            <th colspan="2">Tahap 2</th>
                            <th colspan="2">Tahap 3</th>
                            <th colspan="2">Tahap 4</th>
                            <th colspan="2">Tahap 5</th>
                            <th colspan="2">Tahap 6</th>
                            <th rowspan="2">Jumlah</th>
                            <th rowspan="2">Tagihan</th>
                            <th rowspan="2">Status</th>
                        </tr>
                        <tr>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                            <th>Tgl. Bayar</th>
                            <th>Jumlah</th>
                        </tr>
                    </thead>
                    <body>
                        <?php
                        $tagihan_mahasiswa = model('TagihanMahasiswa')->where('id', $get_tagihan_mahasiswa)->findAll();
                        $total_biaya = 0;
                        $no_urut = 1;
                        $total_jumlah_bayar = 0;
                        foreach ($tagihan_mahasiswa as $key => $v) :
                            $mahasiswa = model('Users')
                            ->where('id_role', 5)
                            ->findAll();
                            
                            foreach ($mahasiswa as $key2 => $v2) :
                                if ($v['id_tahun_akademik'] < $v2['id_tahun_akademik_diterima']) continue;

                                $status_mahasiswa = model('StatusMahasiswa')->where('id_mahasiswa', $v2['id'])->findAll();
                                foreach ($status_mahasiswa as $v3) {
                                    if (in_array($v3['status'], ['Cuti', 'DO'])) {
                                        if ($v['id_tahun_akademik'] >= $v3['id_tahun_akademik']) {
                                            continue 2;
                                        }
                                    }

                                    if ($v3['status'] == 'Aktif') {
                                        if (
                                            ($v['id_tahun_akademik'] >= $v3['id_tahun_akademik']) &&
                                            ($v['id_tahun_akademik'] <= $v3['id_tahun_akademik_selesai_cuti'])
                                        ) {
                                            continue 2;
                                        }
                                    }
                                }

                                if ($get_program_studi) {
                                    if ($v2['id_program_studi'] != $get_program_studi) continue;
                                }

                                if ($v['kategori'] == 'PERORANGAN') {
                                    if (! in_array($v2['id'], json_decode($v['json_id_mahasiswa']))) {
                                        continue;
                                    }
                                }

                                $biaya = biayaKuliahMahasiswa($v2['id'], $v['jenis']);
                                $total_biaya += $biaya;

                                $pembayaran_mahasiswa = model('PembayaranMahasiswa')
                                ->where([
                                    'id_tagihan_mahasiswa' => $v['id'],
                                    'id_mahasiswa' => $v2['id'],
                                ])->findAll();
                                $pembayaran_mahasiswa_tahap_1 = $pembayaran_mahasiswa[0] ?? '';
                                $pembayaran_mahasiswa_tahap_2 = $pembayaran_mahasiswa[1] ?? '';
                                $pembayaran_mahasiswa_tahap_3 = $pembayaran_mahasiswa[2] ?? '';
                                $pembayaran_mahasiswa_tahap_4 = $pembayaran_mahasiswa[3] ?? '';
                                $pembayaran_mahasiswa_tahap_5 = $pembayaran_mahasiswa[4] ?? '';
                                $pembayaran_mahasiswa_tahap_6 = $pembayaran_mahasiswa[5] ?? '';

                                $jumlah_jumlah_bayar =
                                    ($pembayaran_mahasiswa_tahap_1['jumlah_bayar'] ?? 0)
                                    + ($pembayaran_mahasiswa_tahap_2['jumlah_bayar'] ?? 0)
                                    + ($pembayaran_mahasiswa_tahap_3['jumlah_bayar'] ?? 0)
                                    + ($pembayaran_mahasiswa_tahap_4['jumlah_bayar'] ?? 0)
                                    + ($pembayaran_mahasiswa_tahap_5['jumlah_bayar'] ?? 0)
                                    + ($pembayaran_mahasiswa_tahap_6['jumlah_bayar'] ?? 0);

                                $total_jumlah_bayar += $jumlah_jumlah_bayar;

                                $status = ($jumlah_jumlah_bayar >= $biaya) ? 'Lunas' : 'Belum Lunas';
                                if ($get_status) {
                                    if ($status != $get_status) continue;
                                }
                        ?>
                        <tr>
                            <td><?= $no_urut ?></td>
                            <td>
                                <a href="<?= base_url(userSession('slug_role')) ?>/mahasiswa/edit/<?= $v2['id'] ?>" target="_blank"><?= $v2['nomor_identitas'] ?></a>
                            </td>
                            <td><?= $v2['nama'] ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_1 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_1['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_1 ? dotsNumber($pembayaran_mahasiswa_tahap_1['jumlah_bayar']) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_2 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_2['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_2 ? dotsNumber($pembayaran_mahasiswa_tahap_2['jumlah_bayar']) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_3 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_3['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_3 ? dotsNumber($pembayaran_mahasiswa_tahap_3['jumlah_bayar']) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_4 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_4['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_4 ? dotsNumber($pembayaran_mahasiswa_tahap_4['jumlah_bayar']) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_5 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_5['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_5 ? dotsNumber($pembayaran_mahasiswa_tahap_5['jumlah_bayar']) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_6 ? date('d/m/Y', strtotime(userLocalTime($pembayaran_mahasiswa_tahap_6['tanggal_bayar']))) : '-' ?></td>
                            <td><?= $pembayaran_mahasiswa_tahap_6 ? dotsNumber($pembayaran_mahasiswa_tahap_6['jumlah_bayar']) : '-' ?></td>
                            <td><?= dotsNumber($jumlah_jumlah_bayar) ?></td>
                            <td>
                                <?= dotsNumber($biaya) ?>
                                <?php if ($status == 'Belum Lunas') : ?>
                                <a href="#" data-bs-toggle="modal" data-bs-target="#modal_bayar_<?= $key2+1 ?>">Bayar</a>
                                <div class="modal fade" id="modal_bayar_<?= $key2+1 ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Bayar Tagihan</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form id="form_<?= $key2+1 ?>">
                                                <div class="modal-body">
                                                    <input type="hidden" name="id_tagihan_mahasiswa" value="<?= $v['id'] ?>">
                                                    <input type="hidden" name="id_mahasiswa" value="<?= $v2['id'] ?>">
                                                    <div class="mb-3">
                                                        <label class="form-label">NIM</label>
                                                        <input type="text" class="form-control" value="<?= $v2['nomor_identitas'] ?>" disabled>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Nama Mahasiswa</label>
                                                        <input type="text" class="form-control" value="<?= $v2['nama'] ?>" disabled>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Tahap</label>
                                                        <input type="text" class="form-control" value="1" disabled>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="tanggal_bayar" class="form-label">Tanggal Bayar</label>
                                                        <input type="date" class="form-control" id="tanggal_bayar" name="tanggal_bayar" value="<?= date('Y-m-d') ?>">
                                                        <div class="invalid-feedback" id="invalid_tanggal_bayar"></div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="jumlah_bayar" class="form-label">Jumlah Bayar</label>
                                                        <input type="text" inputmode="numeric" class="form-control" id="jumlah_bayar" name="jumlah_bayar" placeholder="Masukkan jumlah bayar" oninput="this.value = dotsNumber(this.value)">
                                                        <div class="invalid-feedback" id="invalid_jumlah_bayar"></div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Konfirmasi Bayar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                document.addEventListener('DOMContentLoaded', function() {
                                    dom('#form_<?= $key2+1 ?>').addEventListener('submit', function(event) {
                                        event.preventDefault();
                                        const endpoint = '<?= base_url() ?>api/pembayaran-mahasiswa/create';
                                        submitData(dom('#form_<?= $key2+1 ?>'), endpoint);
                                    });
                                });
                                </script>
                                <?php endif; ?>
                            </td>
                            <td>
                                <span class="badge <?= $status == 'Lunas' ? 'text-bg-success' : 'text-bg-warning' ?>"><?= $status ?></span>
                            </td>
                        </tr>
                        <?php $no_urut++; endforeach; ?>
                        <?php endforeach; ?>
                    </body>
                    <tfoot>
                        <tr>
                            <td colspan="15" class="fw-600 text-center"></td>
                            <td class="fw-600"><?= dotsNumber($total_jumlah_bayar) ?></td>
                            <td class="fw-600"><?= dotsNumber($total_biaya) ?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#tagihan_mahasiswa'), { search: true });
dselect(dom('#status'), { search: true, clearable: true });
dselect(dom('#program_studi'), { search: true, clearable: true });

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ordering: false,
        initComplete: function (settings, json) {
            $('#myTable').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
        },
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
