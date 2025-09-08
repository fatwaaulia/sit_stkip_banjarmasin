<section class="container-fluid min-vh-100" style="background:radial-gradient(circle at 30% 30%,#66c28a 0%,#00993c 55%,#005c24 100%);">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-md-6 col-lg-9 col-xl-8">
                                <h4><?= isset($title) ? $title : '' ?></h4>
                            </div>
                            <div class="col-12 col-md-6 col-lg-3 col-xl-4">
                                <div class="text-end">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#lacakPermintaan">Lacak Permintaan</a>
                                </div>
                                <div class="modal fade" id="lacakPermintaan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Lacak Permintaan</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form action="<?= base_url() ?>permintaan-legalisir/detail" method="get">
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="email" class="form-label">Email</label>
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Masukkan email Anda" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                                    <button type="submit" class="btn btn-primary">Cari Sekarang</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr style="border: 1px solid #eee">
                        <form id="form">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="nama" class="form-label">Nama Lengkap</label>
                                        <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama pendaftar">
                                        <div class="invalid-feedback" id="invalid_nama"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="name@gmail.com">
                                        <div class="invalid-feedback" id="invalid_email"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp" class="form-label">No. HP</label>
                                        <input type="number" class="form-control" id="no_hp" name="no_hp" placeholder="08xx">
                                        <div class="invalid-feedback" id="invalid_no_hp"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="tautan" class="form-label">Tautan Ijazah</label>
                                        <input type="text" class="form-control" id="tautan" name="tautan" placeholder="Masukkan tautan ijazah Anda">
                                        <div class="invalid-feedback" id="invalid_tautan"></div>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" name="persetujuan" value="true" id="checkDefault">
                                        <label class="form-check-label" for="checkDefault">
                                            Saya memastikan bawah data diatas telah benar.
                                        </label>
                                        <div class="invalid-feedback" id="invalid_persetujuan"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3 float-end">
                                <button type="submit" class="btn btn-primary">Kirim</button>
                            </div>
                        </form>
                        <script>
                        dom('#form').addEventListener('submit', function(event) {
                            event.preventDefault();
                            const endpoint = '<?= base_url() ?>api/permintaan-legalisir/create';
                            submitData(dom('#form'), endpoint);
                        });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
