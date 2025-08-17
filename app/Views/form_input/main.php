<?php
$get_tanggal_awal = $_GET['tanggal_awal'] ?? '';
$get_tanggal_akhir = $_GET['tanggal_akhir'] ?? '';
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
                    <div class="col-12 col-lg-10 col-xl-11">
                        <form action="" method="get">
                            <div class="row gx-2 gy-3">
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
                    </div>
                    <div class="col-12 col-lg-2 col-xl-1 d-flex justify-content-end align-items-end">
                        <a href="<?= $base_route ?>new" class="btn btn-primary">
                            <i class="fa-solid fa-plus fa-sm"></i> New
                        </a>
                    </div>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-12">
                        <button class="btn btn-outline-success me-2" id="btn_export_excel" onclick="unduhFile(this)">
                            <i class="fa-solid fa-arrow-up fa-sm"></i> Export Excel
                        </button>
                        <a id="unduh_pdf" target="_blank" class="btn btn-outline-success">
                            <i class="fa-solid fa-print fa-sm"></i> Cetak PDF
                        </a>
                    </div>
                </div>
                <table class="display nowrap" id="myTable">
                    <thead class="bg-primary-subtle">
                        <tr>
                            <th>No.</th>
                            <th>
                                <input class="form-check-input fa-lg" type="checkbox" id="checked_all" style="cursor:pointer;">
                            </th>
                            <th>Kode</th>
                            <th>Gambar</th>
                            <th>Nama</th>
                            <th>Harga</th>
                            <th>Dokumen Pendukung</th>
                            <th>Tanggal Kegiatan</th>
                            <th>Select Multiple</th>
                            <th>Checkbox</th>
                            <th>Persetujuan</th>
                            <th>Created At</th>
                            <th>Created By</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                </table>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-primary" onclick="submitCheckedBox()">
                            Get ID Checkbox
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
// Checked
document.addEventListener('DOMContentLoaded', () => boxCheckedAll());
async function boxCheckedAll() {
    const session_checked_id = JSON.parse(sessionStorage.getItem('checked_id')) || [];
    const { data } = await (await fetch('<?= $base_api ?>')).json();

    if (session_checked_id.length == data.length) {
        dom('#checked_all').checked = true;
    } else {
        dom('#checked_all').checked = false;
    }
}

function itemChecked(el) {
    let session_checked_id = JSON.parse(sessionStorage.getItem('checked_id')) || [];

    if (el.checked) {
        if (!session_checked_id.includes(el.value)) session_checked_id.push(el.value);
    } else {
        session_checked_id = session_checked_id.filter(id => id !== el.value);
    }

    sessionStorage.setItem('checked_id', JSON.stringify(session_checked_id));
    boxCheckedAll();
}

function submitCheckedBox() {
    const session_checked_id = sessionStorage.getItem('checked_id');
    console.log(session_checked_id);

    // Lakukan Proses Backend Disini
}
// End | Checked

