<?php
$contoh_tahun_akademik = date('Y') . '/' . (date('Y') + 1);
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
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#new">
                            Ubah Status Mahasiswa
                        </button>
                        <div class="modal fade" id="new" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Ubah Status Mahasiswa</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <form id="form">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="mahasiswa" class="form-label">Mahasiswa</label>
                                                <select class="form-select" id="mahasiswa" name="mahasiswa">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $mahasiswa = model('Users')->where([
                                                        'id_role' => 5,
                                                        'status'  => 'Aktif',
                                                    ])->findAll();
                                                    foreach ($mahasiswa as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - (<?= $v['jenjang_program_studi'] ?>) <?= $v['nama_program_studi'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_mahasiswa"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Status</label>
                                                <?php
                                                $status = ['Cuti', 'DO'];
                                                foreach ($status as $v) :
                                                ?>
                                                <div class="form-check">
                                                    <input type="radio" class="form-check-input" id="<?= $v ?>" name="status" value="<?= $v ?>">
                                                    <label class="form-check-label" for="<?= $v ?>">
                                                        <?= $v ?>
                                                    </label>
                                                </div>
                                                <?php endforeach; ?>
                                                <div class="invalid-feedback" id="invalid_status"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                                                <select class="form-select" id="tahun_akademik" name="tahun_akademik">
                                                    <option value="">Pilih</option>
                                                    <?php
                                                    $tahun_akademik = model('TahunAkademik')->orderBy('periode_mulai DESC')->limit(5)->findAll();
                                                    foreach ($tahun_akademik as $v) :
                                                    ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['tahun_akademik'] ?> - <?= $v['tipe'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                            </div>
                                            <p class="mb-0 text-danger">Pastikan data diatas sudah benar!</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary float-end">Simpan</button>
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
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Program Studi</th>
                            <th>Status</th>
                            <th>Tahun Akademik</th>
                            <th>Selesai Cuti</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#mahasiswa'), { search: true });
dselect(dom('#tahun_akademik'), { search: true });

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTable', {
        ajax: '<?= $get_data ?>',
        processing: true,
        serverSide: true,
        order: [],
        initComplete: function (settings, json) {
            $('#myTable').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
        },
        columns: [
            {
                name: '',
                data: 'no_urut',
            }, {
                name: 'nomor_identitas_mahasiswa',
                data: 'nomor_identitas_mahasiswa',
            }, {
                name: 'nama_mahasiswa',
                data: 'nama_mahasiswa',
            }, {
            name: '',
                data: null,
                render: data => `${data.jenjang_program_studi} - ${data.nama_program_studi}`,
            }, {
                name: '',
                data: renderStatus,
            }, {
                name: '',
                data: null,
                render: data => `${data.tahun_akademik} ${data.tipe_tahun_akademik}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.tahun_akademik_selesai_cuti} ${data.tipe_tahun_akademik_selesai_cuti}`,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});


function renderStatus(data) {
    const status = ['Aktif', 'Cuti', 'DO'];
    const tahun_akademik = <?= json_encode($tahun_akademik) ?>;
    const modal_edit = `
    <a class="me-2" title="Edit" data-bs-toggle="modal" data-bs-target="#edit${data.id}">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <div class="modal fade" id="edit${data.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Ubah Status Mahasiswa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="form_${data.id}">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Mahasiswa</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="${data.nomor_identitas_mahasiswa} - ${data.nama_mahasiswa} - ${data.nama_program_studi}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            ${status.map(item => `
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="${data.id}_${item}" name="status" value="${item}" ${item == data.status ? 'checked' : ''}>
                                <label class="form-check-label" for="${data.id}_${item}">
                                    ${item}
                                </label>
                            </div>`)
                            .join('')}
                            <div class="invalid-feedback" id="invalid_status"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tahun Akademik (Mulai Cuti)</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="${data.tahun_akademik} - ${data.tipe_tahun_akademik}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="tahun_akademik_${data.id}" class="form-label">Selesai Cuti</label>
                            <select class="form-select" id="tahun_akademik_${data.id}" name="tahun_akademik_selesai_cuti">
                                <option value="">Pilih</option>
                                ${tahun_akademik.map(item => `<option value="${item.id}" ${item == data.jenjang ? 'selected' : ''}>${item.tahun_akademik} - ${item.tipe}</option>`).join('')}
                            </select>
                            <div class="form-text">
                                Pilih tahun akademik akhir cuti, bukan saat aktif kembali.
                            </div>
                            <div class="invalid-feedback" id="invalid_tahun_akademik_selesai_cuti"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary float-end">Simpan Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>`;

    let html = `
    <span class="me-2">${data.status}</span>
    ${data.status == 'Cuti' ? modal_edit : ''}`;

    setTimeout(() => actionUbahStatus(data.id), 0);

    return html;
}

function actionUbahStatus(id) {
    dselect(dom(`#tahun_akademik_${id}`), { search: true });
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
