<?php
$contoh_tahun_akademik = date('Y') . '/' . (date('Y') + 1);

$tahun_akademik_aktif = model('TahunAkademik')->orderBy('id DESC')->first();

if ($tahun_akademik_aktif) {
    $tahun_akademik_aktif = $tahun_akademik_aktif['tahun_akademik'] . ' - ' . $tahun_akademik_aktif['tipe'];
} else {
    $tahun_akademik_aktif = '-';
}
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
            <div class="alert alert-warning">
                Tahun akademik sekarang dipilih berdasarkan yang terakhir dibuat. Jangan menambahkan data jika semester <span class="fw-600"><?= $tahun_akademik_aktif ?></span> belum selesai.
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6 col-lg-5 col-xl-4 fw-600">
                        Tahun Akademik Sekarang : <?= $tahun_akademik_aktif ?>
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
                                                <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                                                <input type="text" class="form-control" id="tahun_akademik" name="tahun_akademik" placeholder="Contoh: <?= $contoh_tahun_akademik ?>" oninput="this.value=this.value.replace(/[^0-9/]/g,'')">
                                                <div class="form-text">
                                                    Pastikan penulisan benar "<?= $contoh_tahun_akademik ?>"
                                                </div>
                                                <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tipe</label>
                                                <?php
                                                $tipe = ['Ganjil', 'Genap'];
                                                foreach ($tipe as $v) :
                                                ?>
                                                <div class="form-check">
                                                    <input type="radio" class="form-check-input" id="<?= $v ?>" name="tipe" value="<?= $v ?>">
                                                    <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                                </div>
                                                <?php endforeach; ?>
                                                <div class="invalid-feedback" id="invalid_tipe"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="periode_mulai" class="form-label">Periode Mulai</label>
                                                <input type="date" class="form-control" id="periode_mulai" name="periode_mulai">
                                                <div class="invalid-feedback" id="invalid_periode_mulai"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="periode_selesai" class="form-label">Periode Selesai</label>
                                                <input type="date" class="form-control" id="periode_selesai" name="periode_selesai">
                                                <div class="invalid-feedback" id="invalid_periode_selesai"></div>
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
                            <th>Tahun Akademik</th>
                            <th>Tipe</th>
                            <th>Periode Mulai</th>
                            <th>Periode Selesai</th>
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
                data: 'tahun_akademik',
            }, {
                name: '',
                data: 'tipe',
            }, {
                name: '',
                data: 'periode_mulai',
            }, {
                name: '',
                data: 'periode_selesai',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderOpsi(data) {
    const tipe = ['Ganjil', 'Genap'];
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
                            <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
                            <input type="text" class="form-control" id="tahun_akademik" name="tahun_akademik" value="${data.tahun_akademik}" placeholder="Contoh: <?= $contoh_tahun_akademik ?>" oninput="this.value=this.value.replace(/[^0-9/]/g,'')">
                            <div class="form-text">
                                Pastikan penulisan benar "<?= $contoh_tahun_akademik ?>"
                            </div>
                            <div class="invalid-feedback" id="invalid_tahun_akademik"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipe</label>
                            ${tipe.map(item => `
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="${data.id}_${item}" name="tipe" value="${item}" ${item == data.tipe ? 'checked' : ''}>
                                <label class="form-check-label" for="${data.id}_${item}">${item}</label>
                            </div>`)
                            .join('')}
                            <div class="invalid-feedback" id="invalid_tipe"></div>
                        </div>
                        <div class="mb-3">
                            <label for="periode_mulai" class="form-label">Periode Mulai</label>
                            <input type="date" class="form-control" id="periode_mulai" name="periode_mulai" value="${(data.periode_mulai).split('-').reverse().join('-')}">
                            <div class="invalid-feedback" id="invalid_periode_mulai"></div>
                        </div>
                        <div class="mb-3">
                            <label for="periode_selesai" class="form-label">Periode Selesai</label>
                            <input type="date" class="form-control" id="periode_selesai" name="periode_selesai" value="${(data.periode_selesai).split('-').reverse().join('-')}">
                            <div class="invalid-feedback" id="invalid_periode_selesai"></div>
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
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
