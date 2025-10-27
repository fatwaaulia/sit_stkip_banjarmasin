<?php
$get_program_studi = $_GET['program_studi'] ?? '';
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
                    <div class="col-12 col-lg-10 col-xl-10">
                        <!--  -->
                    </div>
                    <div class="col-12 col-lg-2 col-xl-2 d-flex justify-content-end align-items-end">
                        <a href="<?= base_url() ?>register-tendik" target="_blank">Register Tendik</a>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Foto</th>
                            <th>Nomor Identitas</th>
                            <th>Nama Tendik</th>
                            <th>Password Asli</th>
                            <th>Jabatan Fungsional</th>
                            <th>Jabatan Struktural</th>
                            <th>Multi Role</th>
                            <th>Status Akun</th>
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
                render: data => `<img data-src="${data.foto}" class="wh-40 cover-center rounded-circle lazy-shimmer">`,
            }, {
                name: 'nomor_identitas',
                data: 'nomor_identitas',
            }, {
                name: 'nama',
                data: 'nama',
            }, {
                name: '',
                data: 'password_asli',
            }, {
                name: '',
                data: 'jabatan_fungsional',
            }, {
                name: '',
                data: 'jabatan_struktural',
            }, {
                name: '',
                data: null,
                render: renderMultiRole,
            }, {
                name: '',
                data: 'status_akun',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderMultiRole(data) {
    let multi_role = data.multi_role;
    if (! multi_role) return '';

    multi_role = Object.values(JSON.parse(multi_role));
    const html = multi_role.map(item => `<span class="bg-secondary text-light fw-500 rounded py-1 px-2">${item.nama_role}</span>`).join(' ');

    return html;
}

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
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
