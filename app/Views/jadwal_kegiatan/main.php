<?php
$get_kategori = $_GET['kategori'] ?? '';

$kategori = [
    'MBKM',
    'Seminar Proposal', 'Sidang Skripsi'
];

$is_access = false;
if (userSession('id_role') == 3) {
    $is_access = true;
}
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
                <?php if ($is_access) : ?>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-lg-10 col-xl-11">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-6 col-md-5 col-lg-4 col-xl-3">
                                    <label for="kategori" class="form-label">Kategori</label>
                                    <select class="form-select" id="kategori" name="kategori">
                                        <option value="">Semua</option>
                                        <?php
                                        foreach ($kategori as $v) :
                                            $selected = ($v == $get_kategori) ? 'selected' : '';
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
                                                <label for="kategori" class="form-label">Kategori</label>
                                                <select class="form-select" id="kategori" name="kategori">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    foreach ($kategori as $v) :
                                                    ?>
                                                    <option value="<?= $v ?>"><?= $v ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_kategori"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="mb-3">
                                                    <label for="judul" class="form-label">Judul</label>
                                                    <input type="text" class="form-control" id="judul" name="judul" placeholder="Masukkan judul">
                                                    <div class="invalid-feedback" id="invalid_judul"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="tautan" class="form-label">Tautan SK</label>
                                                    <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan">
                                                    <div class="invalid-feedback" id="invalid_tautan"></div>
                                                </div>
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
                <?php endif; ?>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kategori</th>
                            <th>Judul</th>
                            <th>Tautan SK</th>
                            <?php if ($is_access) : ?>
                            <th>Opsi</th>
                            <?php endif; ?>
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
        drawCallback: function () {
            new LazyLoad({
                elements_selector: '.lazy-shimmer',
                callback_loaded: (el) => {
                    el.classList.remove('lazy-shimmer');
                }
            });
        },
        columns: [
            {
                name: '',
                data: 'no_urut',
            }, {
                name: '',
                data: 'kategori',
            }, {
                name: 'judul',
                data: 'judul',
            }, {
                name: '',
                data: null,
                render: data => `<a href="${data.tautan}" target="_blank">Buka</a>`,
            }, <?php if ($is_access) : ?> {
                name: '',
                data: null,
                render: renderOpsi,
            }, <?php endif; ?>
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

<?php if ($is_access) : ?>
function renderOpsi(data) {
    const kategori = [
        'MBKM',
        'Seminar Proposal', 'Sidang Skripsi'
    ];
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
                            <label for="kategori" class="form-label">Kategori</label>
                            <select class="form-select" id="kategori" name="kategori">
                                <option value="">Pilih</option>
                                ${kategori.map(item => `<option value="${item}" ${item == data.kategori ? 'selected' : ''}>${item}</option>`).join('')}
                            </select>
                            <div class="invalid-feedback" id="invalid_jenis"></div>
                        </div>
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="${data.judul}" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan SK</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" value="${data.tautan}" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
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
<?php endif; ?>
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
