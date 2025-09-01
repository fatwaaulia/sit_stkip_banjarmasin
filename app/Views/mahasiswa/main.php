<?php
$get_program_studi = $_GET['program_studi'] ?? '';
$get_mulai_kuliah = $_GET['mulai_kuliah'] ?? '';
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
                    <div class="col-12 text-end">
                        <button class="btn btn-primary" onclick="naikkanSemester(this)">
                            <i class="fa-solid fa-arrow-up"></i>
                            Naikkan Satu Semester
                        </button>
                        <script>
                        async function naikkanSemester(btn) {
                            const tombol_submit = btn;
                            let original_text = tombol_submit.innerHTML;

                            try {
                                const result = await Swal.fire({
                                    icon: 'question',
                                    title: 'Naikkan Satu Semester',
                                    text: 'Hanya berlaku untuk mahasiswa Aktif',
                                    confirmButtonText: 'Iya',
                                    cancelButtonText: 'Batal',
                                    showCancelButton: true,
                                    reverseButtons: true,
                                });

                                if (result.isConfirmed) {
                                    tombol_submit.disabled = true;
                                    tombol_submit.style.width = tombol_submit.getBoundingClientRect().width + 'px';
                                    tombol_submit.innerHTML = `<div class="spinner-border spinner-border-sm"></div>`;

                                    const response = await fetch(`<?= base_url() ?>api/mahasiswa/naikkan-semester`);
                                    const data = await response.json();

                                    tombol_submit.disabled = false;
                                    tombol_submit.innerHTML = original_text;

                                    if (['success', 'error'].includes(data.status)) {
                                        await Swal.fire({
                                            icon: data.status,
                                            title: data.message,
                                            showConfirmButton: false,
                                            timer: 2500,
                                            timerProgressBar: true,
                                        });
                                        data.route && (window.location.href = data.route);
                                    } else {
                                        await Swal.fire({
                                            icon: 'error',
                                            title: data.message,
                                            showConfirmButton: false,
                                        });
                                    }
                                }
                            } catch (error) {
                                tombol_submit.disabled = false;
                                tombol_submit.innerHTML = original_text;

                                console.error(error);
                                await Swal.fire({
                                    icon: 'error',
                                    title: 'Oops! Terjadi kesalahan',
                                    text: 'Silakan coba lagi nanti.',
                                    showConfirmButton: false,
                                    timer: 2500,
                                    timerProgressBar: true,
                                });
                            }
                        }
                        </script>
                    </div>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-12">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-5 col-lg-4 col-xl-3">
                                    <label for="program_studi" class="form-label">Program Studi</label>
                                    <select class="form-select" id="program_studi" name="program_studi">
                                        <option value="">Semua</option>
                                        <?php
                                        $program_studi = model('ProgramStudi')->findAll();
                                        foreach ($program_studi as $v) :
                                            $selected = ($v['id'] == $get_program_studi) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['jenjang'] ?> - <?= $v['nama'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-5 col-lg-4 col-xl-3">
                                    <label for="mulai_kuliah" class="form-label">Mulai Kuliah</label>
                                    <select class="form-select" id="mulai_kuliah" name="mulai_kuliah">
                                        <option value="">Semua</option>
                                        <?php
                                        $mulai_kuliah = model('TahunAkademik')->orderBy('periode_mulai DESC')->limit(3)->findAll();
                                        foreach ($mulai_kuliah as $v) :
                                            $selected = ($v['id'] == $get_mulai_kuliah) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>><?= $v['tahun_akademik'] ?> - <?= $v['tipe'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-12 col-md-2 col-lg-2 col-xl-2 d-flex justify-content-start align-items-end">
                                    <button type="submit" class="btn btn-primary me-2 w-100" title="Filter">
                                        <i class="fa-solid fa-filter"></i>
                                        <span class="ms-1 d-md-none">Filter</span>
                                    </button>
                                    <a href="<?= $base_route ?>" class="btn btn-outline-danger w-100" title="Reset">
                                        <i class="fa-solid fa-filter-circle-xmark"></i>
                                        <span class="ms-1 d-md-none">Reset</span>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Program Studi</th>
                            <th>Semester</th>
                            <th>Mulai Kuliah</th>
                            <th>Status</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#program_studi'), { search: true, clearable: true });
dselect(dom('#mulai_kuliah'), { search: true, clearable: true });

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
                data: null,
                render: data => `${data.semester}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.tahun_akademik_diterima} - ${data.tipe_tahun_akademik}`,
            }, {
                name: '',
                data: null,
                render: renderStatus,
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderStatus(data) {
    const tahun_akademik = <?= json_encode(model('TahunAkademik')->orderBy('periode_mulai DESC')->limit(3)->findAll()) ?>;
    const html_form = `
    <a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Konfirmasi Lulus?</a>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Konfirmasi Lulus</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="form_${data.id}">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">NIM</label>
                            <input type="text" class="form-control" value="${data.nomor_identitas}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nama Mahasiswa</label>
                            <input type="text" class="form-control" value="${data.nama}" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Program Studi</label>
                            <input type="text" class="form-control" value="${data.jenjang_program_studi} - ${data.nama_program_studi}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="tahun_akademik_lulus" class="form-label">Tahun Akademik Lulus</label>
                            <select class="form-select" id="tahun_akademik_lulus" name="tahun_akademik_lulus">
                                <option value="">Pilih</option>
                                ${tahun_akademik.map(item => `<option value="${item.id}">${item.tahun_akademik} - ${item.tipe}</option>`).join('')}
                            </select>
                            <div class="invalid-feedback" id="invalid_tahun_akademik_lulus"></div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="persetujuan" value="true" id="checkDefault">
                            <label class="form-check-label" for="checkDefault">
                                Centang untuk menyetujui mahasiswa diatas telah dinyatakan lulus.
                            </label>
                            <div class="invalid-feedback" id="invalid_persetujuan"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Ubah Status Lulus</button>
                    </div>
                </form>
            </div>
        </div>
    </div>`;

    let html = `${data.status} <br> ${ data.status != 'Lulus' ? html_form : data.tahun_akademik_lulus + ' - ' + data.tipe_tahun_akademik_lulus }`;

    setTimeout(() => actionUbahStatusLulus(data.id), 0);

    return html;
}

function actionUbahStatusLulus(id) {
    const form = dom(`#form_${id}`);

    if (! form.dataset.isInitialized) {
        form.dataset.isInitialized  = 'true';
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            const endpoint = `<?= $base_api ?>update/${id}/status-lulus`;
            submitData(form, endpoint);
        });
    }
}

function renderOpsi(data) {
    let endpoint_edit_data = `<?= $base_route ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    return `
    <a href="${endpoint_edit_data}" class="me-2" title="Edit">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <?php if (userSession('id_role') == 1) : ?>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a><?php endif; ?>`;
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
