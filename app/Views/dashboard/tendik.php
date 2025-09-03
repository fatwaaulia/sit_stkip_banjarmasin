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
                    <h5 class="mb-0"><?= dateFormatter(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card mt-4">
                <div class="card-body">
                    <h4>Informasi Tendik</h4>
                    <hr>
                    <table>
                        <tr>
                            <td>Jabatan Lainnya</td>
                            <td>:
                                <?php
                                $multi_role = json_decode(userSession('multi_role'), true);
                                
                                if (!empty($multi_role)) {
                                    $multi_role = array_column($multi_role, 'nama_role');
                                    echo implode(', ', $multi_role);
                                } else {
                                    echo '-';
                                }
                                ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Nomor Identitas</td>
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
                            <td>: <?= dateFormatter(userSession('tanggal_lahir'), 'd MMMM yyyy') ?></td>
                        </tr>
                        <tr>
                            <td>Alamat</td>
                            <td>: <?= userSession('alamat') ?></td>
                        </tr>
                        <tr>
                            <td>Jabatan Fungsional</td>
                            <td>: <?= userSession('jabatan_fungsional') ?></td>
                        </tr>
                        <tr>
                            <td>Jabatan Struktural</td>
                            <td>: <?= userSession('jabatan_struktural') ?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>