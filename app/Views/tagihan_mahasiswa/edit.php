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
                        <input type="hidden" name="kategori" value="PERORANGAN">
                        <div class="row gx-2">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="mb-3">
                                    <label class="form-label">Kategori</label>
                                    <input type="text" class="form-control" value="Perorangan" disabled>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="mb-3">
                                    <label class="form-label">Jenis Tagihan</label>
                                    <input type="text" class="form-control" value="<?= $data['jenis'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="mb-3">
                                    <label class="form-label">Tahun Akdemik</label>
                                    <input type="text" class="form-control" value="<?= $data['tahun_akademik'] ?> - <?= $data['tipe_tahun_akademik'] ?>" disabled>
                                </div>
                            </div>
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
                                    <th>Biaya Kegiatan</th>
                                    <th>Biaya Skripsi</th>
                                    <th>Biaya Yudisium dan Wisuda</th>
                                </tr>
                            </thead>
                        </table>
                        <div class="mt-3 float-end">
                            <a href="<?= $base_route ?>" class="btn btn-secondary me-2">Kembali</a>
                            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', () => {
    <?php if (!empty($data['json_id_mahasiswa'])) : ?>
    sessionStorage.setItem('checked_id', '<?= $data['json_id_mahasiswa'] ?>');
    <?php else : ?>
    sessionStorage.removeItem('checked_id');
    <?php endif; ?>
});

function itemChecked(el) {
    let session_checked_id = JSON.parse(sessionStorage.getItem('checked_id')) || [];

    if (el.checked) {
        if (!session_checked_id.includes(el.value)) session_checked_id.push(el.value);
    } else {
        session_checked_id = session_checked_id.filter(id => id !== el.value);
    }

    // console.log(session_checked_id);

    sessionStorage.setItem('checked_id', JSON.stringify(session_checked_id));
}


dom('#form').addEventListener('submit', async function(event) {
    event.preventDefault();
    const form = dom('#form');

    const tombol_submit = event.submitter;
    let original_text = tombol_submit.innerHTML;
    tombol_submit.disabled = true;
    tombol_submit.style.width = tombol_submit.getBoundingClientRect().width + 'px';
    tombol_submit.innerHTML = `<div class="spinner-border spinner-border-sm"></div>`;

    const session_checked_id = sessionStorage.getItem('checked_id') || [];

    try {
        const form_data = new FormData(form);
        for (const [key, value] of form_data.entries()) {
            if (typeof value === 'string') {
                form_data.set(key, value.trim());
            }
        }
        form_data.append('json_id_mahasiswa', session_checked_id);

        const response = await fetch('<?= $base_api ?>update/<?= $data['id'] ?>', {
            method: 'POST',
            body: form_data,
        });
        const data = await response.json();

        tombol_submit.disabled = false;
        tombol_submit.innerHTML = original_text;

        // console.log(data);
        // return;

        if (['success', 'error'].includes(data.status)) {
            await Swal.fire({
                icon: data.status,
                title: data.message,
                showConfirmButton: false,
                timer: 2500,
                timerProgressBar: true,
            });
            if (data.status == 'success') {
                sessionStorage.removeItem('checked_id');
            }
            data.route && (window.location.href = data.route);
        } else {
            await Swal.fire({
                icon: 'error',
                title: data.message,
                showConfirmButton: false,
            });
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
});

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
                data: null,
                render: data => `<a href="<?= base_url(userSession('slug_role')) ?>/mahasiswa/edit/${data.id}" target="_blank">${data.nomor_identitas}</a>`,
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
            }, {
                name: '',
                data: null,
                render: data => `
                <table class="table mb-0">
                    <tr>
                        <td style="border: none!important; padding: 0;">LDKM</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_ldkm)}</td>
                    </tr>
                    <tr>
                        <td style="border: none!important; padding: 0;">MBKM</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_mbkm)}</td>
                    </tr>
                <table>`,
            }, {
                name: '',
                data: null,
                render: data => `
                <table class="table mb-0">
                    <tr>
                        <td style="border: none!important; padding: 0;">Bimbingan Skripsi</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_bimbingan_skripsi)}</td>
                    </tr>
                    <tr>
                        <td style="border: none!important; padding: 0;">Seminar Proposal</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_seminar_proposal)}</td>
                    </tr>
                    <tr>
                        <td style="border: none!important; padding: 0;">Sidang Skripsi</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_sidang_skripsi)}</td>
                    </tr>
                <table>`,
            }, {
                name: '',
                data: null,
                render: data => `
                <table class="table mb-0">
                    <tr>
                        <td style="border: none!important; padding: 0;">Yudisium</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_yudisium)}</td>
                    </tr>
                    <tr>
                        <td style="border: none!important; padding: 0;">Wisuda</td>
                        <td style="border: none!important; padding: 0;">: ${formatRupiah(data.biaya_wisuda)}</td>
                    </tr>
                <table>`,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
