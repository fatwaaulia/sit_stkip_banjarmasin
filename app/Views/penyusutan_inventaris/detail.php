<?php
$get_periode = $_GET['periode'] ?? 'Tahunan';
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/datatables/css/dataTables.dataTables.min.css">

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
                    <div class="col-12">
                        <table>
                            <tr>
                                <td class="fw-500">Nama Barang</td>
                                <td>: <?= $data['nama_barang'] ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Tanggal Beli</td>
                                <td>: <?= date('d-m-Y', strtotime($data['tanggal_beli'])) ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Harga Beli</td>
                                <td>: <?= formatRupiah($data['harga_beli']) ?></td>
                            </tr>
                            <tr>
                                <td class="fw-500">Umur Ekonomis</td>
                                <td>: <?= $data['umur_ekonomis'] ?> Tahun</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>Tahun</th>
                            <th>Penyusutan Tahunan</th>
                            <th>Akumulasi Penyusutan</th>
                            <th>Nilai Buku</th>
                        </tr>
                    </thead>
                </table>
                <div class="mt-3 text-end">
                    <a href="<?= $base_route ?>" class="btn btn-secondary me-2">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ajax: '<?= $get_data ?>',
        processing: true,
        serverSide: true,
        order: [],
        searching: false,
        paging: false,
        initComplete: function (settings, json) {
            $('#myTable').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
        },
        columns: [
            {
                name: '',
                data: 'tahun',
            }, {
                name: '',
                data: 'penyusutan_tahunan',
            }, {
                name: '',
                data: 'akumulasi_penyusutan',
            }, {
                name: '',
                data: 'nilai_buku',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
