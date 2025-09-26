<?php
$get_tanggal_awal = $_GET['tanggal_awal'] ?? '';
$get_tanggal_akhir = $_GET['tanggal_akhir'] ?? '';
$get_jenis = $_GET['jenis'] ?? '';
$get_id_sumber_dana = $_GET['id_sumber_dana'] ?? '';
$get_search = $_GET['search'] ?? '';

$kas_masuk = model('Keuangan')->selectSum('nominal');
$kas_masuk->where('jenis', 'Masuk');
$kas_masuk->where('jenis_saldo', 'Kas');
if ($get_tanggal_awal) $kas_masuk->where('DATE(tanggal) >=', $get_tanggal_awal);
if ($get_tanggal_akhir) $kas_masuk->where('DATE(tanggal) <=', $get_tanggal_akhir);
$kas_masuk = $kas_masuk->first()['nominal'];

$kas_keluar = model('Keuangan')->selectSum('nominal');
$kas_keluar->where('jenis', 'Keluar');
$kas_keluar->where('jenis_saldo', 'Kas');
if ($get_tanggal_awal) $kas_keluar->where('DATE(tanggal) >=', $get_tanggal_awal);
if ($get_tanggal_akhir) $kas_keluar->where('DATE(tanggal) <=', $get_tanggal_akhir);
$kas_keluar = $kas_keluar->first()['nominal'];

$saldo_kas = $kas_masuk - $kas_keluar;

$bank_masuk = model('Keuangan')->selectSum('nominal');
$bank_masuk->where('jenis', 'Masuk');
$bank_masuk->where('jenis_saldo', 'Bank');
if ($get_tanggal_awal) $bank_masuk->where('DATE(tanggal) >=', $get_tanggal_awal);
if ($get_tanggal_akhir) $bank_masuk->where('DATE(tanggal) <=', $get_tanggal_akhir);
$bank_masuk = $bank_masuk->first()['nominal'];

$bank_keluar = model('Keuangan')->selectSum('nominal');
$bank_keluar->where('jenis', 'Keluar');
$bank_keluar->where('jenis_saldo', 'Bank');
if ($get_tanggal_awal) $bank_keluar->where('DATE(tanggal) >=', $get_tanggal_awal);
if ($get_tanggal_akhir) $bank_keluar->where('DATE(tanggal) <=', $get_tanggal_akhir);
$bank_keluar = $bank_keluar->first()['nominal'];

$saldo_bank = $bank_masuk - $bank_keluar;
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/datatables/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/dselect/dselect.min.css">
<script src="<?= base_url() ?>assets/modules/dselect/dselect.min.js"></script>

