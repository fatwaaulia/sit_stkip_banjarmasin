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
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered text-nowrap">
                        <thead class="bg-primary-subtle">
                            <tr>
                                <th>No.</th>
                                <th>Nama Akun</th>
                                <th>Debit</th>
                                <th>Kredit</th>
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

                            $jumlah_debit = 0;
                            foreach ($sumber_dana as $key => $v) :
                                $perolehan_dana = model('PerolehanDana')->where('no_sumber_dana', $v['no'])->findAll();
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $v2) {
                                    $jumlah_ts_sebaris = $v2['ts_2'] + $v2['ts_1'] + $v2['ts_0'];
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                                }
                                $debit = $jumlah_ts_sumber_dana;
                                $jumlah_debit += $debit;
                            ?>
                            <tr>
                                <td class="text-center"><?= $key+1 ?></td>
                                <td><?= $v['nama'] ?></td>
                                <td class="text-end"><?= dotsNumber($debit) ?></td>
                                <td class="text-center"></td>
                            </tr>
                            <?php endforeach; ?>

                            <?php
                            $penggunaan_dana = model('PenggunaanDana')->findAll();
                            $jumlah_kredit = 0;
                            foreach ($penggunaan_dana as $key => $v) :
                                $kredit = $v['ts_2'] + $v['ts_1'] + $v['ts_0'];
                                $jumlah_kredit += $kredit;
                            ?>
                            <tr>
                                <td class="text-center"><?= $key + count($sumber_dana) + 1 ?></td>
                                <td><?= $v['nama_jenis_dana'] ?></td>
                                <td class="text-center"></td>
                                <td class="text-end"><?= dotsNumber($kredit) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_debit) ?></td>
                                <td class="fw-600 text-end"><?= dotsNumber($jumlah_kredit) ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
