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
                            <th>Jenis</th>
                            <th>Sumber Dana</th>
                            <th>Nominal Sebelum</th>
                            <th>Nominal Sesudah</th>
                            <th>Catatan Sebelum</th>
                            <th>Catatan Sesudah</th>
                            <th>Tanggal Sebelum</th>
                            <th>Tanggal Sesudah</th>
                            <th>Updated At</th>
                            <th>Updated By</th>
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
        searching: false,
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
                data: 'jenis_keuangan',
            }, {
                name: '',
                data: null,
                render: data => data.jenis_keuangan == 'Masuk' ? `${data.nama_kategori_dana_masuk} - ${data.nama_sumber_dana}` : data.nama_sumber_dana,
            }, {
                name: '',
                data: 'nominal_sebelum',
            }, {
                name: '',
                data: 'nominal_setelah',
            }, {
                name: '',
                data: 'catatan_sebelum',
            }, {
                name: '',
                data: 'catatan_setelah',
            }, {
                name: '',
                data: 'tanggal_sebelum',
            }, {
                name: '',
                data: 'tanggal_setelah',
            }, {
                name: '',
                data: 'created_at',
            }, {
                name: '',
                data: 'created_by',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
