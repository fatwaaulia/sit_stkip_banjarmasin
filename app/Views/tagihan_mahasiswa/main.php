<?php
$tahun_akademik_aktif = model('TahunAkademik')->orderBy('id DESC')->first();
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
                                        <input type="hidden" name="kategori" value="MABA">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="jenis_tagihan_maba" class="form-label">Jenis Tagihan Maba</label>
                                                <select class="form-select" id="jenis_tagihan_maba" name="jenis">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $jenis = ['PENDAFTARAN', 'ALMAMATER', 'KTM', 'UANG GEDUNG'];
                                                    foreach ($jenis as $v) :
                                                    ?>
                                                    <option value="<?= $v ?>"><?= $v ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_jenis"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tahun Akdemik</label>
                                                <input type="text" class="form-control" value="<?= $tahun_akademik_aktif['tahun_akademik'] ?> - <?= $tahun_akademik_aktif['tipe'] ?>" disabled>
                                            </div>
                                            <div class="mb-2">
                                                <span class="fw-600">Biaya Per-Prodi</span>
                                            </div>
                                            <?php
                                            $program_studi = model('ProgramStudi')->findAll();
                                            foreach ($program_studi as $v) :
                                            ?>
                                            <div class="mb-3">
                                                <label for="biaya" class="form-label"><?= $v['jenjang'] ?> - <?= $v['nama'] ?></label>
                                                <input type="hidden" name="id_program_studi[]" value="<?= $v['id'] ?>">
                                                <input type="text" inputmode="numeric" class="form-control" name="biaya[]" placeholder="Masukkan biaya" oninput="this.value = dotsNumber(this.value)" required>
                                            </div>
                                            <?php endforeach; ?>
                                            <p class="mb-0">Tagihan akan diberikan kepada mahasiswa yang diterima/ mulai kuliah pada tahun akademik diatas.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Buat Tagihan</button>
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
                                        <input type="hidden" name="kategori" value="SEMESTER">
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
                                                <label class="form-label">Tahun Akdemik</label>
                                                <input type="text" class="form-control" value="<?= $tahun_akademik_aktif['tahun_akademik'] ?> - <?= $tahun_akademik_aktif['tipe'] ?>" disabled>
                                            </div>
                                            <p class="mb-0">Tagihan akan diberikan kepada semua mahasiswa Aktif.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Buat Tagihan</button>
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
                            <i class="fa-solid fa-plus fa-sm"></i> Perorangan
                        </a>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kategori</th>
                            <th>Jenis</th>
                            <th>Tahun Akademik</th>
                            <th>Created At</th>
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
dselect(dom('#jenis_tagihan_semester'), { search: true });

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
                data: null,
                render: data => (data.kategori == 'PERORANGAN') ? `<a href="<?= $base_route ?>edit/${data.id}">${data.kategori}</a>` : data.kategori,
            }, {
                name: '',
                data: null,
                render: renderJenis,
            }, {
                name: '',
                data: null,
                render: data => `<a href="<?= base_url(userSession('slug_role')) ?>/status-bayar?tagihan_mahasiswa=${data.id}">${data.tahun_akademik} - ${data.tipe_tahun_akademik}</a>`,
            }, {
                name: '',
                data: 'created_at',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderJenis(data) {
    const json_biaya = JSON.parse(data.json_biaya);
    const detail_tagihan_maba = `
    <a href="#" data-bs-toggle="modal" data-bs-target="#detail_tagihan_maba_${data.id}">
        <i class="fa-solid fa-circle-info"></i>
    </a>
    <div class="modal fade" id="detail_tagihan_maba_${data.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Detail Tagihan Maba</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Jenis Tagihan Maba</label>
                        <input type="text" class="form-control" value="${data.jenis}" disabled>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tahun Akademik</label>
                        <input type="text" class="form-control" value="${data.tahun_akademik} - ${data.tipe_tahun_akademik}" disabled>
                    </div>
                    ${json_biaya.map(item => `${item.jenjang_program_studi} - ${item.nama_program_studi} : ${dotsNumber(item.biaya)}`).join('<br>')}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>`;
    return `
    ${data.jenis} ${data.kategori == 'MABA' ? detail_tagihan_maba : ''}`;
}

function renderOpsi(data) {
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;

    return `
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
