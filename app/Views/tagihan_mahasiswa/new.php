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
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form id="form">
                        <div class="mb-3">
                            <label for="jenis" class="form-label">Jenis</label>
                            <select class="form-select" id="jenis" name="jenis">
                                <option value="">Pilih</option>
                                <?php
                                $jenis = [
                                    'LDKM', 'MBKM',
                                    'BIMBINGAN SKRIPSI', 'SEMINAR PROPOSAL', 'SIDANG SKRIPSI',
                                    'YUDISIUM', 'WISUDA'
                                ];
                                foreach ($jenis as $v) :
                                ?>
                                <option value="<?= $v ?>"><?= $v ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback" id="invalid_jenis"></div>
                        </div>

                        <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                            <thead class="bg-primary-subtle">
                                <tr>
                                    <th>No.</th>
                                    <th>#</th>
                                    <th>NIM</th>
                                    <th>Nama Mahasiswa</th>
                                    <th>Program Studi</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                        </table>

                        <div class="mt-3 float-end">
                            <a href="<?= $base_route ?>" class="btn btn-secondary me-2">Kembali</a>
                            <button type="submit" class="btn btn-primary">Tambahkan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#jenis'), { search: true });

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ajax: '<?= base_url() ?>api/mahasiswa',
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
                render: data => {
                    const session_checked_id = JSON.parse(sessionStorage.getItem('checked_id')) || [];
                    const is_checked = session_checked_id.includes(String(data.id)) ? 'checked' : '';
                    return `<input type="checkbox" class="form-check-input fa-lg" value="${data.id}" ${is_checked} onchange="itemChecked(this)" style="cursor:pointer;">`;
                },
                className: 'text-center',
            }, {
                name: 'nomor_identitas',
                data: 'nomor_identitas',
            }, {
                name: 'nama',
                data: 'nama',
            }, {
                name: '',
                data: null,
                render: data => `${data.jenjang_program_studi} - ${data.nama_program_studi}`,
            }, {
                name: '',
                data: 'status',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>create';
    submitData(dom('#form'), endpoint);
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
