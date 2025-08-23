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
                <div class="row g-3 mb-3">
                    <div class="col-12 col-lg-10 col-xl-11">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-6 col-md-5 col-lg-4 col-xl-3">
                                    <label for="periode" class="form-label">Periode</label>
                                    <select class="form-select" id="periode" name="periode">
                                        <?php
                                        $periode = ['Tahunan', 'Bulanan'];
                                        foreach ($periode as $v) :
                                            $selected = ($v == $get_periode) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v ?>" <?= $selected ?>><?= $v ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-2 col-lg-2 col-xl-2 d-flex justify-content-start align-items-end">
                                    <button type="submit" class="btn btn-primary me-2 w-100" title="Filter">
                                        <i class="fa-solid fa-filter"></i>
                                        <span class="ms-1 d-md-none">Filter</span>
                                    </button>
                                    <a href="<?= $base_route ?>" class="btn btn-outline-danger w-100" title="Reset">
                                        <i class="fa-solid fa-filter-circle-xmark"></i>
                                        <span class="ms-1 d-md-none">Reset</span>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12 col-lg-2 col-xl-1 d-flex justify-content-end align-items-end">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#new">
                            <i class="fa-solid fa-plus fa-sm"></i> New
                        </button>
                        <div class="modal fade" id="new" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Add <?= isset($title) ? $title : '' ?></h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <form id="form">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="nama_barang" class="form-label">Nama Barang</label>
                                                <input type="text" class="form-control" id="nama_barang" name="nama_barang" placeholder="Masukkan nama barang">
                                                <div class="invalid-feedback" id="invalid_nama_barang"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tanggal_beli" class="form-label">Tanggal Beli</label>
                                                <input type="date" class="form-control" id="tanggal_beli" name="tanggal_beli">
                                                <div class="invalid-feedback" id="invalid_tanggal_beli"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="harga_beli" class="form-label">Harga Beli</label>
                                                <input type="text" inputmode="numeric" class="form-control" id="harga_beli" name="harga_beli" placeholder="Masukkan harga beli" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_harga_beli"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="umur_ekonomis" class="form-label">Umur Ekonomis</label>
                                                <input type="number" class="form-control" id="umur_ekonomis" name="umur_ekonomis" placeholder="Masukkan umur ekonomis">
                                                <div class="invalid-feedback" id="invalid_umur_ekonomis"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nilai_residu" class="form-label">Nilai Residu</label>
                                                <input type="text" inputmode="numeric" class="form-control" id="nilai_residu" name="nilai_residu" placeholder="Masukkan nilai residu" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_nilai_residu"></div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Tambahkan</button>
                                        </div>
                                    </form>
                                    <script>
                                    dom('#form').addEventListener('submit', function(event) {
                                        event.preventDefault();
                                        const endpoint = '<?= $base_api ?>create';
                                        submitData(dom('#form'), endpoint);
                                    });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Nama Barang</th>
                            <th>Tanggal Beli</th>
                            <th>Harga Beli</th>
                            <th>Umur Ekonomis</th>
                            <th>Nilai Residu</th>
                            <th>Penyusutan Tahunan</th>
                            <th>Penyusutan Bulanan</th>
                            <th>Akumulasi Penyusutan</th>
                            <th>Nilai Buku</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                </table>
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
        initComplete: function (settings, json) {
            $('#myTable').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
        },
        columns: [
            {
                name: '',
                data: 'no_urut',
            }, {
                name: 'nama_barang',
                data: null,
                render: data => `<a href="<?= $base_route ?>detail/${data.id}">${data.nama_barang}</a>`,
            }, {
                name: '',
                data: 'tanggal_beli',
            }, {
                name: '',
                data: 'harga_beli',
            }, {
                name: '',
                data: 'umur_ekonomis',
            }, {
                name: '',
                data: 'nilai_residu',
            }, {
                name: '',
                data: 'penyusutan_tahunan',
            }, {
                name: '',
                data: 'penyusutan_bulanan',
            }, {
                name: '',
                data: 'akumulasi_penyusutan',
            }, {
                name: '',
                data: 'nilai_buku',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
                className: 'text-nowrap',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderOpsi(data) {
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    let html = `
    <a class="me-2" title="Edit" data-bs-toggle="modal" data-bs-target="#edit${data.id}">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <div class="modal fade" id="edit${data.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Edit <?= isset($title) ? $title : '' ?></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="form_${data.id}">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="nama_barang" class="form-label">Nama Barang</label>
                            <input type="text" class="form-control" id="nama_barang" name="nama_barang" value="${data.nama_barang}" placeholder="Masukkan nama barang">
                            <div class="invalid-feedback" id="invalid_nama_barang"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tanggal_beli" class="form-label">Tanggal Beli</label>
                            <input type="date" class="form-control" id="tanggal_beli" name="tanggal_beli" value="${(data.tanggal_beli).split('-').reverse().join('-')}">
                            <div class="invalid-feedback" id="invalid_tanggal_beli"></div>
                        </div>
                        <div class="mb-3">
                            <label for="harga_beli" class="form-label">Harga Beli</label>
                            <input type="text" inputmode="numeric" class="form-control" id="harga_beli" name="harga_beli" value="${dotsNumber(data.harga_beli)}" placeholder="Masukkan harga beli" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_harga_beli"></div>
                        </div>
                        <div class="mb-3">
                            <label for="umur_ekonomis" class="form-label">Umur Ekonomis</label>
                            <input type="number" class="form-control" id="umur_ekonomis" name="umur_ekonomis" value="${numberOnly(data.umur_ekonomis)}" placeholder="Masukkan umur ekonomis">
                            <div class="invalid-feedback" id="invalid_umur_ekonomis"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nilai_residu" class="form-label">Nilai Residu</label>
                            <input type="text" inputmode="numeric" class="form-control" id="nilai_residu" name="nilai_residu" value="${dotsNumber(data.nilai_residu)}" placeholder="Masukkan nilai residu" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_nilai_residu"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary float-end">Simpan Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;

    setTimeout(() => actionEdit(data.id), 0);

    return html;
}

function actionEdit(id) {
    const form = dom(`#form_${id}`);

    if (! form.dataset.isInitialized) {
        form.dataset.isInitialized = true;
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            const endpoint = `<?= $base_api ?>update/${id}`;
            submitData(form, endpoint);
        });
    }
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
