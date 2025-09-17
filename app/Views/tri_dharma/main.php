<?php
// $is_access = false;
// if (array_intersect(userSession('id_roles'), [1, 17, 4])) {
    $is_access = true;
// }
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
    <?php if (in_array(8, userSession('id_roles'))) : ?>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-primary">
                Sebagai Kaprodi, Anda dapat melihat semua publikasi dosen <span class="fw-500"><?= userSession('nama_program_studi') ?></span>
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
                            <th>Kategori</th>
                            <th>Judul</th>
                            <th>Tanggal Publikasi</th>
                            <th>Tautan Diterbitkan</th>
                            <th>Tautan Gdrive</th>
                            <th>Dokumen</th>
                            <th>Anggota 1</th>
                            <th>Anggota 2</th>
                            <th>Anggota 3</th>
                            <th>Anggota 4</th>
                            <th>Anggota 5</th>
                            <th>Anggota Beda Kampus</th>
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
                name: 'kategori',
                data: 'kategori',
            }, {
                name: 'judul',
                data: null,
                render: data => `<div style="width: 300px; white-space: normal;">${data.judul}</div>`,
            }, {
                name: '',
                data: 'tanggal_publikasi',
            }, {
                name: '',
                data: null,
                render: data => data.tautan ? `<a href="${data.tautan}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.tautan_gdrive ? `<a href="${data.tautan_gdrive}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen ? `<a href="${data.dokumen}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => `${data.nomor_identitas_anggota_1} - ${data.nama_anggota_1} <br> ${data.nama_program_studi_anggota_1}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.nomor_identitas_anggota_2} - ${data.nama_anggota_2} <br> ${data.nama_program_studi_anggota_2}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.nomor_identitas_anggota_3} - ${data.nama_anggota_3} <br> ${data.nama_program_studi_anggota_3}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.nomor_identitas_anggota_4} - ${data.nama_anggota_4} <br> ${data.nama_program_studi_anggota_4}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.nomor_identitas_anggota_5} - ${data.nama_anggota_5} <br> ${data.nama_program_studi_anggota_5}`,
            }, {
                name: '',
                data: 'anggota_beda_kampus',
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
    
    if (data.id_anggota_1 == '<?= userSession('id') ?>') {
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