<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4"><?= isset($title) ? $title : '' ?></h4>
        </div>
    </div>
    <div class="row g-3 mb-4">
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(75, 192, 192, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-wallet me-1"></i>
                        Saldo Kas
                    </p>
                    <h4 class="mb-0" id="saldo_kas"><?= formatRupiah($saldo_kas) ?></h4>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4 col-xxl-3 d-flex">
            <div class="card flex-fill mb-0">
                <div class="card-body text-center" style="border-bottom:4px solid rgba(75, 192, 192, 1); border-radius:var(--border-radius)">
                    <p class="fw-500 d-block mb-2">
                        <i class="fa-solid fa-wallet me-1"></i>
                        Saldo Bank
                    </p>
                    <h4 class="mb-0" id="saldo_bank"><?= formatRupiah($saldo_bank) ?></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <div class="row mb-3">
                    <div class="col-12">
                        <a href="<?= $base_route ?>new/uang-masuk" class="btn btn-success me-2">
                            <i class="fa-solid fa-arrow-down fa-sm"></i> Uang Masuk
                        </a>
                        <a href="<?= $base_route ?>new/uang-keluar" class="btn btn-danger">
                            <i class="fa-solid fa-arrow-up fa-sm"></i> Uang Keluar
                        </a>
                    </div>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-12">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="tanggal_awal" class="form-label">Tanggal Awal</label>
                                    <input type="date" class="form-control" id="tanggal_awal" name="tanggal_awal" value="<?= $get_tanggal_awal ?>">
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="tanggal_akhir" class="form-label">Tanggal Akhir</label>
                                    <input type="date" class="form-control" id="tanggal_akhir" name="tanggal_akhir" value="<?= $get_tanggal_akhir ?>">
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="jenis" class="form-label">Jenis</label>
                                    <select class="form-select" id="jenis" name="jenis">
                                        <option value="">Semua Jenis</option>
                                        <?php
                                        $jenis = ['Masuk', 'Keluar'];
                                        foreach ($jenis as $v) :
                                            $selected = ($get_jenis == $v) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xxl-3">
                                    <label for="id_sumber_dana" class="form-label">Dana</label>
                                    <select class="form-select" id="id_sumber_dana" name="id_sumber_dana">
                                        <option value="">Semua Dana</option>
                                        <?php
                                        $sumber_dana = model('MasterDana')->find();
                                        foreach ($sumber_dana as $v) :
                                            $selected = ($get_id_sumber_dana == $v['id']) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['jenis'] ?> - <?= $v['nama'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
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
                            <th>Nominal</th>
                            <th>Dana</th>
                            <th>Catatan</th>
                            <th>Nomor Bukti</th>
                            <th>Jenis Saldo</th>
                            <th>Tanggal</th>
                            <th>Created By</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td class="fw-600">Total</td>
                            <td id="total_nominal"></td>
                            <td colspan="4"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#id_sumber_dana'), { search: true, clearable: true });

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ajax: {
            url: '<?= $get_data ?>',
            data: query => {
                let url = `<?= $get_data . (!empty($_GET) ? '&' : '?') ?>${ $.param(query) }`;
                url = url.replace(/start=\d+&length=\d+/, 'start=0&length=0');
                updateTfoot(url);

                dom('#btn_export_excel').dataset.url = url.replace('/?', '/export-excel?');
                dom('#btn_export_excel').dataset.filename = 'keluar_masuk_uang';
            }
        },
        processing: true,
        serverSide: true,
        order: [],
        initComplete: function (settings, json) {
            $('#myTable').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
        },
        columns: [
            {
                name: '',
                data: 'no_urut',
            }, {
                name: '',
                data: null,
                render: data => `<span class="${data.jenis == 'Masuk' ? 'text-success' : 'text-danger'}">${data.nominal}</span>`,
            }, {
                name: '',
                data: null,
                render: data => `${data.nama_kategori_dana} - ${data.nama_sumber_dana}`,
            }, {
                name: 'catatan',
                data: 'catatan',
            }, {
                name: 'nomor_bukti',
                data: 'nomor_bukti',
            }, {
                name: 'jenis_saldo',
                data: 'jenis_saldo',
            }, {
                name: 'tanggal',
                data: 'tanggal',
            }, {
                name: '',
                data: 'created_by',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderOpsi(data) {
    let edit_data;
    if (data.jenis == 'Masuk') {
        edit_data = 'uang-masuk';
    } else {
        edit_data = 'uang-keluar';
    }
    let endpoint_edit_data = `<?= $base_route ?>edit/${edit_data}/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    return `
    <a href="${endpoint_edit_data}" class="me-2" title="Edit">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;
}

async function updateTfoot(url) {
    dom('#total_nominal').innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;
    dom('#saldo_kas').innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;
    dom('#saldo_bank').innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        setTimeout(() => {
            dom('#saldo_kas').innerHTML = data.saldo_kas;
            dom('#saldo_bank').innerHTML = data.saldo_bank;
            dom('#total_nominal').innerHTML = data.total_nominal;
        }, 350);
    } catch (error) {
        console.error('Error:', error);
    }
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
