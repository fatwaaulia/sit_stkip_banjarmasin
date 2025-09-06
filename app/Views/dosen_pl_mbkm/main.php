<?php
$is_access = true;
if (array_intersect(userSession('id_roles'), [1, 17, 8])) {
    $is_access = true;
}
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
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <?php if ($is_access) : ?>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6 col-lg-5 col-xl-4">
                        <!--  -->
                    </div>
                    <div class="col-12 col-md-6 col-lg-7 col-xl-8 d-flex justify-content-end align-items-end">
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
                                                    $kategori = ['PL', 'MBKM'];
                                                    foreach ($kategori as $v) :
                                                    ?>
                                                    <option value="<?= $v ?>"><?= $v ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_kategori"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dosen" class="form-label">Dosen</label>
                                                <select class="form-select" id="dosen" name="dosen">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $dosen = model('Users')->where('id_role', 4)->findAll();
                                                    foreach ($dosen as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['jenjang_program_studi'] ?> <?= $v['nama_program_studi'] ?> - <?= $v['nama'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_dosen"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                                                <select class="form-select" id="tahun_akademik" name="tahun_akademik">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $tahun_akademik = model('TahunAkademik')->orderBy('id DESC')->limit(6)->findAll();
                                                    foreach ($tahun_akademik as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['tahun_akademik'] ?> - <?= $v['tipe'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tautan" class="form-label">Tautan</label>
                                                <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan">
                                                <div class="invalid-feedback" id="invalid_tautan"></div>
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
                            <th>Tahun Akademik</th>
                            <th>Dosen</th>
                            <th>Program Studi</th>
                            <th>Tautan</th>
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
                name: '',
                data: null,
                render: data => `${data.tahun_akademik} - ${data.tipe_tahun_akademik}`,
            }, {
                name: 'nama_dosen',
                data: 'nama_dosen',
            }, {
                name: 'nama_program_studi',
                data: null,
                render: data => `${data.jenjang_program_studi} - ${data.nama_program_studi}`,
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
dselect(dom('#dosen'), { search: true });
function renderOpsi(data) {
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
                            <label class="form-label">Kategori</label>
                            <input type="text" class="form-control" value="${data.kategori}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tahun Akademik</label>
                            <input type="text" class="form-control" value="${data.tahun_akademik} - ${data.tipe_tahun_akademik}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Dosen</label>
                            <input type="text" class="form-control" value="${data.jenjang_program_studi} ${data.nama_program_studi} - ${data.nama_dosen}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan</label>
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
