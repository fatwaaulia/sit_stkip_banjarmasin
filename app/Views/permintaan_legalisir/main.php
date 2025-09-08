<?php
$is_access = true;
// if (array_intersect(userSession('id_roles'), [1, 17, 15])) {
//     $is_access = true;
// }
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
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Nama</th>
                            <th>Email</th>
                            <th>No. HP</th>
                            <th>Tautan</th>
                            <th>Tanggal Permintaan</th>
                            <th>Status</th>
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
                name: 'nama',
                data: 'nama',
            }, {
                name: 'email',
                data: 'email',
            }, {
                name: 'no_hp',
                data: 'no_hp',
            }, {
                name: '',
                data: null,
                render: data => `<a href="${data.tautan}" target="_blank">Buka</a>`,
            }, {
                name: '',
                data: 'created_at',
            }, {
                name: 'status',
                data: 'status',
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
    const status = ['Diproses', 'Selesai'];
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    let html = `
    <a class="me-2 ${data.status == 'Selesai' ? 'd-none' : ''}" title="Edit" data-bs-toggle="modal" data-bs-target="#edit${data.id}">
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
                            <label class="form-label">Nama</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="${data.nama}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="status_${data.id}" class="form-label">Status</label>
                            <select class="form-select" id="status_${data.id}" name="status">
                                <option value="">Pilih</option>
                                ${status.map(item => `<option value="${item}" ${item == data.status ? 'selected' : ''}>${item}</option>`).join('')}
                            </select>
                            <div class="invalid-feedback" id="invalid_status"></div>
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
