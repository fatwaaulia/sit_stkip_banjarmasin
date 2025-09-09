<?php
$tahun_akademik_aktif = model('TahunAkademik')->orderBy('id DESC')->first();

if ($tahun_akademik_aktif) {
    $tahun_akademik_aktif = $tahun_akademik_aktif['tahun_akademik'] . ' - ' . $tahun_akademik_aktif['tipe'];
} else {
    $tahun_akademik_aktif = '-';
}
?>

<style>
table tr { font-weight: 600; }

table tr td { padding: 6px; }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card mt-4 bg-primary-subtle">
                <div class="card-body d-flex justify-content-between">
                    <h5 class="mb-0"><?= $tahun_akademik_aktif ?></h5>
                    <h5 class="mb-0"><?= toIndonesianDate(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card mt-4">
                <div class="card-body">
                    <h4>Informasi Mahasiswa</h4>
                    <hr>
                    <table>
                        <tr>
                            <td>NIM</td>
                            <td>: <?= userSession('nomor_identitas') ?></td>
                        </tr>
                        <tr>
                            <td>Nama</td>
                            <td>: <?= userSession('nama') ?></td>
                        </tr>
                        <tr>
                            <td>Jenis Kelamin</td>
                            <td>: <?= userSession('jenis_kelamin') ?></td>
                        </tr>
                        <tr>
                            <td>Tempat Lahir</td>
                            <td>: <?= userSession('tempat_lahir') ?></td>
                        </tr>
                        <tr>
                            <td>Tanggal Lahir</td>
                            <td>: <?= toIndonesianDate(userSession('tanggal_lahir'), 'd MMMM yyyy') ?></td>
                        </tr>
                        <tr>
                            <td>Alamat</td>
                            <td>: <?= userSession('alamat') ?></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>: <?= userSession('email') ?></td>
                        </tr>
                        <tr>
                            <td>No. HP</td>
                            <td>: <?= userSession('no_hp') ?></td>
                        </tr>
                        <tr>
                            <td>Program Studi</td>
                            <td>: <?= userSession('jenjang_program_studi') ?> - <?= userSession('nama_program_studi') ?></td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td>:
                                <?php
                                $bg_status = '';
                                if (userSession('status') == 'Lulus') {
                                    $bg_status = 'text-success';
                                } elseif (userSession('status') == 'Cuti') {
                                    $bg_status = 'text-warning';
                                } elseif (userSession('status') == 'DO') {
                                    $bg_status = 'text-danger';
                                }
                                ?>
                                <span class="<?= $bg_status ?>">
                                    <?= userSession('status') ?>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>