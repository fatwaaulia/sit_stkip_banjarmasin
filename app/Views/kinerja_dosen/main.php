<?php
$get_dosen = $_GET['dosen'] ?? '';
$get_tanggal_awal = $_GET['tanggal_awal'] ?? '';
$get_tanggal_akhir = $_GET['tanggal_akhir'] ?? '';
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
                        <?php if (array_intersect(userSession('id_roles'), [1, 17, 7])) : ?>
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-5 col-lg-5 col-xl-4">
                                    <label for="dosen" class="form-label">Dosen</label>
                                    <select id="dosen" name="dosen">
                                        <option value="">Pilih</option>
                                        <?php
                                        $dosen = [];
                                        if (in_array(userSession('id'), [1, 17, 7])) {
                                            $dosen = model('Users')->where('id_role', 4)->findAll();
                                        } elseif (in_array(8, userSession('id_roles'))) {
                                            $dosen = model('Users')->where('id_program_studi', userSession('id_program_studi'))->findAll();
                                        }
                                        foreach ($dosen as $v) :
                                            $selected = ($v['id'] == $get_dosen) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $v['id'] ?>" <?= $selected ?>>
                                            <?= $v['nomor_identitas'] ?> - <?= $v['nama'] ?> - <?= $v['nama_program_studi'] ?>
                                        </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xl-3">
                                    <label for="tanggal_awal" class="form-label">Tanggal Awal</label>
                                    <input type="date" class="form-control" id="tanggal_awal" name="tanggal_awal" value="<?= $get_tanggal_awal ?>">
                                </div>
                                <div class="col-6 col-md-5 col-lg-4 col-xl-3">
                                    <label for="tanggal_akhir" class="form-label">Tanggal Akhir</label>
                                    <input type="date" class="form-control" id="tanggal_akhir" name="tanggal_akhir" value="<?= $get_tanggal_akhir ?>">
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
                        <!--  -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <div class="card p-3">
                <h4>1. Tri Dharma</h4>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTableTriDharma">
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
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <div class="card p-3">
                <h4>2. Pengajaran</h4>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTablePengajaran">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Kode</th>
                            <th>Nama Mata Kuliah</th>
                            <th>SKS</th>
                            <th>Hari, Jam</th>
                            <th>Ruangan</th>
                            <th>Dosen Pengampu</th>
                            <th>Tautan</th>
                            <th>Dokumen</th>
                            <th>Program Studi</th>
                            <th>Tahun Akademik</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <div class="card p-3">
                <h4>3. Pengembangan Kompetensi</h4>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTablePengembanganKompetensi">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>Judul</th>
                            <th>Tautan</th>
                            <th>Dokumen</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTableTriDharma', {
        ajax: '<?= base_url() ?>api/kinerja-dosen/tri-dharma?dosen=<?= $get_dosen ?>&tanggal_awal=<?= $get_tanggal_awal ?>&tanggal_akhir=<?= $get_tanggal_akhir ?>',
        processing: true,
        serverSide: true,
        order: [],
        searching: false,
        initComplete: function (settings, json) {
            $('#myTriDharma').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
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
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTablePengajaran', {
        ajax: '<?= base_url() ?>api/kinerja-dosen/pengajaran?dosen=<?= $get_dosen ?>&tanggal_awal=<?= $get_tanggal_awal ?>&tanggal_akhir=<?= $get_tanggal_akhir ?>',
        processing: true,
        serverSide: true,
        order: [],
        searching: false,
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
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#myTablePengembanganKompetensi', {
        ajax: '<?= base_url() ?>api/kinerja-dosen/pengembangan-kompetensi?dosen=<?= $get_dosen ?>&tanggal_awal=<?= $get_tanggal_awal ?>&tanggal_akhir=<?= $get_tanggal_akhir ?>',
        processing: true,
        serverSide: true,
        order: [],
        searching: false,
        initComplete: function (settings, json) {
            $('#myTablePengembanganKompetensi').wrap('<div style="overflow: auto; width: 100%; position: relative;"></div>');
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
                name: 'judul',
                data: 'judul',
            }, {
                name: '',
                data: null,
                render: data => data.tautan ? `<a href="${data.tautan}" target="_blank">Buka</a>` : '-',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen ? `<a href="${data.dokumen}" target="_blank">Buka</a>` : '-',
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
