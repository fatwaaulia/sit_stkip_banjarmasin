<?php
$is_access = false;
if (userSession('id_role') == 4) {
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
    <?php if (in_array(8, userSession('id_roles'))) : ?>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-primary">
                Sebagai Kaprodi, Anda dapat melihat semua data dosen <span class="fw-500"><?= userSession('nama_program_studi') ?></span>
            </div>
        </div>
    </div>
    <?php endif; ?>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <?php if ($is_access) : ?>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6 col-lg-5 col-xl-4">
                        <!--  -->
                    </div>
                    <div class="col-12 col-md-6 col-lg-7 col-xl-8 d-flex justify-content-end align-items-end">
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
                            <th>Kode</th>
                            <th>Nama Mata Kuliah</th>
                            <th>SKS</th>
                            <th>Hari, Jam</th>
                            <th>Ruangan</th>
                            <th>Dosen Pengampu</th>
                            <th>Tautan</th>
                            <th>Dokumen</th>
                            <th>Program Studi</th>
                            <th>Tahun Akademik</th>
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
                name: 'kode',
                data: 'kode',
            }, {
                name: 'nama_mata_kuliah',
                data: 'nama_mata_kuliah',
            }, {
                name: '',
                data: 'sks',
            }, {
                name: '',
                data: null,
                render: data => `${data.hari}, ${data.jam_mulai} - ${data.jam_selesai}`,
            }, {
                name: 'ruangan',
                data: 'ruangan',
            }, {
                name: 'dosen_pengampu',
                data: 'dosen_pengampu',
            }, {
                name: '',
                data: null,
                render: data => data.tautan ? `<a href="${data.tautan}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen ? `<a href="${data.dokumen}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => `${data.jenjang_program_studi} - ${data.nama_program_studi}`,
            }, {
                name: 'tahun_akademik',
                data: 'tahun_akademik',
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
    let endpoint_edit_data = `<?= $base_route ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    
    if (data.created_by == '<?= userSession('id') ?>') {
        return `
        <a href="${endpoint_edit_data}" class="me-2" title="Edit">
            <i class="fa-regular fa-pen-to-square fa-lg"></i>
        </a>
        <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
            <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
        </a>`;
    } else {
        return '';
    }
}
<?php endif; ?>
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
