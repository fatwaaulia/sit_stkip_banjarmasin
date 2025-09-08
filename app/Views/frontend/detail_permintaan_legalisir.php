<section class="container-fluid min-vh-100" style="background:radial-gradient(circle at 30% 30%,#66c28a 0%,#00993c 55%,#005c24 100%);">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h4><?= isset($title) ? $title : '' ?></h4>
                            </div>
                        </div>
                        <hr style="border: 1px solid #eee">
                        <form id="form">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="nama" class="form-label">Nama Lengkap</label>
                                        <input type="text" class="form-control" id="nama" value="<?= $data['nama'] ?>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" value="<?= $data['email'] ?>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label for="no_hp" class="form-label">No. HP</label>
                                        <input type="number" class="form-control" id="no_hp" value="<?= $data['no_hp'] ?>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label for="tautan" class="form-label">
                                            Tautan Ijazah
                                            <a href="<?= $data['tautan'] ?>" target="_blank">Buka</a>
                                        </label>
                                        <input type="text" class="form-control" id="tautan" value="<?= $data['tautan'] ?>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Tanggal Permintaan</label>
                                        <input type="text" class="form-control" value="<?= date('d-m-Y H:i:s', strtotime(userLocalTime($data['created_at']))) ?>" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <input type="text" class="form-control" value="<?= $data['status'] ?>" disabled>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
