<?php
$contoh_tahun_akademik = date('Y') . '/' . (date('Y') + 1);
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
                                                <label for="kode" class="form-label">Kode</label>
                                                <input type="text" class="form-control" id="kode" name="kode" placeholder="Masukkan kode">
                                                <div class="invalid-feedback" id="invalid_kode"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nama" class="form-label">Nama Tarif</label>
                                                <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama">
                                                <div class="invalid-feedback" id="invalid_nama"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya" class="form-label">Biaya SPP</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya" placeholder="Masukkan biaya" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya"></div>
                                            </div>
                                            <hr>
                                            <div class="mb-3">
                                                <label for="biaya_uts" class="form-label">Biaya UTS</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_uts" placeholder="Masukkan biaya uts" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_uts"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_uas" class="form-label">Biaya UAS</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_uas" placeholder="Masukkan biaya uas" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_uas"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_ldkm" class="form-label">Biaya LDKM</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_ldkm" placeholder="Masukkan biaya ldkm" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_ldkm"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_mbkm" class="form-label">Biaya MBKM</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_mbkm" placeholder="Masukkan biaya mbkm" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_mbkm"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_bimbingan_skripsi" class="form-label">Biaya Bimbingan Skripsi</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_bimbingan_skripsi" placeholder="Masukkan biaya bimbingan skripsi" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_bimbingan_skripsi"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_seminar_proposal" class="form-label">Biaya Seminar Proposal</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_seminar_proposal" placeholder="Masukkan biaya seminar proposal" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_seminar_proposal"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="biaya_sidang_skripsi" class="form-label">Biaya Sidang Skripsi</label>
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya_sidang_skripsi" placeholder="Masukkan biaya sidang skripsi" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_biaya_sidang_skripsi"></div>
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
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kode</th>
                            <th>Nama Tarif</th>
                            <th>Biaya SPP</th>
                            <th>Biaya UTS</th>
                            <th>Biaya UAS</th>
                            <th>Biaya LDKM</th>
                            <th>Biaya MBKM</th>
                            <th>Biaya Bimbingan Skripsi</th>
                            <th>Biaya Seminar Proposal</th>
                            <th>Biaya Sidang Skripsi</th>
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
                data: 'kode',
            }, {
                name: '',
                data: 'nama',
            }, {
                name: '',
                data: 'biaya',
            }, {
                name: '',
                data: 'biaya_uts',
            }, {
                name: '',
                data: 'biaya_uas',
            }, {
                name: '',
                data: 'biaya_ldkm',
            }, {
                name: '',
                data: 'biaya_mbkm',
            }, {
                name: '',
                data: 'biaya_bimbingan_skripsi',
            }, {
                name: '',
                data: 'biaya_seminar_proposal',
            }, {
                name: '',
                data: 'biaya_sidang_skripsi',
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
                            <label for="kode" class="form-label">Kode</label>
                            <input type="text" class="form-control" id="kode" name="kode" value="${data.kode}" placeholder="Masukkan kode">
                            <div class="invalid-feedback" id="invalid_kode"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Tarif</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="${data.nama}" placeholder="Masukkan nama">
                            <div class="invalid-feedback" id="invalid_nama"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya" class="form-label">Biaya SPP</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya" value="${dotsNumber(data.biaya)}" placeholder="Masukkan biaya" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya"></div>
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label for="biaya_uts" class="form-label">Biaya UTS</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_uts" value="${dotsNumber(data.biaya_uts)}" placeholder="Masukkan biaya uts" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_uts"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_uas" class="form-label">Biaya UAS</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_uas" value="${dotsNumber(data.biaya_uas)}" placeholder="Masukkan biaya uas" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_uas"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_ldkm" class="form-label">Biaya LDKM</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_ldkm" value="${dotsNumber(data.biaya_ldkm)}" placeholder="Masukkan biaya ldkm" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_ldkm"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_mbkm" class="form-label">Biaya MBKM</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_mbkm" value="${dotsNumber(data.biaya_mbkm)}" placeholder="Masukkan biaya mbkm" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_mbkm"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_bimbingan_skripsi" class="form-label">Biaya Bimbingan Skripsi</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_bimbingan_skripsi" value="${dotsNumber(data.biaya_bimbingan_skripsi)}" placeholder="Masukkan biaya bimbingan skripsi" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_bimbingan_skripsi"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_seminar_proposal" class="form-label">Biaya Seminar Proposal</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_seminar_proposal" value="${dotsNumber(data.biaya_seminar_proposal)}" placeholder="Masukkan biaya seminar proposal" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_seminar_proposal"></div>
                        </div>
                        <div class="mb-3">
                            <label for="biaya_sidang_skripsi" class="form-label">Biaya Sidang Skripsi</label>
                            <input type="text" inputmode="numeric" class="form-control" name="biaya_sidang_skripsi" value="${dotsNumber(data.biaya_sidang_skripsi)}" placeholder="Masukkan biaya sidang skripsi" oninput="this.value = dotsNumber(this.value)">
                            <div class="invalid-feedback" id="invalid_biaya_sidang_skripsi"></div>
                        </div>
                        <p class="mb-0">Perubahan biaya hanya berlaku pada mahasiswa yang baru mendaftar.</p>
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
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
