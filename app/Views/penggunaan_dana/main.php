<style>
table tr th { text-align: center; }
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
                <div class="row mb-3">
                    <div class="col-12 col-md-6">
                        <table>
                            <tr class="fw-500">
                                <td>TS 2</td>
                                <td>:
                                    <?= date('d-m-Y', strtotime(appSettings('ts_2_tanggal_awal'))) ?> s/d
                                    <?= date('d-m-Y', strtotime(appSettings('ts_2_tanggal_akhir'))) ?>
                                </td>
                            </tr>
                            <tr class="fw-500">
                                <td>TS 1</td>
                                <td>:
                                    <?= date('d-m-Y', strtotime(appSettings('ts_1_tanggal_awal'))) ?> s/d
                                    <?= date('d-m-Y', strtotime(appSettings('ts_1_tanggal_akhir'))) ?>
                                </td>
                            </tr>
                            <tr class="fw-500">
                                <td>TS</td>
                                <td>:
                                    <?= date('d-m-Y', strtotime(appSettings('ts_tanggal_awal'))) ?> s/d
                                    <?= date('d-m-Y', strtotime(appSettings('ts_tanggal_akhir'))) ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6 text-end">
                        <a href="<?= base_url() ?>api/penggunaan-dana/export-excel" class="btn btn-outline-success">
                            <i class="fa-solid fa-arrow-up fa-sm"></i> Export Excel
                        </a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered text-nowrap">
                        <thead class="bg-primary-subtle">
                            <tr>
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Jenis Penggunaan</th>
                                <th colspan="3">Dana (Rp)</th>
                                <th rowspan="2">Jumlah (Rp)</th>
                            </tr>
                            <tr>
                                <th>TS-2</th>
                                <th>TS-1</th>
                                <th>TS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $total_jumlah_ts_2 = 0;
                            $total_jumlah_ts_1 = 0;
                            $total_jumlah_ts_0 = 0;
                            $total_jumlah_ts_sumber_dana = 0;

                                $master_dana = model('MasterDana')->where('jenis', 'Keluar')->findAll();
                                $total_data = count($master_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($master_dana as $key => $v2) :
                                    $ts_2 = (int)model('Keuangan')
                                    ->selectSum('nominal')
                                    ->where([
                                        'id_sumber_dana' => $v2['id'],
                                        'created_at >=' => appSettings('ts_2_tanggal_awal'),
                                        'created_at <=' => appSettings('ts_2_tanggal_akhir'),
                                    ])
                                    ->first()['nominal'];

                                    $ts_1 = (int)model('Keuangan')
                                    ->selectSum('nominal')
                                    ->where([
                                        'id_sumber_dana' => $v2['id'],
                                        'created_at >=' => appSettings('ts_1_tanggal_awal'),
                                        'created_at <=' => appSettings('ts_1_tanggal_akhir'),
                                    ])
                                    ->first()['nominal'];

                                    $ts_0 = (int)model('Keuangan')
                                    ->selectSum('nominal')
                                    ->where([
                                        'id_sumber_dana' => $v2['id'],
                                        'created_at >=' => appSettings('ts_tanggal_awal'),
                                        'created_at <=' => appSettings('ts_tanggal_akhir'),
                                    ])
                                    ->first()['nominal'];

                                    $jumlah_ts_sebaris = $ts_2 + $ts_1 + $ts_0;
                                    $jumlah_ts_2 += $ts_2;
                                    $jumlah_ts_1 += $ts_1;
                                    $jumlah_ts_0 += $ts_0;
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <td class="text-center align-middle"><?= $key+1 ?></td>
                                <td>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-wrap"><?= $v2['nama'] ?></span>
                                    </div>
                                </td>
                                <td class="text-end"><?= dotsNumber($ts_2) ?></td>
                                <td class="text-end"><?= dotsNumber($ts_1) ?></td>
                                <td class="text-end"><?= dotsNumber($ts_0) ?></td>
                                <td class="text-end"><?= dotsNumber($jumlah_ts_sebaris) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <?php
                            $total_jumlah_ts_2 += $jumlah_ts_2;
                            $total_jumlah_ts_1 += $jumlah_ts_1;
                            $total_jumlah_ts_0 += $jumlah_ts_0;
                            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;
                            ?>
                            <tr>
                                <td></td>
                                <td class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_2) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_1) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_0) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_sumber_dana) ?></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="fw-600 text-center">Total</td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_2) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_1) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_0) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_sumber_dana) ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
