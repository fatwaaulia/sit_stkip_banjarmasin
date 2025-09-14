<?php
// $is_access = false;
// if (array_intersect(userSession('id_roles'), [4])) {
    $is_access = true;
// }
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
                                                    <label class="form-label">Program Studi</label>
                                                    <input type="text" class="form-control" value="<?= userSession('jenjang_program_studi') ?> - <?= userSession('nama_program_studi') ?>" disabled>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                                                    <input type="text" class="form-control" id="tahun_akademik" name="tahun_akademik" placeholder="Cth. 2024/2025">
                                                    <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="kode" class="form-label">Kode</label>
                                                    <input type="text" class="form-control" id="kode" name="kode" placeholder="Masukkan kode">
                                                    <div class="invalid-feedback" id="invalid_kode"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="nama_mata_kuliah" class="form-label">Nama Mata Kuliah</label>
                                                    <input type="text" class="form-control" id="nama_mata_kuliah" name="nama_mata_kuliah" placeholder="Masukkan nama mata kuliah">
                                                    <div class="invalid-feedback" id="invalid_nama_mata_kuliah"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="sks" class="form-label">SKS</label>
                                                    <input type="text" class="form-control" id="sks" name="sks" placeholder="Masukkan sks">
                                                    <div class="invalid-feedback" id="invalid_sks"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="hari" class="form-label">Hari</label>
                                                    <select class="form-select" id="hari" name="hari">
                                                        <option value="">Pilih</option>
                                                        <?php
                                                        $hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
                                                        foreach ($hari as $v) :
                                                        ?>
                                                        <option value="<?= $v ?>"><?= $v ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                    <div class="invalid-feedback" id="invalid_hari"></div>
                                                </div>
                                                <div class="row gx-2">
                                                    <div class="col-6">
                                                        <div class="mb-3">
                                                            <label for="jam_mulai" class="form-label">Jam Mulai</label>
                                                            <input type="time" class="form-control" id="jam_mulai" name="jam_mulai" placeholder="Masukkan jam mulai">
                                                            <div class="invalid-feedback" id="invalid_jam_mulai"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3">
                                                            <label for="jam_selesai" class="form-label">Jam Selesai</label>
                                                            <input type="time" class="form-control" id="jam_selesai" name="jam_selesai" placeholder="Masukkan jam selesai">
                                                            <div class="invalid-feedback" id="invalid_jam_selesai"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="ruangan" class="form-label">Ruangan</label>
                                                    <input type="text" class="form-control" id="ruangan" name="ruangan" placeholder="Masukkan ruangan">
                                                    <div class="invalid-feedback" id="invalid_ruangan"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Dosen Pengampu</label>
                                                    <input type="text" class="form-control" value="<?= userSession('nama') ?>" disabled>
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
                            <th>Kode</th>
                            <th>Nama Mata Kuliah</th>
                            <th>SKS</th>
                            <th>Hari, Jam</th>
                            <th>Ruangan</th>
                            <th>Dosen Pengampu</th>
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
    const hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
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
                            <div class="mb-3">
                                <label class="form-label">Program Studi</label>
                                <input type="text" class="form-control" value="<?= userSession('jenjang_program_studi') ?> - <?= userSession('nama_program_studi') ?>" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tahun Akademik</label>
                                <input type="text" class="form-control" value="${data.tahun_akademik}" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="kode" class="form-label">Kode</label>
                                <input type="text" class="form-control" id="kode" name="kode" value="${data.kode}" placeholder="Masukkan kode">
                                <div class="invalid-feedback" id="invalid_kode"></div>
                            </div>
                            <div class="mb-3">
                                <label for="nama_mata_kuliah" class="form-label">Nama Mata Kuliah</label>
                                <input type="text" class="form-control" id="nama_mata_kuliah" name="nama_mata_kuliah" value="${data.nama_mata_kuliah}" placeholder="Masukkan nama mata kuliah">
                                <div class="invalid-feedback" id="invalid_nama_mata_kuliah"></div>
                            </div>
                            <div class="mb-3">
                                <label for="sks" class="form-label">SKS</label>
                                <input type="text" class="form-control" id="sks" name="sks" value="${data.sks}" placeholder="Masukkan sks">
                                <div class="invalid-feedback" id="invalid_sks"></div>
                            </div>
                            <div class="mb-3">
                                <label for="hari" class="form-label">Hari</label>
                                <select class="form-select" id="hari" name="hari">
                                    <option value="">Pilih</option>
                                    ${hari.map(item => `<option value="${item}" ${item == data.hari ? 'selected' : ''}>${item}</option>`).join('')}
                                </select>
                                <div class="invalid-feedback" id="invalid_hari"></div>
                            </div>
                            <div class="row gx-2">
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="jam_mulai" class="form-label">Jam Mulai</label>
                                        <input type="time" class="form-control" id="jam_mulai" name="jam_mulai" value="${data.jam_mulai}" placeholder="Masukkan jam mulai">
                                        <div class="invalid-feedback" id="invalid_jam_mulai"></div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="jam_selesai" class="form-label">Jam Selesai</label>
                                        <input type="time" class="form-control" id="jam_selesai" name="jam_selesai" value="${data.jam_selesai}" placeholder="Masukkan jam selesai">
                                        <div class="invalid-feedback" id="invalid_jam_selesai"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="ruangan" class="form-label">Nama Ruangan</label>
                                <input type="text" class="form-control" id="ruangan" name="ruangan" value="${data.ruangan}" placeholder="Masukkan ruangan">
                                <div class="invalid-feedback" id="invalid_ruangan"></div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Dosen Pengampu</label>
                                <input type="text" class="form-control" value="${data.dosen_pengampu}" disabled>
                            </div>
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
