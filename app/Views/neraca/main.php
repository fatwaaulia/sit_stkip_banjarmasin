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
                            $kategori_dana_masuk = model('KategoriDanaMasuk')->findAll();

                            $jumlah_debit = 0;
                            foreach ($kategori_dana_masuk as $key => $v) :
                                $perolehan_dana = model('Keuangan')->where('id_kategori_dana_masuk', $v['id'])->findAll();
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $v2) {
                                    $jumlah_ts_sebaris = $v2['nominal'];
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
                            $penggunaan_dana = model('MasterDana')->where('jenis', 'Keluar')->findAll();
                            $jumlah_kredit = 0;
                            foreach ($penggunaan_dana as $key => $v) :
                                $kredit = (int)model('Keuangan')
                                ->selectSum('nominal')
                                ->where([
                                    'id_sumber_dana' => $v['id'],
                                ])
                                ->first()['nominal'];
                                $jumlah_kredit += $kredit;
                            ?>
                            <tr>
                                <td class="text-center"><?= $key + count($kategori_dana_masuk) + 1 ?></td>
                                <td><?= $v['nama'] ?></td>
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
