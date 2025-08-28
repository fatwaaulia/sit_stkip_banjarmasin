<?php
$tahun_akademik_aktif = model('TahunAkademik')->orderBy('periode_selesai DESC')->first();

if ($tahun_akademik_aktif) {
    $tahun_akademik_aktif = $tahun_akademik_aktif['tahun_akademik'] . ' - ' . $tahun_akademik_aktif['tipe'];
} else {
    $tahun_akademik_aktif = 'Libur';
}
?>

<style>
table tr { font-weight: 600; }

table tr td { padding: 6px; }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card mt-4 bg-primary-subtle">
                <div class="card-body d-flex justify-content-between">
                    <h5 class="mb-0"><?= $tahun_akademik_aktif ?></h5>
                    <h5 class="mb-0"><?= dateFormatter(date('d-m-Y'), 'cccc, d MMMM yyyy') ?></h5>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
console.log(Intl.DateTimeFormat().resolvedOptions().timeZone);

</script>