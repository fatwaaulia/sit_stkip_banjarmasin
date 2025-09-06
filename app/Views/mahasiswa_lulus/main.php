<?php
$get_program_studi = $_GET['program_studi'] ?? '';
$get_tahun_akademik_lulus = $_GET['tahun_akademik_lulus'] ?? '';
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
                    <div class="col-12 col-lg-10 col-xl-10">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
                                <div class="col-12 col-md-6 col-lg-5 col-xl-4">
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
                                <div class="col-12 col-md-6 col-lg-5 col-xl-4">
                                    <label for="tahun_akademik_lulus" class="form-label">Tahun Akademik Lulus</label>
                                    <select class="form-select" id="tahun_akademik_lulus" name="tahun_akademik_lulus">
                                        <option value="">Semua</option>
                                        <?php
                                        $tahun_akademik_lulus = model('TahunAkademik')->orderBy('id DESC')->findAll();
                                        foreach ($tahun_akademik_lulus as $v) :
                                            $selected = ($v['id'] == $get_tahun_akademik_lulus) ? 'selected' : '';
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
                    <div class="col-12 col-lg-2 col-xl-2 d-flex justify-content-end align-items-end">
                        <!--  -->
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Program Studi</th>
                            <th>Mulai Kuliah</th>
                            <th>Selesai Kuliah</th>
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
                render: data => `${data.tahun_akademik_diterima} - ${data.tipe_tahun_akademik}`,
            }, {
                name: '',
                data: null,
                render: data => `${data.tahun_akademik_lulus} - ${data.tipe_tahun_akademik_lulus}`,
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });
});

function renderOpsi(data) {
    return `
    <a href="<?= $base_route ?>detail/${data.id}" class="me-2" title="Detail">
        <i class="fa-solid fa-circle-info fa-lg"></i>
    </a>`;
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>
