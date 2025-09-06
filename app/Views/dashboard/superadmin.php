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
                            <h5 class="mb-0"><?= dateFormatter(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
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

<?php
$kas_bulan_ini = model('Keuangan')
    ->selectSum('nominal')
    ->where("DATE_FORMAT(tanggal, '%Y-%m')", date('Y-m'))
    ->first()['nominal'];

$pemasukan_bulan_ini = model('Keuangan')
    ->selectSum('nominal')
    ->where("DATE_FORMAT(tanggal, '%Y-%m')", date('Y-m'))
    ->where('jenis', 'Masuk')
    ->first()['nominal'];

$pengeluaran_bulan_ini = model('Keuangan')
    ->selectSum('nominal')
    ->where("DATE_FORMAT(tanggal, '%Y-%m')", date('Y-m'))
    ->where('jenis', 'Keluar')
    ->first()['nominal'];

$total_kas = model('Keuangan')
    ->selectSum('nominal')
    ->first()['nominal'];
?>

<script src="<?= base_url() ?>assets/js/chart.js"></script>

<div class="container-fluid mt-4">
    <div class="row g-3">
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(75, 192, 192, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-arrow-down me-1"></i>
                        Pemasukan Bulan Ini
                    </p>
                    <h4 class="mb-0"><?= formatRupiah($pemasukan_bulan_ini) ?></h4>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(255, 99, 132, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-arrow-up me-1"></i>
                        Pengeluaran Bulan Ini
                    </p>
                    <h4 class="mb-0"><?= formatRupiah($pengeluaran_bulan_ini) ?></h4>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(54, 162, 235, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-wallet me-1"></i>
                        Sisa Uang Bulan Ini
                    </p>
                    <h4 class="mb-0"><?= formatRupiah($kas_bulan_ini) ?></h4>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(255, 205, 86, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-wallet me-1"></i>
                        Total Kas
                    </p>
                    <h4 class="mb-0"><?= formatRupiah($total_kas) ?></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-1 g-3">
        <div class="col-12 col-sm-6 col-lg-6 col-xxl-6">
            <div class="card">
                <div class="card-body">
                    <h5>Sumber Pemasukan Terbesar (Top 5)</h5>
                    <select class="form-select my-4" onchange="chartSumberPemasukanTerbesar(this.value)">
                        <?php
                        $periode = ['Hari Ini', '7 Hari Terakhir', '28 Hari Terakhir', '3 Bulan Terakhir', '6 Bulan Terakhir', '12 Bulan Terakhir'];
                        foreach ($periode as $v) :
                        ?>
                        <option value="<?= strtolower($v) ?>" <?= $v == '3 Bulan Terakhir' ? 'selected' : '' ?>><?= $v ?></option>
                        <?php endforeach; ?>
                    </select>
                    <div id="chart_sumber_pemasukan_terbesar" style="min-height: fit-content;"></div>
                    <script>
                    chartSumberPemasukanTerbesar('3 bulan terakhir');
                    function chartSumberPemasukanTerbesar(periode) {
                        const chart_sumber_pemasukan_terbesar = dom('#chart_sumber_pemasukan_terbesar');
                        chart_sumber_pemasukan_terbesar.style.height = chart_sumber_pemasukan_terbesar.getBoundingClientRect().height + 'px';
                        chart_sumber_pemasukan_terbesar.innerHTML = `<div class="text-center"> <div class="loading-ellipsis"> <div></div> <div></div> <div></div> <div></div> </div> </div>`;

                        fetch(`<?= base_url() ?>api/keuangan/sumber-pemasukan-terbesar/grafik?periode=${periode}`)
                        .then(response => response.json())
                        .then(data => {
                            chart_sumber_pemasukan_terbesar.innerHTML = '<canvas class="w-100"></canvas>';
                            new Chart(chart_sumber_pemasukan_terbesar.querySelector('canvas'), {
                                type: 'bar',
                                data: {
                                    labels: data.data.map(item => [item.nama_kategori_dana, item.nama_sumber_dana]),
                                    datasets: [{
                                            label: 'Pemasukan',
                                            data: data.data.map(item => item.total_nominal),
                                            backgroundColor: 'rgba(75, 192, 192, 1)',
                                        }],
                                },
                                options: {
                                     indexAxis: 'y',
                                    plugins: { legend: { display: false } }
                                }
                            });
                        });
                    }
                    </script>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-6 col-xxl-6">
            <div class="card">
                <div class="card-body">
                    <h5>Sumber Pengeluaran Terbesar (Top 5)</h5>
                    <select class="form-select my-4" onchange="chartSumberPengeluaranTerbesar(this.value)">
                        <?php
                        $periode = ['Hari Ini', '7 Hari Terakhir', '28 Hari Terakhir', '3 Bulan Terakhir', '6 Bulan Terakhir', '12 Bulan Terakhir'];
                        foreach ($periode as $v) :
                        ?>
                        <option value="<?= strtolower($v) ?>" <?= $v == '3 Bulan Terakhir' ? 'selected' : '' ?>><?= $v ?></option>
                        <?php endforeach; ?>
                    </select>
                    <div id="chart_sumber_pengeluaran_terbesar" style="min-height: fit-content;"></div>
                    <script>
                    chartSumberPengeluaranTerbesar('3 bulan terakhir');
                    function chartSumberPengeluaranTerbesar(periode) {
                        const chart_sumber_pengeluaran_terbesar = dom('#chart_sumber_pengeluaran_terbesar');
                        chart_sumber_pengeluaran_terbesar.style.height = chart_sumber_pengeluaran_terbesar.getBoundingClientRect().height + 'px';
                        chart_sumber_pengeluaran_terbesar.innerHTML = `<div class="text-center"> <div class="loading-ellipsis"> <div></div> <div></div> <div></div> <div></div> </div> </div>`;

                        fetch(`<?= base_url() ?>api/keuangan/sumber-pengeluaran-terbesar/grafik?periode=${periode}`)
                        .then(response => response.json())
                        .then(data => {
                            chart_sumber_pengeluaran_terbesar.innerHTML = '<canvas class="w-100"></canvas>';
                            new Chart(chart_sumber_pengeluaran_terbesar.querySelector('canvas'), {
                                type: 'bar',
                                data: {
                                    labels: data.data.map(item => [item.nama_kategori_dana, item.nama_sumber_dana]),
                                    datasets: [{
                                            label: 'Pengeluaran',
                                            data: data.data.map(item => item.total_nominal),
                                            backgroundColor: 'rgba(255, 99, 132, 1)',
                                        }],
                                },
                                options: {
                                     indexAxis: 'y',
                                    plugins: { legend: { display: false } }
                                }
                            });
                        });
                    }
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
