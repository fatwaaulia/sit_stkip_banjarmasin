<?php
$is_access = true;
// if (array_intersect(userSession('id_roles'), [1, 17, 4])) {
//     $is_access = true;
// }


$dosen = model('Users')
->where('id_role', 4)
->where('status_akun', 'ENABLE')
->findAll();

$mahasiswa = model('Users')
->where('id_role', 5)
->where('status', 'Aktif')
->where('nomor_identitas !=', '')
->findAll();

$anggota = array_merge($dosen, $mahasiswa);
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
                                                <div class="mb-3">
                                                    <label for="kategori" class="form-label">Kategori</label>
                                                    <select class="form-select" id="kategori" name="kategori">
                                                        <option value="">Pilih</option>
                                                        <?php
                                                        $kategori = ['PENELITIAN', 'PENGABDIAN', 'ARTIKEL PUBLIKASI'];
                                                        foreach ($kategori as $v) :
                                                        ?>
                                                        <option value="<?= $v ?>"><?= $v ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_kategori"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="judul" class="form-label">Judul</label>
                                                    <input type="text" class="form-control" id="judul" name="judul" placeholder="Masukkan judul">
                                                    <div class="invalid-feedback" id="invalid_judul"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="tautan" class="form-label">Tautan</label>
                                                    <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan">
                                                    <div class="invalid-feedback" id="invalid_tautan"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="tanggal_publikasi" class="form-label">Tanggal Publikasi</label>
                                                    <input type="date" class="form-control" id="tanggal_publikasi" name="tanggal_publikasi">
                                                    <div class="invalid-feedback" id="invalid_tanggal_publikasi"></div>
                                                </div>
                                                <hr>
                                                <div class="mb-3">
                                                    <label class="form-label">Anggota 1</label>
                                                    <input type="text" class="form-control" value="<?= userSession('nomor_identitas') ?> - <?= userSession('nama') ?> - <?= userSession('nama_program_studi') ?>" disabled>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="anggota_2" class="form-label">Anggota 2 <span class="text-secondary">(Opsional)</span></label>
                                                    <select class="form-select" id="anggota_2" name="anggota_2">
                                                        <option value="">Pilih</option>
                                                        <?php foreach ($anggota as $v) : ?>
                                                        <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_anggota_2"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="anggota_3" class="form-label">Anggota 3 <span class="text-secondary">(Opsional)</span></label>
                                                    <select class="form-select" id="anggota_3" name="anggota_3">
                                                        <option value="">Pilih</option>
                                                        <?php foreach ($anggota as $v) : ?>
                                                        <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_anggota_3"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="anggota_4" class="form-label">Anggota 4 <span class="text-secondary">(Opsional)</span></label>
                                                    <select class="form-select" id="anggota_4" name="anggota_4">
                                                        <option value="">Pilih</option>
                                                        <?php foreach ($anggota as $v) : ?>
                                                        <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_anggota_4"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="anggota_5" class="form-label">Anggota 5 <span class="text-secondary">(Opsional)</span></label>
                                                    <select class="form-select" id="anggota_5" name="anggota_5">
                                                        <option value="">Pilih</option>
                                                        <?php foreach ($anggota as $v) : ?>
                                                        <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_anggota_5"></div>
                                                </div>
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
                            <th>Judul</th>
                            <th>Tanggal Publikasi</th>
                            <th>Tautan</th>
                            <th>Anggota 1</th>
                            <th>Anggota 2</th>
                            <th>Anggota 3</th>
                            <th>Anggota 4</th>
                            <th>Anggota 5</th>
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
dselect(dom('#anggota_2'), { search: true, clearable: true });
dselect(dom('#anggota_3'), { search: true, clearable: true });
dselect(dom('#anggota_4'), { search: true, clearable: true });
dselect(dom('#anggota_5'), { search: true, clearable: true });

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
                data: 'judul',
            }, {
                name: '',
                data: 'tanggal_publikasi',
            }, {
                name: '',
                data: null,
                render: data => `<a href="${data.tautan}" target="_blank">Buka</a>`,
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
    const kategori = ['PENELITIAN', 'PENGABDIAN', 'ARTIKEL PUBLIKASI'];
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
                            <label for="kategori" class="form-label">Kategori</label>
                            <select class="form-select" id="kategori" name="kategori">
                                <option value="">Pilih</option>
                                ${kategori.map(item => `<option value="${item}" ${item == data.kategori ? 'selected' : ''}>${item}</option>`).join('')}
                            </select>
                            <div class="invalid-feedback" id="invalid_kategori"></div>
                        </div>
                        <div class="mb-3">
                            <label for="judul" class="form-label">Judul</label>
                            <input type="text" class="form-control" id="judul" name="judul" value="${data.judul}" placeholder="Masukkan judul">
                            <div class="invalid-feedback" id="invalid_judul"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tautan" class="form-label">Tautan</label>
                            <input type="text" class="form-control" id="tautan" name="tautan" value="${data.tautan}" placeholder="Masukkan tautan">
                            <div class="invalid-feedback" id="invalid_tautan"></div>
                        </div>
                        <div class="mb-3">
                            <label for="tanggal_publikasi" class="form-label">Tanggal Publikasi</label>
                            <input type="date" class="form-control" id="tanggal_publikasi" name="tanggal_publikasi" value="${data.tanggal_publikasi}">
                            <div class="invalid-feedback" id="invalid_tanggal_publikasi"></div>
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label class="form-label">Anggota 1</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas_anggota_1} - ${data.nama_anggota_1} - ${data.nama_program_studi_anggota_1}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 2</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas_anggota_2} - ${data.nama_anggota_2} - ${data.nama_program_studi_anggota_2}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 3</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas_anggota_3} - ${data.nama_anggota_3} - ${data.nama_program_studi_anggota_3}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 4</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas_anggota_4} - ${data.nama_anggota_4} - ${data.nama_program_studi_anggota_4}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Anggota 5</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas_anggota_5} - ${data.nama_anggota_5} - ${data.nama_program_studi_anggota_5}" disabled>
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
