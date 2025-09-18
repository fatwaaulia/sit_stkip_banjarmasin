<?php
$is_access = false;
if (array_intersect(userSession('id_roles'), [4])) {
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
    <?php if (in_array(8, userSession('id_roles'))) : ?>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-primary">
                Sebagai Kaprodi, Anda dapat melihat semua data dosen <span class="fw-500"><?= userSession('nama_program_studi') ?></span>
            </div>
        </div>
    </div>
    <?php endif; ?>
    <div class="row">
        <div class="col-12">
            <div class="card p-3">
                <div class="row g-3 mb-3">
                    <div class="col-12 col-lg-10 col-xl-11">
                        <?php if (array_intersect(userSession('id_roles'), [1, 17, 7, 8])) : ?>
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
                                <?php if (in_array(8, userSession('id_roles'))) : ?>
                                <div class="col-6 col-md-5 col-lg-4 col-xl-3 d-flex justify-content-bottom align-items-end">
                                    <?php if ($get_dosen != userSession('id')) : ?>
                                    <a href="<?= $base_route ?>?dosen=<?= userSession('id') ?>" class="btn btn-primary">Lihat Data Saya</a>
                                    <?php else : ?>
                                    <a href="<?= $base_route ?>" class="btn btn-primary">Lihat Semua Data Dosen</a>
                                    <?php endif; ?>
                                </div>
                                <?php endif; ?>
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
                            <th>Judul</th>
                            <th>Tautan</th>
                            <th>Dokumen</th>
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
