<?php
$get_tahun_laporan = $_GET['tahun_laporan'] ?: date('Y');
$kategori = model('KategoriPenyusutanInventaris')->findAll();
?>

<style>
table tr th { text-align: center; }
</style>

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
                                    <label for="tahun_laporan" class="form-label">Tahun Laporan</label>
                                    <input type="number" min="1900" max="2100" step="1" class="form-control" id="tahun_laporan" name="tahun_laporan" value="<?= $get_tahun_laporan ?>">
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
                                                <label for="kategori" class="form-label">Kategori</label>
                                                <select class="form-select" id="kategori" name="kategori">
                                                    <option value="">Pilih</option>
                                                    <?php foreach ($kategori as $v) : ?>
                                                    <option value="<?= $v['id'] ?>"><?= $v['nama'] ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="invalid_kategori"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nama_barang" class="form-label">Nama Barang</label>
                                                <input type="text" class="form-control" id="nama_barang" name="nama_barang" placeholder="Masukkan nama barang">
                                                <div class="invalid-feedback" id="invalid_nama_barang"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="unit" class="form-label">Unit</label>
                                                <input type="number" class="form-control" id="unit" name="unit" placeholder="Masukkan unit">
                                                <div class="invalid-feedback" id="invalid_unit"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="tahun_perolehan" class="form-label">Tahun Perolehan</label>
                                                <input type="number" min="1900" max="2100" step="1" class="form-control" id="tahun_perolehan" name="tahun_perolehan" placeholder="Masukkan tahun perolehan">
                                                <div class="invalid-feedback" id="invalid_tahun_perolehan"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="umur_ekonomis" class="form-label">Umur Ekonomis <span class="text-secondary">(Tahun)</span></label>
                                                <input type="number" class="form-control" id="umur_ekonomis" name="umur_ekonomis" placeholder="Masukkan umur ekonomis">
                                                <div class="invalid-feedback" id="invalid_umur_ekonomis"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="harga_perolehan" class="form-label">Harga Perolehan</label>
                                                <input type="text" inputmode="numeric" class="form-control" id="harga_perolehan" name="harga_perolehan" placeholder="Masukkan harga perolehan" oninput="this.value = dotsNumber(this.value)">
                                                <div class="invalid-feedback" id="invalid_harga_perolehan"></div>
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
                <div class="table-responsive mt-3">
                    <table class="table table-striped table-hover table-bordered text-nowrap" id="myTable">
                        <thead class="bg-primary-subtle">
                            <tr>
                                <th>No.</th>
                                <th>Nama Barang</th>
                                <th>Unit</th>
                                <th>Tahun <br> Perolehan</th>
                                <th>Umur <br> Ekonomis</th>
                                <th>Penyusutan</th>
                                <th>Harga Perolehan</th>
                                <th>Akumulasi Penyusutan <br> (<?= $get_tahun_laporan - 1 ?>)</th>
                                <th>Beban Penyusutan <br> (<?= $get_tahun_laporan ?>)</th>
                                <th>Akumulasi Penyusutan <br> (<?= $get_tahun_laporan ?>)</th>
                                <th>Nilai Buku</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $grand_total_harga_perolehan = 0;
                            $grand_total_akumulasi_penyusutan_tahun_lalu = 0;
                            $grand_total_beban_penyusutan_tahun_laporan = 0;
                            $grand_total_akumulasi_penyusutan_tahun_laporan = 0;
                            $grand_total_nilai_buku = 0;
                            foreach ($kategori as $v_0) :
                            ?>
                            <tr class="bg-warning-subtle">
                                <td class="text-center fw-500">#</td>
                                <td class="text-center fw-500"><?= $v_0['nama'] ?></td>
                                <td colspan="10"></td>
                            </tr>
                            <?php
                            $penyusutan_inventaris = model('PenyusutanInventaris')->where('id_kategori', $v_0['id'])->findAll();

                            $sub_total_harga_perolehan = 0;
                            $sub_total_akumulasi_penyusutan_tahun_lalu = 0;
                            $sub_total_beban_penyusutan_tahun_laporan = 0;
                            $sub_total_akumulasi_penyusutan_tahun_laporan = 0;
                            $sub_total_nilai_buku = 0;
                            foreach ($penyusutan_inventaris as $key => $v) :
                                if ($v['umur_ekonomis'] > 0) {
                                    $persentase_penyusutan = round(100 / $v['umur_ekonomis'], 1) . '%';
    
                                    $tahun_laporan = $get_tahun_laporan;
                                    $umur_berjalan = $tahun_laporan - $v['tahun_perolehan'] + 1;
    
                                    $akumulasi_penyusutan_tahun_lalu = min($v['harga_perolehan'], ($tahun_laporan - $v['tahun_perolehan']) * ($v['harga_perolehan'] / $v['umur_ekonomis']));
                                    $beban_penyusutan_tahun_laporan = ($umur_berjalan > $v['umur_ekonomis']) ? 0 : ($v['harga_perolehan'] / $v['umur_ekonomis']);
                                    $akumulasi_penyusutan_tahun_laporan = min($v['harga_perolehan'], $umur_berjalan * ($v['harga_perolehan'] / $v['umur_ekonomis']));
                                    $nilai_buku = $v['harga_perolehan'] - $akumulasi_penyusutan_tahun_laporan;
                                } else {
                                    $persentase_penyusutan = $v['umur_ekonomis'] . '%';
    
                                    $akumulasi_penyusutan_tahun_lalu = 0;
                                    $beban_penyusutan_tahun_laporan = 0;
                                    $akumulasi_penyusutan_tahun_laporan = 0;
                                    $nilai_buku = $v['harga_perolehan'];
                                }

                                $sub_total_harga_perolehan += $v['harga_perolehan'];
                                $sub_total_akumulasi_penyusutan_tahun_lalu += $akumulasi_penyusutan_tahun_lalu;
                                $sub_total_beban_penyusutan_tahun_laporan += $beban_penyusutan_tahun_laporan;
                                $sub_total_akumulasi_penyusutan_tahun_laporan += $akumulasi_penyusutan_tahun_laporan;
                                $sub_total_nilai_buku += $nilai_buku;
                            ?>
                            <tr>
                                <td class="text-center"><?= $key+1 ?></td>
                                <td><?= $v['nama_barang'] ?></td>
                                <td class="text-center"><?= $v['unit'] ?></td>
                                <td class="text-center"><?= $v['tahun_perolehan'] ?></td>
                                <td class="text-center"><?= $v['umur_ekonomis'] ?></td>
                                <td class="text-center"><?= $persentase_penyusutan ?></td>
                                <td class="text-end"><?= formatRupiah($v['harga_perolehan']) ?></td>
                                <td class="text-end"><?= formatRupiah($akumulasi_penyusutan_tahun_lalu) ?></td>
                                <td class="text-end"><?= formatRupiah($beban_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end"><?= formatRupiah($akumulasi_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end"><?= formatRupiah($nilai_buku) ?></td>
                                <td>
                                    <a class="me-2" title="Edit" data-bs-toggle="modal" data-bs-target="#edit_<?= $v['id'] ?>">
                                        <i class="fa-regular fa-pen-to-square fa-lg"></i>
                                    </a>
                                    <div class="modal fade" id="edit_<?= $v['id'] ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5">Edit <?= isset($title) ? $title : '' ?></h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form id="form_<?= $v['id'] ?>">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label for="kategori" class="form-label">Kategori</label>
                                                            <select class="form-select" id="kategori" name="kategori">
                                                                <option value="">Pilih</option>
                                                                <?php
                                                                foreach ($kategori as $v_kategori) :
                                                                    $selected = ($v_kategori['id'] == $v['id_kategori']) ? 'selected' : '';
                                                                ?>
                                                                <option value="<?= $v_kategori['id'] ?>" <?= $selected ?>><?= $v_kategori['nama'] ?></option>
                                                                <?php endforeach; ?>
                                                            </select>
                                                            <div class="invalid-feedback" id="invalid_kategori"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="nama_barang" class="form-label">Nama Barang</label>
                                                            <input type="text" class="form-control" id="nama_barang" name="nama_barang" value="<?= $v['nama_barang'] ?>" placeholder="Masukkan nama barang">
                                                            <div class="invalid-feedback" id="invalid_nama_barang"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="unit" class="form-label">Unit</label>
                                                            <input type="number" class="form-control" id="unit" name="unit" value="<?= $v['unit'] ?>" placeholder="Masukkan unit">
                                                            <div class="invalid-feedback" id="invalid_unit"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="tahun_perolehan" class="form-label">Tahun Perolehan</label>
                                                            <input type="number" min="1900" max="2100" step="1" class="form-control" id="tahun_perolehan" name="tahun_perolehan" value="<?= $v['tahun_perolehan'] ?>">
                                                            <div class="invalid-feedback" id="invalid_tahun_perolehan"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="umur_ekonomis" class="form-label">Umur Ekonomis <span class="text-secondary">(Tahun)</span></label>
                                                            <input type="number" class="form-control" id="umur_ekonomis" name="umur_ekonomis" placeholder="Masukkan umur ekonomis" value="<?= $v['umur_ekonomis'] ?>">
                                                            <div class="invalid-feedback" id="invalid_umur_ekonomis"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="harga_perolehan" class="form-label">Harga Perolehan</label>
                                                            <input type="text" inputmode="numeric" class="form-control" id="harga_perolehan" name="harga_perolehan" value="<?= dotsNumber($v['harga_perolehan']) ?>" placeholder="Masukkan harga perolehan" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_harga_perolehan"></div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-primary float-end">Simpan Perubahan</button>
                                                    </div>
                                                </form>
                                                <script>
                                                document.addEventListener('DOMContentLoaded', function() {
                                                    dom('#form_<?= $v['id'] ?>').addEventListener('submit', function(event) {
                                                        event.preventDefault();
                                                        const endpoint = '<?= $base_api ?>update/<?= $v['id'] ?>';
                                                        submitData(dom('#form_<?= $v['id'] ?>'), endpoint);
                                                    });
                                                });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                    <a onclick="deleteData('<?= $base_api ?>delete/<?= $v['id'] ?>')" title="Delete">
                                        <i class="fa-regular fa-trash-can fa-lg text-danger"></i>
                                    </a>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                            <?php
                            $grand_total_harga_perolehan += $sub_total_harga_perolehan;
                            $grand_total_akumulasi_penyusutan_tahun_lalu += $sub_total_akumulasi_penyusutan_tahun_lalu;
                            $grand_total_beban_penyusutan_tahun_laporan += $sub_total_beban_penyusutan_tahun_laporan;
                            $grand_total_akumulasi_penyusutan_tahun_laporan += $sub_total_akumulasi_penyusutan_tahun_laporan;
                            $grand_total_nilai_buku += $sub_total_nilai_buku;
                            ?>
                            <tr>
                                <td></td>
                                <td class="text-center fw-600">Sub Total</td>
                                <td colspan="5" class="text-end fw-600"><?= formatRupiah($sub_total_harga_perolehan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($sub_total_akumulasi_penyusutan_tahun_lalu) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($sub_total_beban_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($sub_total_akumulasi_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($sub_total_nilai_buku) ?></td>
                                <td></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td class="text-center fw-600">Grand Total</td>
                                <td colspan="5" class="text-end fw-600"><?= formatRupiah($grand_total_harga_perolehan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($grand_total_akumulasi_penyusutan_tahun_lalu) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($grand_total_beban_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($grand_total_akumulasi_penyusutan_tahun_laporan) ?></td>
                                <td class="text-end fw-600"><?= formatRupiah($grand_total_nilai_buku) ?></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
.btn-scroll,
.btn-scroll:focus {
    position: fixed;
    bottom: 2%;
    right: 2%;
    transition: .3s;
}
.btn-scroll-to-bottom:hover,
.btn-scroll-to-top:hover {
    bottom: 3%;
}
</style>

<div class="btn-scroll">
    <button class="btn btn-primary btn-scroll-to-top me-1" style="z-index:999;" onclick="window.scrollTo({top: 0, behavior: 'smooth'})">
        <i class="fa-solid fa-arrow-up"></i>
    </button>
    <button class="btn btn-primary btn-scroll-to-bottom" style="z-index:999;" onclick="window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'})">
        <i class="fa-solid fa-arrow-down"></i>
    </button>
</div>