document.addEventListener('DOMContentLoaded', function() {
    const table = new DataTable('#myTable', {
        ajax: {
            url: '<?= $get_data ?>',
            data: query => {
                let url = `<?= $get_data . (!empty($_GET) ? '&' : '?') ?>${ $.param(query) }`;
                url = url.replace(/start=\d+&length=\d+/, 'start=0&length=0');

                const btn_export_excel = dom('#btn_export_excel');
                btn_export_excel.dataset.url = url.replace('/?', '/export-excel?');
                btn_export_excel.dataset.filename = 'form_input.xlsx';

                const url_unduh_pdf = `<?= $base_route ?>unduh-pdf${new URL(url).search}`;
                dom('#unduh_pdf').href = url_unduh_pdf;
            }
        },
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
                }
            }, {
                name: 'kode',
                data: 'kode',
            }, {
                name: '',
                data: null,
                render: data => `<img data-src="${data.gambar}" class="wh-40 cover-center lazy-shimmer">`,
            }, {
                name: 'nama',
                data: 'nama',
            }, {
                name: 'harga',
                data: 'harga',
            }, {
                name: '',
                data: null,
                render: data => data.dokumen_pendukung ? `<a href="${data.dokumen_pendukung}" target="_blank">Lihat Dokumen</a>` : ''
            }, {
                name: '',
                data: 'tanggal_kegiatan',
            }, {
                name: '',
                data: 'select_multiple',
            }, {
                name: '',
                data: 'checkbox',
            }, {
                name: 'persetujuan',
                data: 'persetujuan',
            }, {
                name: '',
                data: 'created_at',
            }, {
                name: '',
                data: 'created_by',
            }, {
                name: '',
                data: null,
                render: renderOpsi,
            },
        ].map(col => ({ ...col, orderable: col.name !== '' })),
    });

    // Checked All
    dom('#checked_all').addEventListener('click', async function () {
        try {
            const rows = table.rows({ search: 'applied' }).nodes();
            Array.from(rows).forEach(row => {
                const box = row.querySelector('input[type="checkbox"]');
                box.checked = this.checked;
            });

            if (this.checked) {
                const { data } = await (await fetch('<?= $base_api ?>')).json();
                const session_checked_id = data.map(item => item.id);

                sessionStorage.setItem('checked_id', JSON.stringify(session_checked_id));
            } else {
                sessionStorage.removeItem('checked_id');
            }
        } catch (error) {
            console.error('Error:', error);
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
    // End | Checked All

    // Klik 2x untuk edit data
    dom('#myTable').addEventListener('dblclick', function(e) {
        const cell = e.target;
        if (cell.tagName !== 'TD') return;

        const editableColumns = [4];

        if (editableColumns.includes(cell.cellIndex)) {
            const input = document.createElement('input');
            input.type = 'text';
            input.value = cell.innerText;
            input.className = 'form-control';

            cell.innerHTML = '';
            cell.appendChild(input);
            input.focus();

            let is_updated = false;
            input.onblur = input.onkeydown = function(e) {
                const id = table.row(cell.parentNode).data().id;

                if (! is_updated) {
                    if (e.type === 'blur' || e.key === 'Enter') {
                        update(id);
                        is_updated = true;
                    }
                }
            };

            async function update(id) {
                is_updated = false;
                try {
                    const [detail_response] = await Promise.all([
                        fetch(`<?= $base_api ?>detail/${id}`),
                    ]);
                    const detail = (await detail_response.json()).data;

                    const column = table.settings()[0].oInit.columns[cell.cellIndex].data;
                    let get_old_value = detail[column];
                    let get_new_value = input.value;

                    if (get_old_value == get_new_value) {
                        cell.innerText = get_old_value;
                        return;
                    } else {
                        cell.innerHTML = `<div class="spinner-border spinner-border-sm text-primary"></div>`;
                    }

                    detail[column] = get_new_value;
                    detail['gambar'] = '';
                    detail['dokumen_pendukung'] = '';

                    const endpoint = `<?= $base_api ?>update/${id}`;
                    const response = await fetch(endpoint, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(detail),
                    });

                    const data = await response.json();

                    if (['success', 'error'].includes(data.status)) {
                        cell.innerText = (data.status == 'success') ? get_new_value : get_old_value;
                        if (data.status != 'success') detail[column] = get_old_value;

                        await Swal.fire({
                            icon: data.status,
                            title: (data.status == 'success') ? data.message :  data.errors[Object.keys(data.errors)[0]],
                            showConfirmButton: false,
                            timer: 2500,
                            timerProgressBar: true,
                        });
                    } else {
                        await Swal.fire({
                            icon: 'error',
                            title: data.message,
                            showConfirmButton: false,
                        });
                    }
                } catch (error) {
                    console.error('Error:', error);
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
        }
    });
    // END | Klik 2x untuk edit data
});

function renderOpsi(data) {
    let endpoint_detail_data = `<?= $base_api ?>detail/${data.id}`;
    let endpoint_edit_data = `<?= $base_route ?>edit/${data.id}`;
    let endpoint_hapus_data = `<?= $base_api ?>delete/${data.id}`;
    return `
    <a href="${endpoint_detail_data}" class="me-2" title="Detail">
        <i class="fa-regular fa-eye fa-lg text-info"></i>
    </a>
    <a href="${endpoint_edit_data}" class="me-2" title="Edit">
        <i class="fa-regular fa-pen-to-square fa-lg"></i>
    </a>
    <a onclick="deleteData('${endpoint_hapus_data}')" title="Delete">
        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
    </a>`;
}
</script>

<script src="<?= base_url() ?>assets/modules/datatables/js/dataTables.min.js"></script>

<!--------------------------------------------------------------
# Faker
--------------------------------------------------------------->
<?php
// $faker = \Faker\Factory::create('id_ID');
// $data = [
    //     'image'   => 'https://unsplash.it/400/200?random=' . rand(),
//     'name'    => $faker->name,
//     'random'  => str_replace('.', '', $faker->sentence(mt_rand(2, 5))),
//     'tanggal' => date('Y-m-d', rand(strtotime('2024-12-15'), strtotime('2025-05-15'))),
// ];

// print_r($data);
?>

<!--------------------------------------------------------------
# JSON
--------------------------------------------------------------->
<section class="container-fluid mt-4">
    <div class="row">
        <div class="col-12">
            <?php
            $json_ttd = '{"1":{"nama":"Fatwa","status":"Disetujui","at":"2025-07-01 19:33:17"}}';
            $json_ttd = json_decode($json_ttd, true);
            print_r($json_ttd);
            echo '<br><br>';

            $id_user = '2';
            $json_ttd[$id_user]['nama'] = 'Aulia';
            $json_ttd[$id_user]['status'] = 'Menunggu Persetujuan';
            $json_ttd[$id_user]['at'] = DATE('Y-m-d H:i:s');

            // unset($json_ttd['1']); // Untuk Hapus Item JSON

            $json_ttd = json_encode($json_ttd);
            print_r($json_ttd);
            ?>
        </div>
    </div>
</section>