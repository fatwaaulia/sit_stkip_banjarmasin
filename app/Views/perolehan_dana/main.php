<style>
[data-bs-theme=light] {
    .table-striped > tbody > tr:nth-of-type(odd) > * {
        --bs-table-bg-type: #f9f9f9;
    }
    .table-hover > tbody > tr:hover {
        background-color: #f6f6f6;
    }
}

.table {
    --bs-table-bg: unset;
}

table tr th {
    text-align: center;
    vertical-align: middle;
}
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
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered">
                        <thead class="bg-primary-subtle">
                            <tr>
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Sumber Dana</th>
                                <th rowspan="2">Jenis Dana</th>
                                <th colspan="3">Jumlah Dana (Rp)</th>
                                <th rowspan="2">Jumlah (Rp)</th>
                            </tr>
                            <tr>
                                <th>TS-2</th>
                                <th>TS-1</th>
                                <th>TS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $sumber_dana = [
                                [
                                    'no'   => 1,
                                    'nama' => 'Mahasiswa',
                                ],
                                [
                                    'no'   => 2,
                                    'nama' => 'Kementerian/ Yayasan',
                                ],
                                [
                                    'no'   => 3,
                                    'nama' => 'PT Sendiri',
                                ],
                                [
                                    'no'   => 4,
                                    'nama' => 'Sumber Lain (Dalam dan Luar Negeri)',
                                ],
                                [
                                    'no'   => 5,
                                    'nama' => 'Dana Penelitian dan PKM',
                                ],
                            ];

                            $total_jumlah_ts_2 = 0;
                            $total_jumlah_ts_1 = 0;
                            $total_jumlah_ts_0 = 0;
                            $total_jumlah_ts_sumber_dana = 0;

                            foreach ($sumber_dana as $v) :
                                if (! in_array($v['no'], [1, 2, 3, 4])) continue;
                                $perolehan_dana = model('PerolehanDana')->where('no_sumber_dana', $v['no'])->findAll();
                                $total_data = count($perolehan_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $key => $v2) :
                                    $jumlah_ts_sebaris = $v2['ts_2'] + $v2['ts_1'] + $v2['ts_0'];
                                    $jumlah_ts_2 += $v2['ts_2'];
                                    $jumlah_ts_1 += $v2['ts_1'];
                                    $jumlah_ts_0 += $v2['ts_0'];
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <?php if ($key == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['no_sumber_dana'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_sumber_dana'] ?></td>
                                <?php endif; ?>
                                <td>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-wrap"><?= $v2['nama_jenis_dana'] ?></span>
                                        <a class="me-0" title="Edit" data-bs-toggle="modal" data-bs-target="#edit_<?= $v2['id'] ?>">
                                            <i class="fa-regular fa-pen-to-square fa-lg"></i>
                                        </a>
                                    </div>
                                    <div class="modal fade" id="edit_<?= $v2['id'] ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5">Edit <?= isset($title) ? $title : '' ?></h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form id="form_<?= $v2['id'] ?>">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Sumber Dana</label>
                                                            <input type="text" class="form-control" value="<?= $v2['nama_sumber_dana'] ?>" disabled>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Jenis Dana</label>
                                                            <input type="text" class="form-control" value="<?= $v2['nama_jenis_dana'] ?>" disabled>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS-2</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_2" value="<?= dotsNumber($v2['ts_2']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_2"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS-1</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_1" value="<?= dotsNumber($v2['ts_1']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_1"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_0" value="<?= dotsNumber($v2['ts_0']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_0"></div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-primary float-end">Simpan Perubahan</button>
                                                    </div>
                                                </form>
                                                <script>
                                                document.addEventListener('DOMContentLoaded', function() {
                                                    dom('#form_<?= $v2['id'] ?>').addEventListener('submit', function(event) {
                                                        event.preventDefault();
                                                        const endpoint = '<?= $base_api ?>update/<?= $v2['id'] ?>';
                                                        submitData(dom('#form_<?= $v2['id'] ?>'), endpoint);
                                                    });
                                                });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center"><?= dotsNumber($v2['ts_2']) ?></td>
                                <td class="text-center"><?= dotsNumber($v2['ts_1']) ?></td>
                                <td class="text-center"><?= dotsNumber($v2['ts_0']) ?></td>
                                <td class="text-center"><?= dotsNumber($jumlah_ts_sebaris) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <?php
                            $total_jumlah_ts_2 += $jumlah_ts_2;
                            $total_jumlah_ts_1 += $jumlah_ts_1;
                            $total_jumlah_ts_0 += $jumlah_ts_0;
                            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;
                            ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_2) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_1) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_0) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_sumber_dana) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Total (1 + 2 + 3 + 4)</td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_2) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_1) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_0) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_sumber_dana) ?></td>
                            </tr>

                            <?php
                            foreach ($sumber_dana as $v) :
                                if ($v['no'] != 5) continue;
                                $perolehan_dana = model('PerolehanDana')->where('no_sumber_dana', $v['no'])->findAll();
                                $total_data = count($perolehan_dana);
                                $jumlah_ts_2 = 0;
                                $jumlah_ts_1 = 0;
                                $jumlah_ts_0 = 0;
                                $jumlah_ts_sumber_dana = 0;
                                foreach ($perolehan_dana as $key => $v2) :
                                    $jumlah_ts_sebaris = $v2['ts_2'] + $v2['ts_1'] + $v2['ts_0'];
                                    $jumlah_ts_2 += $v2['ts_2'];
                                    $jumlah_ts_1 += $v2['ts_1'];
                                    $jumlah_ts_0 += $v2['ts_0'];
                                    $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;
                            ?>
                            <tr>
                                <?php if ($key == 0) : ?>
                                <td rowspan="<?= $total_data ?>" class="text-center align-middle"><?= $v2['no_sumber_dana'] ?></td>
                                <td rowspan="<?= $total_data ?>" class="text-wrap text-center align-middle"><?= $v2['nama_sumber_dana'] ?></td>
                                <?php endif; ?>
                                <td>
                                    <div class="d-flex justify-content-between">
                                        <span class="text-wrap"><?= $v2['nama_jenis_dana'] ?></span>
                                        <a class="me-0" title="Edit" data-bs-toggle="modal" data-bs-target="#edit_<?= $v2['id'] ?>">
                                            <i class="fa-regular fa-pen-to-square fa-lg"></i>
                                        </a>
                                    </div>
                                    <div class="modal fade" id="edit_<?= $v2['id'] ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5">Edit <?= isset($title) ? $title : '' ?></h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form id="form_<?= $v2['id'] ?>">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Sumber Dana</label>
                                                            <input type="text" class="form-control" value="<?= $v2['nama_sumber_dana'] ?>" disabled>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Jenis Dana</label>
                                                            <input type="text" class="form-control" value="<?= $v2['nama_jenis_dana'] ?>" disabled>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS-2</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_2" value="<?= dotsNumber($v2['ts_2']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_2"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS-1</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_1" value="<?= dotsNumber($v2['ts_1']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_1"></div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">TS</label>
                                                            <input type="text" inputmode="numeric" class="form-control" name="ts_0" value="<?= dotsNumber($v2['ts_0']) ?>" placeholder="0" oninput="this.value = dotsNumber(this.value)">
                                                            <div class="invalid-feedback" id="invalid_ts_0"></div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-primary float-end">Simpan Perubahan</button>
                                                    </div>
                                                </form>
                                                <script>
                                                document.addEventListener('DOMContentLoaded', function() {
                                                    dom('#form_<?= $v2['id'] ?>').addEventListener('submit', function(event) {
                                                        event.preventDefault();
                                                        const endpoint = '<?= $base_api ?>update/<?= $v2['id'] ?>';
                                                        submitData(dom('#form_<?= $v2['id'] ?>'), endpoint);
                                                    });
                                                });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center"><?= dotsNumber($v2['ts_2']) ?></td>
                                <td class="text-center"><?= dotsNumber($v2['ts_1']) ?></td>
                                <td class="text-center"><?= dotsNumber($v2['ts_0']) ?></td>
                                <td class="text-center"><?= dotsNumber($jumlah_ts_sebaris) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <?php
                            $total_jumlah_ts_2 += $jumlah_ts_2;
                            $total_jumlah_ts_1 += $jumlah_ts_1;
                            $total_jumlah_ts_0 += $jumlah_ts_0;
                            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;
                            ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Jumlah</td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_2) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_1) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_0) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($jumlah_ts_sumber_dana) ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr>
                                <td></td>
                                <td colspan="2" class="fw-600 text-center">Total</td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_2) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_1) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_0) ?></td>
                                <td class="fw-600 text-center"><?= dotsNumber($total_jumlah_ts_sumber_dana) ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
