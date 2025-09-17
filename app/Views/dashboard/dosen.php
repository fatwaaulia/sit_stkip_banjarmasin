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
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between">
                            <h5 class="mb-0"><?= $tahun_akademik_aktif ?></h5>
                            <h5 class="mb-0"><?= toIndonesianDate(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <?php
                            $motto_kerja = model('Users')->select('nama, motto_kerja')
                            ->whereIn('id_role', [4, 16])
                            ->where('motto_kerja !=', '')
                            ->orderBy('RAND()')
                            ->findAll();
                            ?>
                            <marquee behavior="scroll" direction="left" scrollamount="5">
                                <?php foreach ($motto_kerja as $v) : ?>
                                <span>"<?= str_replace('"', '', trim($v['motto_kerja'])) ?>" - <?= $v['nama'] ?></span>
                                <span class="px-3">|</span>
                                <?php endforeach; ?>
                            </marquee>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card mt-4">
                <div class="card-body">
                    <h4>Informasi Dosen</h4>
                    <hr>
                    <table>
                        <tr>
                            <td>Jabatan Aktif</td>
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
                            <td>NIDN / NIDK</td>
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
                            <td>Jabatan Fungsional</td>
                            <td>: <?= userSession('jabatan_fungsional') ?></td>
                        </tr>
                        <tr>
                            <td>Jabatan Struktural</td>
                            <td>: <?= userSession('jabatan_struktural') ?></td>
                        </tr>
                        <tr>
                            <td>Program Studi</td>
                            <td>: <?= userSession('jenjang_program_studi') ?> - <?= userSession('nama_program_studi') ?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>