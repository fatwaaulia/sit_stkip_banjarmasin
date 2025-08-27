<?php
$get_tagihan_mahasiswa = $_GET['tagihan_mahasiswa'] ?? '';
$get_status = $_GET['status'] ?? '';
$get_program_studi = $_GET['program_studi'] ?? '';
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/datatables/css/dataTables.dataTables.min.css">
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
                <div class="row g-3 mb-3">
                    <div class="col-12">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                                    <label for="tagihan_mahasiswa" class="form-label">Tagihan Mahasiswa</label>
                                    <select class="form-select" id="tagihan_mahasiswa" name="tagihan_mahasiswa">
                                        <option value="">Pilih</option>
                                        <?php
                                        $tagihan_mahasiswa = model('TagihanMahasiswa')->findAll();
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
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Program Studi</th>
                            <th>Biaya</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <body>
                        <?php
                        $tagihan_mahasiswa = model('TagihanMahasiswa')->where('id', $get_tagihan_mahasiswa)->findAll();
                        $total_biaya = 0;
                        $no_urut = 1;
                        foreach ($tagihan_mahasiswa as $v) :
                            $mahasiswa = model('Users')
                            ->where('id_role', 5)
                            ->findAll();

                            foreach ($mahasiswa as $key => $v2) :
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

                                $pembayaran_mahasiswa = model('PembayaranMahasiswa')
                                ->where([
                                    'id_tagihan_mahasiswa' => $v['id'],
                                    'id_mahasiswa'         => $v2['id'],
                                ])->first();

                                $status = $pembayaran_mahasiswa['status'] ?? 'Belum Lunas';
                                if ($get_status) {
                                    if ($status != $get_status) continue;
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
                        ?>
                        <tr>
                            <td><?= $no_urut ?></td>
                            <td><?= $v2['nomor_identitas'] ?></td>
                            <td><?= $v2['nama'] ?></td>
                            <td><?= $v2['jenjang_program_studi'] ?> - <?= $v2['nama_program_studi'] ?></td>
                            <td><?= dotsNumber($biaya) ?></td>
                            <td>
                                <span class="badge <?= $status == 'Lunas' ? 'text-bg-success' : 'text-bg-warning' ?>"><?= $status ?></span>
                            </td>
                        </tr>
                        <?php $no_urut++; endforeach; ?>
                        <?php endforeach; ?>
                    </body>
                    <tfoot>
                        <tr>
                            <td colspan="4" class="fw-600 text-center">Total Biaya</td>
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
        order: [],
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
