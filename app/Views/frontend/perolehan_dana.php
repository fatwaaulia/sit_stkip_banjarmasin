<style>
table tr th { text-align: center; }
</style>

<section class="container">
    <div class="row">
        <div class="col-12">
            <h4>Perolehan Dana</h4>
            <p class="mb-0">Diterbitkan oleh Keuangan</p>
        </div>
    </div>
</section>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
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
                            $sumber_dana = [
                                [
                                    'no'   => 1,
                                    'nama' => 'Mahasiswa',
                                ],
                                [
                                    'no'   => 2,
                                    'nama' => 'Kementerian/ Yayasan',
                                ],
                                [
                                    'no'   => 3,
                                    'nama' => 'PT Sendiri',
                                ],
                                [
                                    'no'   => 4,
                                    'nama' => 'Sumber Lain (Dalam dan Luar Negeri)',
                                ],
                                [
                                    'no'   => 5,
                                    'nama' => 'Dana Penelitian dan PKM',
                                ],
                            ];

                            $total_jumlah_ts_2 = 0;
                            $total_jumlah_ts_1 = 0;
                            $total_jumlah_ts_0 = 0;
                            $total_jumlah_ts_sumber_dana = 0;

                            foreach ($sumber_dana as $v) :
                                if (! in_array($v['no'], [1, 2, 3, 4])) continue;
                                $perolehan_dana = model('PerolehanDana')->where('no_sumber_dana', $v['no'])->findAll();
                                $total_data = count($perolehan_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $key => $v2) :
                                    $jumlah_ts_sebaris = $v2['ts_2'] + $v2['ts_1'] + $v2['ts_0'];
                                    $jumlah_ts_2 += $v2['ts_2'];
                                    $jumlah_ts_1 += $v2['ts_1'];
                                    $jumlah_ts_0 += $v2['ts_0'];
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <?php if ($key == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['no_sumber_dana'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_sumber_dana'] ?></td>
                                <?php endif; ?>
                                <td>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-wrap"><?= $v2['nama_jenis_dana'] ?></span>
                                    </div>
                                </td>
                                <td class="text-end"><?= dotsNumber($v2['ts_2']) ?></td>
                                <td class="text-end"><?= dotsNumber($v2['ts_1']) ?></td>
                                <td class="text-end"><?= dotsNumber($v2['ts_0']) ?></td>
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
                            foreach ($sumber_dana as $v) :
                                if ($v['no'] != 5) continue;
                                $perolehan_dana = model('PerolehanDana')->where('no_sumber_dana', $v['no'])->findAll();
                                $total_data = count($perolehan_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $key => $v2) :
                                    $jumlah_ts_sebaris = $v2['ts_2'] + $v2['ts_1'] + $v2['ts_0'];
                                    $jumlah_ts_2 += $v2['ts_2'];
                                    $jumlah_ts_1 += $v2['ts_1'];
                                    $jumlah_ts_0 += $v2['ts_0'];
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <?php if ($key == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['no_sumber_dana'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_sumber_dana'] ?></td>
                                <?php endif; ?>
                                <td>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-wrap"><?= $v2['nama_jenis_dana'] ?></span>
                                    </div>
                                </td>
                                <td class="text-end"><?= dotsNumber($v2['ts_2']) ?></td>
                                <td class="text-end"><?= dotsNumber($v2['ts_1']) ?></td>
                                <td class="text-end"><?= dotsNumber($v2['ts_0']) ?></td>
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
</div>
