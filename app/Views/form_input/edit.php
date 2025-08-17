<?php
use Config\App;
?>

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
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="mb-3">
                                    <label for="gambar" class="form-label">Gambar</label>
                                    <div class="col-md-6 position-relative">
                                        <img src="<?= webFile('image', $base_name, $data['gambar'], $data['updated_at']) ?>" class="w-100 cover-center" id="frame_gambar">
                                        <div class="position-absolute" style="bottom: 0px; right: 0px;">
                                            <label for="gambar" class="btn btn-secondary rounded-circle" style="padding: 8px;">
                                                <i class="fa-solid fa-camera fa-lg"></i>
                                            </label>
                                            <input type="file" class="form-control d-none" id="gambar" name="gambar" accept=".png,.jpg,.jpeg" onchange="dom('#frame_gambar').src = window.URL.createObjectURL(this.files[0]);">
                                        </div>
                                    </div>
                                    <div class="invalid-feedback" id="invalid_gambar"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="gambar" class="form-label">Gambar Multiple</label>
                                    <input type="file" class="form-control" id="gambar_multiple" name="gambar_multiple[]" accept=".png,.jpg,.jpeg" multiple>
                                    <div id="preview_gambar_multiple" class="gap-3" style="display: flex; flex-wrap: wrap;"></div>
                                    <textarea class="form-control d-none" id="default_images_save" name="default_images_save"><?= ($data['gambar_multiple']) ?></textarea>
                                    <textarea class="form-control d-none" id="default_images_delete" name="default_images_delete"></textarea>
                                    <script>
                                    let files_list = [];
                                    const default_images_save = <?= ($data['gambar_multiple']) ?: '[]' ?>;

                                    dom('#gambar_multiple').addEventListener('change', async () => {
                                    const new_files = Array.from(dom('#gambar_multiple').files);
                                    files_list = files_list.concat(new_files);
                                        await previewGambarMultiple();
                                        updateInputFiles();
                                    });

                                    function readFileAsDataURL(file) {
                                        return new Promise((resolve) => {
                                            const reader = new FileReader();
                                            reader.onload = e => resolve(e.target.result);
                                            reader.readAsDataURL(file);
                                        });
                                    }

                                    function deleteOld(i, src) {
                                        default_images_save.splice(i, 1);
                                        let arr = dom('#default_images_delete').innerHTML ? JSON.parse(dom('#default_images_delete').innerHTML) : [];
                                        arr.push(src);
                                        dom('#default_images_delete').innerHTML = JSON.stringify(arr);
                                        previewGambarMultiple();
                                        updateInputFiles();
                                    }

                                    function deleteNew(i) {
                                        files_list.splice(i, 1);
                                        previewGambarMultiple();
                                        updateInputFiles();
                                    }

                                    document.addEventListener('DOMContentLoaded', () => {
                                        previewGambarMultiple();
                                    });

                                    async function previewGambarMultiple() {
                                        dom('#default_images_save').innerHTML = JSON.stringify(default_images_save);
                                        const preview = dom('#preview_gambar_multiple');

                                        preview.innerHTML = '';
                                        default_images_save.forEach((src, i) => {
                                            preview.innerHTML += `
                                            <div class="position-relative">
                                                <img src="<?= config(App::class)->webfileURL ?>form_input/${src}" class="wh-150 cover-center">
                                                <button type="button" data-default-index="${i}" class="position-absolute btn rounded-circle" style="top: 0; right: 0;" onclick="deleteOld(${i}, '${src}')">
                                                    <i class="fa-solid fa-xmark"></i>
                                                </button>
                                            </div>`;
                                        });
                                        
                                        for (let i = 0; i < files_list.length; i++) {
                                            const file = files_list[i];
                                            const url = await readFileAsDataURL(file);
                                            preview.innerHTML += `
                                            <div class="position-relative">
                                                <img src="${url}" class="wh-150 cover-center">
                                                <button type="button" class="position-absolute btn rounded-circle" style="top: 0; right: 0;" onclick="deleteNew(${i})">
                                                    <i class="fa-solid fa-xmark"></i>
                                                </button>
                                            </div>`;
                                        }
                                    }

                                    function updateInputFiles() {
                                        const dt = new DataTransfer();
                                        files_list.forEach(file => dt.items.add(file));
                                        dom('#gambar_multiple').files = dt.files;
                                    }
                                    </script>
                                </div>
                                <div class="mb-3">
                                    <label for="nama" class="form-label">Nama</label>
                                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $data['nama'] ?>" placeholder="Masukkan nama">
                                    <div class="invalid-feedback" id="invalid_nama"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="harga" class="form-label">Harga</label>
                                    <div class="input-group">
                                        <span class="input-group-text">Rp</span>
                                        <input type="text" inputmode="numeric" class="form-control" id="harga" name="harga" value="<?= dotsNumber(abs($data['harga'])) ?>" placeholder="Masukkan harga" oninput="this.value = dotsNumber(this.value)">
                                    </div>
                                    <div class="invalid-feedback" id="invalid_harga"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="deskripsi" class="form-label">Deskripsi</label>
                                    <textarea class="form-control" id="deskripsi" name="deskripsi" rows="3" placeholder="Masukkan deskripsi"><?= $data['deskripsi'] ?></textarea>
                                    <div class="invalid-feedback" id="invalid_deskripsi"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="dokumen_pendukung" class="form-label">Dokumen Pendukung</label>
                                    <input type="file" class="form-control" id="dokumen_pendukung" name="dokumen_pendukung" accept="application/pdf">
                                    <div class="form-text">
                                        Maksimal 2 mb, pdf
                                    </div>
                                    <div class="invalid-feedback" id="invalid_dokumen_pendukung"></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="mb-2">
                                    <span class="fw-600">Waktu</span>
                                </div>
                                <div class="mb-3">
                                    <label for="tanggal_kegiatan" class="form-label">Tanggal Kegiatan</label>
                                    <input type="datetime-local" class="form-control" id="tanggal_kegiatan" name="tanggal_kegiatan" value="<?= $data['tanggal_kegiatan'] ?>">
                                    <div class="invalid-feedback" id="invalid_tanggal_kegiatan"></div>
                                </div>
                                <div class="mb-2">
                                    <span class="fw-600">Pilihan</span>
                                </div>
                                <div class="mb-3">
                                    <label for="select_multiple" class="form-label">Select Multiple</label>
                                    <select id="select_multiple" name="select_multiple[]" multiple>
                                        <option value="">Pilih</option>
                                        <?php
                                        $multiple = ['Satu', 'Dua', 'Tiga', 'Empat', 'Lima', 'Enam', 'Tujuh', 'Delapan', 'Sembilan', 'Sepuluh'];
                                        $selected = (array)json_decode($data['select_multiple']);
                                        foreach ($multiple as $v) :
                                        ?>
                                        <option value="<?= $v ?>" <?= in_array($v, $selected) ? 'selected' : '' ?>>
                                            <?= $v ?>
                                        </option>
                                        <?php endforeach; ?>
                                    </select>
                                    <div class="invalid-feedback" id="invalid_select_multiple"></div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Checkbox</label>
                                    <?php
                                    $checkbox = ['checkbox 1', 'checkbox 2', 'checkbox 3'];
                                    foreach($checkbox as $v) :
                                        $checked = (in_array($v, (array)json_decode($data['checkbox'], true))) ? 'checked' : '';
                                    ?>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="<?= $v ?>" name="checkbox[]" value="<?= $v ?>" <?= $checked ?>>
                                        <label class="form-check-label" for="<?= $v ?>"><?= $v ?></label>
                                    </div>
                                    <?php endforeach; ?>
                                    <div class="invalid-feedback" id="invalid_checkbox"></div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Persetujuan</label>
                                    <?php
                                    $persetujuan = ['Iya', 'Tidak'];
                                    foreach($persetujuan as $v) :
                                        $checked = ($v == $data['persetujuan']) ? 'checked' : '';
                                    ?>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="<?= $v ?>" name="persetujuan" value="<?= $v ?>" <?= $checked ?>>
                                        <label class="form-check-label" for="<?= $v ?>">
                                            <?= $v ?>
                                        </label>
                                    </div>
                                    <?php endforeach; ?>
                                    <div class="invalid-feedback" id="invalid_persetujuan"></div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3 float-end">Simpan Perubahan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
dselect(dom('#select_multiple'), { search: true, });
</script>

<script>
dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
    const endpoint = '<?= $base_api ?>update/<?= $data['id'] ?>';
    submitData(dom('#form'), endpoint);
});
</script>
