<?php
$get_periode_awal = $_GET['periode_awal'] ?? date('Y-01');
$get_periode_akhir = $_GET['periode_akhir'] ?? date('Y-m');
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
                <div class="row g-3 mb-3">
                    <div class="col-12">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="periode_awal" class="form-label">Periode Awal</label>
                                    <input type="month" class="form-control" id="periode_awal" name="periode_awal" value="<?= $get_periode_awal ?>">
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="periode_akhir" class="form-label">Periode Akhir</label>
                                    <input type="month" class="form-control" id="periode_akhir" name="periode_akhir" value="<?= $get_periode_akhir ?>">
                                </div>
                                <div class="col-12 col-md-2 col-lg-2 col-xxl-2 d-flex justify-content-start align-items-end">
                                    <button type="submit" class="btn btn-primary me-2 w-100" title="Filter">
                                        <i class="fa-solid fa-filter"></i>
                                        <span class="ms-1 d-md-none">Filter</span>
                                    </button>
                                    <a href="<?= $base_route ?>" class="btn btn-outline-danger w-100" title="Reset">
                                        <i class="fa-solid fa-filter-circle-xmark"></i>
                                        <span class="ms-1 d-md-none">Reset</span>
                                    </a>
                                </div>
                                <div class="col-12 col-md-12 col-lg-6 col-xxl-10 d-flex align-items-end">
                                    <button class="btn btn-outline-success" id="btn_export_excel" onclick="unduhFile(this)">
                                        <i class="fa-solid fa-arrow-up fa-sm"></i> Export Excel
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <table class="display nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Periode</th>
                            <th>Pemasukan</th>
                            <th>Pengeluaran</th>
                            <th>Kas</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2" class="fw-600">Total</td>
                            <td id="total_pemasukan"></td>
                            <td id="total_pengeluaran"></td>
                            <td id="total_kas"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ajax: {
            url: '<?= $get_data ?>',
            data: query => {
                let url = `<?= $get_data . (!empty($_GET) ? '&' : '?') ?>${ $.param(query) }`;
                url = url.replace(/start=\d+&length=\d+/, 'start=0&length=0');
                updateTfoot(url);

                dom('#btn_export_excel').dataset.url = url.replace('/?', '/export-excel?');
                dom('#btn_export_excel').dataset.filename = 'laporan_keuangan';
            }
        },
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
                data: 'no_urut',
            }, {
                name: '',
                data: 'periode',
            }, {
                name: '',
                data: 'pemasukan',
            }, {
                name: '',
                data: 'pengeluaran',
            }, {
                name: '',
                data: 'kas',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

async function updateTfoot(url) {
    dom('#total_pemasukan').innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;
    dom('#total_pengeluaran').innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        setTimeout(() => {
            dom('#total_pemasukan').innerHTML = data.total_pemasukan;
            dom('#total_pengeluaran').innerHTML = data.total_pengeluaran;
            dom('#total_kas').innerHTML = data.total_kas;
        }, 350);
    } catch (error) {
        console.error('Error:', error);
    }
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
