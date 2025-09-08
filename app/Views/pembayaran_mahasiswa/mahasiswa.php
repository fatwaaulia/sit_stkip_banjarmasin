<?php
$get_nim = userSession('nomor_identitas');

$mahasiswa = model('Users')
->where([
    'id_role' => 5,
    'status'  => 'Aktif',
    'nomor_identitas !=' => '',
])
->groupStart()
    ->where('nomor_identitas', $get_nim)
->groupEnd()
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
                    <div class="col-12 col-xl-8 col-xxl-6">
                        <?php if ($mahasiswa) : ?>
                        <table class="table">
                            <tr>
                                <td class="fw-500">Nama Mahasiswa</td>
                                <td>:
                                    <?= $mahasiswa['nama'] ?> (<?= $mahasiswa['nomor_identitas'] ?>)
                                </td>
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
                                <td class="fw-500">Semester</td>
                                <td>: <?= $mahasiswa['semester'] ?></td>
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
                            <th>Tagihan</th>
                            <th>Jumlah Bayar</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $total_biaya = 0;
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
                            }

                            $biaya = biayaKuliahMahasiswa($mahasiswa['id'], $v['jenis']);

                            $pembayaran_mahasiswa = model('PembayaranMahasiswa')
                            ->where([
                                'id_tagihan_mahasiswa' => $v['id'],
                                'id_mahasiswa'         => $mahasiswa['id'],
                            ])->first();

                            $biaya = biayaKuliahMahasiswa($mahasiswa['id'], $v['jenis']);
                            $total_biaya += $biaya;

                            $pembayaran_mahasiswa = model('PembayaranMahasiswa')
                            ->where([
                                'id_tagihan_mahasiswa' => $v['id'],
                                'id_mahasiswa' => $mahasiswa['id'],
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

                            $status = ($jumlah_jumlah_bayar >= $biaya) ? 'Lunas' : 'Belum Lunas';
                        ?>
                        <tr>
                            <td class="text-center"><?= $key+1 ?></td>
                            <td><?= $v['tahun_akademik'] ?> - <?= $v['tipe_tahun_akademik'] ?></td>
                            <td><?= $v['jenis'] ?></td>
                            <td><?= formatRupiah($biaya) ?></td>
                            <td><?= formatRupiah($jumlah_jumlah_bayar) ?></td>
                            <td>
                                <span class="badge <?= $status == 'Lunas' ? 'text-bg-success' : 'text-bg-warning' ?>"><?= $status ?></span>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
