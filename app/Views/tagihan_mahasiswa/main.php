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
            <div class="card p-3">
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6 col-lg-5 col-xl-4">
                        <!--  -->
                    </div>
                    <div class="col-12 col-md-6 col-lg-7 col-xl-8 d-flex justify-content-end align-items-end">
                        <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#newMaba">
                            <i class="fa-solid fa-plus fa-sm"></i> Maba
                        </button>
                        <div class="modal fade" id="newMaba" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Add Tagihan Maba</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <form id="form_tagihan_maba">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="jenis_tagihan_maba" class="form-label">Jenis Tagihan Maba</label>
                                                <select class="form-select" id="jenis_tagihan_maba" name="jenis">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $jenis = ['ALMAMATER', 'KTM', 'UANG GEDUNG'];
                                                    foreach ($jenis as $v) :
                                                    ?>
                                                    <option value="<?= $v ?>"><?= $v ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_jenis"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tahun_akademik_maba" class="form-label">Tahun Akademik</label>
                                                <select class="form-select" id="tahun_akademik_maba" name="tahun_akademik">
                                                    <?php
                                                    $tahun_akademik = model('TahunAkademik')->orderBy('periode_mulai DESC')->limit(5)->findAll();
                                                    foreach ($tahun_akademik as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['tahun_akademik'] ?> - <?= $v['tipe'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Tambahkan</button>
                                        </div>
                                    </form>
                                    <script>
                                    dom('#form_tagihan_maba').addEventListener('submit', function(event) {
                                        event.preventDefault();
                                        const endpoint = '<?= $base_api ?>create';
                                        submitData(dom('#form_tagihan_maba'), endpoint);
                                    });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#newSemester">
                            <i class="fa-solid fa-plus fa-sm"></i> Semester
                        </button>
                        <div class="modal fade" id="newSemester" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Add Tagihan Semester</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <form id="form_tagihan_semester">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="jenis_tagihan_semester" class="form-label">Jenis Tagihan Semester</label>
                                                <select class="form-select" id="jenis_tagihan_semester" name="jenis">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $jenis = ['SPP', 'UTS', 'UAS'];
                                                    foreach ($jenis as $v) :
                                                    ?>
                                                    <option value="<?= $v ?>"><?= $v ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_jenis"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tahun_akademik_semester" class="form-label">Tahun Akademik</label>
                                                <select class="form-select" id="tahun_akademik_semester" name="tahun_akademik">
                                                    <?php
                                                    $tahun_akademik = model('TahunAkademik')->orderBy('periode_mulai DESC')->limit(5)->findAll();
                                                    foreach ($tahun_akademik as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['tahun_akademik'] ?> - <?= $v['tipe'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Tambahkan</button>
                                        </div>
                                    </form>
                                    <script>
                                    dom('#form_tagihan_semester').addEventListener('submit', function(event) {
                                        event.preventDefault();
                                        const endpoint = '<?= $base_api ?>create';
                                        submitData(dom('#form_tagihan_semester'), endpoint);
                                    });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <a href="<?= $base_route ?>new" class="btn btn-primary">
                            <i class="fa-solid fa-plus fa-sm"></i> Opsional
                        </a>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Jenis</th>
                            <th>Tahun Akademik</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#jenis_tagihan_maba'), { search: true });
dselect(dom('#tahun_akademik_maba'), { search: true });

dselect(dom('#jenis_tagihan_semester'), { search: true });
dselect(dom('#tahun_akademik_semester'), { search: true });

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
                data: 'jenis',
            }, {
                name: '',
                data: null,
                render: data => `${data.tahun_akademik} ${data.tipe_tahun_akademik}`,
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderOpsi(data) {
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    let html = `
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;

    setTimeout(() => actionEdit(data.id), 0);

    return html;
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
