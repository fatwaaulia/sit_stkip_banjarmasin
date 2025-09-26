<?php
$is_access = false;
if (in_array(userSession('id_role'), [1, 17]) || in_array(userSession('id_role_aktif'), [4])) {
    $is_access = true;
}

$get_dosen = $_GET['dosen'] ?? '';
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
                    <div class="col-12 col-lg-10 col-xl-11">
                        <?php if (in_array(userSession('id_role'), [1, 17]) || in_array(userSession('id_role_aktif'), [7, 8])) : ?>
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-5 col-lg-5 col-xl-4">
                                    <label for="dosen" class="form-label">Dosen</label>
                                    <select id="dosen" name="dosen">
                                        <option value="">Pilih</option>
                                        <?php
                                        $dosen = model('Users', false)->where('id_role', 4);
                                        if (userSession('id_role_aktif') == 8) {
                                            $dosen->where('id_program_studi', userSession('id_program_studi'));
                                        }
                                        $dosen = $dosen->findAll();
                                        foreach ($dosen as $v) :
                                            $selected = ($v['id'] == $get_dosen) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>>
                                            <?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?>
                                        </option>
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
                        <script>
                        dselect(dom('#dosen'), { search: true, clearable: true });
                        </script>
                        <?php endif; ?>
                    </div>
                    <div class="col-12 col-lg-2 col-xl-1 d-flex justify-content-end align-items-end">
                        <?php if ($is_access) : ?>
                        <a href="<?= $base_route ?>new" class="btn btn-primary">
                            <i class="fa-solid fa-plus fa-sm"></i> New
                        </a>
                        <?php endif; ?>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kategori</th>
                            <th>Judul</th>
                            <th>Tanggal Publikasi</th>
                            <th>Tautan Diterbitkan</th>
                            <th>Tautan Gdrive</th>
                            <th>Dokumen</th>
                            <th>Anggota 1</th>
                            <th>Anggota 2</th>
                            <th>Anggota 3</th>
                            <th>Anggota 4</th>
                            <th>Anggota 5</th>
                            <th>Anggota Beda Kampus</th>
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
                name: 'judul',
                data: null,
                render: data => `<div style="width: 300px; white-space: normal;">${data.judul}</div>`,
            }, {
                name: '',
                data: 'tanggal_publikasi',
            }, {
                name: '',
                data: null,
                render: data => data.tautan ? `<a href="${data.tautan}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.tautan_gdrive ? `<a href="${data.tautan_gdrive}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen ? `<a href="${data.dokumen}" target="_blank">Buka</a>` : '-',
            }, {
                name: 'nama_anggota_1',
                data: null,
                render: data => `${data.nomor_identitas_anggota_1} - ${data.nama_anggota_1} <br> ${data.nama_program_studi_anggota_1}`,
            }, {
                name: 'nama_anggota_2',
                data: null,
                render: data => `${data.nomor_identitas_anggota_2} - ${data.nama_anggota_2} <br> ${data.nama_program_studi_anggota_2}`,
            }, {
                name: 'nama_anggota_3',
                data: null,
                render: data => `${data.nomor_identitas_anggota_3} - ${data.nama_anggota_3} <br> ${data.nama_program_studi_anggota_3}`,
            }, {
                name: 'nama_anggota_4',
                data: null,
                render: data => `${data.nomor_identitas_anggota_4} - ${data.nama_anggota_4} <br> ${data.nama_program_studi_anggota_4}`,
            }, {
                name: 'nama_anggota_5',
                data: null,
                render: data => `${data.nomor_identitas_anggota_5} - ${data.nama_anggota_5} <br> ${data.nama_program_studi_anggota_5}`,
            }, {
                name: '',
                data: 'anggota_beda_kampus',
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
    let endpoint_edit_data = `<?= $base_route ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    
    return `
    <a href="${endpoint_edit_data}" class="me-2" title="Edit">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;
}
<?php endif; ?>
</script>

<section class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h4 class="my-4">Pengajaran</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <div class="row g-3 mb-3">
                    <div class="col-12 col-lg-10 col-xl-11">
                        <!--  -->
                    </div>
                    <div class="col-12 col-lg-2 col-xl-1 d-flex justify-content-end align-items-end">
                        <?php if ($is_access) : ?>
                        <a href="<?= $base_route_pengajaran ?>new" class="btn btn-primary">
                            <i class="fa-solid fa-plus fa-sm"></i> New
                        </a>
                        <?php endif; ?>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTablePengajaran">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kode</th>
                            <th>Nama Mata Kuliah</th>
                            <th>SKS</th>
                            <th>Semester</th>
                            <th>Hari, Jam</th>
                            <th>Ruangan</th>
                            <th>Dosen Pengampu</th>
                            <th>Tautan</th>
                            <th>Dokumen</th>
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
    new DataTable('#myTablePengajaran', {
        ajax: '<?= $get_data_pengajaran ?>',
        processing: true,
        serverSide: true,
        order: [],
        initComplete: function (settings, json) {
            $('#myTablePengajaran').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
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
                data: 'semester',
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
                render: data => data.tautan ? `<a href="${data.tautan}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen ? `<a href="${data.dokumen}" target="_blank">Buka</a>` : '-',
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
    let endpoint_edit_data = `<?= $base_route_pengajaran ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api_pengajaran ?>delete/${data.id}`;
    
    if (data.created_by == '<?= userSession('id') ?>') {
        return `
        <a href="${endpoint_edit_data}" class="me-2" title="Edit">
            <i class="fa-regular fa-pen-to-square fa-lg"></i>
        </a>
        <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
            <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
        </a>`;
    } else {
        return '';
    }
}
<?php endif; ?>
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
