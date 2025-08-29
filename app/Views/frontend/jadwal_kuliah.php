<?php
$get_kategori = $_GET['kategori'] ?? '';

$kategori = [
    'MBKM',
    'Seminar Proposal', 'Sidang Skripsi'
];
?>

<script src="<?= base_url() ?>assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<?= base_url() ?>assets/modules/datatables/css/dataTables.dataTables.min.css">

<section class="container">
    <div class="row">
        <div class="col-12">
            <h4>Jadwal Kuliah</h4>
            <p class="mb-0">Diterbitkan oleh Akademik</p>
        </div>
    </div>
</section>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Judul</th>
                            <th>Tautan SK</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

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
                name: 'judul',
                data: 'judul',
            }, {
                name: '',
                data: null,
                render: data => `<a href="${data.tautan}" target="_blank">Buka</a>`,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>

