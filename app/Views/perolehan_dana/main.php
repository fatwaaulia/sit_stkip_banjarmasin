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
                        <a href="<?= base_url() ?>api/perolehan-dana/export-excel" class="btn btn-outline-success">
                            <i class="fa-solid fa-arrow-up fa-sm"></i> Export Excel
                        </a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered text-nowrap">
                        <thead class="bg-primary-subtle">
                            <tr>
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Sumber Dana</th>
                                <th rowspan="2">Jenis Dana</th>
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
                            $kategori_dana_masuk = model('KategoriDanaMasuk')->findAll();

                            $total_jumlah_ts_2 = 0;
                            $total_jumlah_ts_1 = 0;
                            $total_jumlah_ts_0 = 0;
                            $total_jumlah_ts_sumber_dana = 0;

                            foreach ($kategori_dana_masuk as $v) :
                                if (! in_array($v['id'], [1, 2, 3, 4])) continue;
                                $master_dana = model('MasterDana')->where('id_kategori_dana_masuk', $v['id'])->findAll();
                                $total_data = count($master_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($master_dana as $key2 => $v2) :
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
                                <?php if ($key2 == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['id_kategori_dana_masuk'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_kategori_dana_masuk'] ?></td>
                                <?php endif; ?>
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
                                <td colspan="2" class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_2) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_1) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_0) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_sumber_dana) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Total (1 + 2 + 3 + 4)</td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_2) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_1) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_0) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($total_jumlah_ts_sumber_dana) ?></td>
                            </tr>

                            <?php
                            foreach ($kategori_dana_masuk as $v) :
                                if ($v['id'] != 5) continue;
                                $master_dana = model('MasterDana')->where('id_kategori_dana_masuk', $v['id'])->findAll();
                                $total_data = count($master_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($master_dana as $key2 => $v2) :
                                    $jumlah_ts_sebaris = $ts_2 + $ts_1 + $ts_0;
                                    $jumlah_ts_2 += $ts_2;
                                    $jumlah_ts_1 += $ts_1;
                                    $jumlah_ts_0 += $ts_0;
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <?php if ($key2 == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['id_kategori_dana_masuk'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_kategori_dana_masuk'] ?></td>
                                <?php endif; ?>
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
                                <td colspan="2" class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_2) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_1) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_0) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_ts_sumber_dana) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Total</td>
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
