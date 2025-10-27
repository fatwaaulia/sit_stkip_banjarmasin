<?php
$get_created_by = $_GET['created_by'] ?? '';

$is_access = false;
if (userSession('id_role') == 1 || userSession('id_role_aktif') == 17) {
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
            <div class="alert alert-primary">
                Pertanyaan ditujukan kepada Dosen dan Tendik.
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <?php if ($is_access) : ?>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-5 col-lg-4 col-xl-3">
                        <!--  -->
                    </div>
                    <div class="col-12 col-md-7 col-lg-8 col-xl-9 d-flex justify-content-end align-items-end">
                        <a href="<?= $base_route ?>new" class="btn btn-primary">
                            <i class="fa-solid fa-plus fa-sm"></i> New
                        </a>
                    </div>
                </div>
                <?php endif; ?>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Judul</th>
                            <?php if ($is_access) : ?>
                            <th>Responden</th>
                            <?php endif; ?>
                            <th>Tanggal</th>
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
                data: null,
                render: renderJudul,
            }, <?php if ($is_access) : ?> {
                name: '',
                data: null,
                render: data => `<a href="<?= base_url(userSession('slug_role')) ?>/responden?pertanyaan=${data.slug}">Lihat (${data.jumlah_responden})</a>`,
            }, <?php endif; ?> {
                name: '',
                data: 'created_at',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderJudul(data) {
    let html;
    <?php if ($is_access) : ?>
    html = `<a href="https://wa.me/?text=${data.judul}%0A<?= base_url() ?>dosen/responden/new?pertanyaan=${data.slug}" target="_blank">${data.judul}</a>`;
    <?php else : ?>
    html = data.judul;
    <?php endif ?>

    return html;
}

<?php if ($is_access) : ?>
function renderOpsi(data) {
    let endpoint_edit_data = `<?= $base_route ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    return `
    <a href="${endpoint_edit_data}" class="me-2" title="Edit">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;
}
<?php else : ?>
function renderOpsi(data) {
    let html = `<a href="<?= base_url(userSession('slug_role')) ?>/responden/new?pertanyaan=${data.slug}">Jawab Sekarang</a>`;
    if (data.status_responden == 'SELESAI') {
        html = `<span class="badge bg-success">Selesai</span>`;
    }

    return html;
}
<?php endif; ?>
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
