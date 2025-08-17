<style>
.table-bordered,
.table-bordered tr,
.table-bordered th,
.table-bordered td {
    border: 2px solid black;
    border-collapse: collapse;
}
table th,
table td {
    padding: 0 10px;
}


html { font-size: 12px; }
h1 { font-size: calc(2.5rem - 1px); }
h2 { font-size: calc(2rem - 1px); }
h3 { font-size: calc(1.75rem - 1px); }
h4 { font-size: calc(1.5rem - 1px); }
h5 { font-size: calc(1.25rem - 1px); }
h6 { font-size: calc(1rem); }

table, tr, th, td, div, h1, h2, h3, h4, h5, h6, p, span {
    font-family:  sans-serif!important;

}
</style>

<?php
$logo_path = FCPATH . 'assets/uploads/app_settings/logo.png';
$logo = base64_encode(file_get_contents($logo_path));

?>

<table style="width: 100%;">
    <tr>
        <td width="25%">
            <img src="data:image/jpeg;base64, <?= $logo ?>" width="100%">
        </td>
        <td width="75%" style="text-align: center;">
            <h4>
                <strong style="border: 1px solid #3a87c9; border-radius: 8px; padding: 8px 80px;">
                    FORMULIR
                </strong>
            </h4>
        </td>
    </tr>
</table>

<table style="width: 100%; margin-top: 20px;">
    <tr>
        <td width="50%">
            <div style="line-height: 1.5;">
                <strong>PT. Humasoft Studio Teknologi</strong> <br>
                <strong>0823455665</strong> <br>
                <strong>Jl. Raya Terusan Kopo No. 611 RK 5</strong> <br>
            </div>
        </td>
        <td width="50%" style="text-align: right; vertical-align: bottom;">
            <div style="line-height: 1.5;">
                <strong>
                    <?= dateFormatter(date('Y-m-d'), 'd MMMM yyyy'); ?>
                </strong> <br>
                <strong>KODE : 123</strong> <br>
            </div>
        </td>
    </tr>
</table>

<hr style="margin: 15px 0;">

<table style="width: 100%;">
    <tr>
        <td width="100%">
            <div style="line-height: 1.5;">
                <h5 style="margin: 0;">
                    <strong>DETAIL</strong>
                </h5>
                Kode BOQ : iashdia <br>
                Nama Project : AJKSHDA <br>
                Nama Tugas : ASDAD <br>
            </div>
        </td>
    </tr>
</table>

<style>
table.border,
table.border tr,
table.border th,
table.border td {
    border: 2px solid black;
    border-collapse: collapse;
    padding: 2px 4px;
}
</style>

<table class="border" style="width: 100%; margin-top: 20px;">
    <tr>
        <th>No.</th>
        <th>Kode</th>
        <th>Nama</th>
        <th>Harga</th>
    </tr>
    <?php foreach ($data as $key => $v) : ?>
    <tr>
        <td style="text-align: center;"><?= $key+1 ?></td>
        <td><?= $v['kode'] ?></td>
        <td><?= $v['nama'] ?></td>
        <td><?= $v['harga'] ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<table style="width: 100%; margin-top: 40px;">
    <tr>
        <td width="50%">
            <div style="line-height: 1.5; text-align: center;">
                <strong>Pembuat Formulir</strong> <br>
                USER
                <div style="margin: 40px 0;">
                </div>
            </div>
        </td>
        <td width="50%">
            <div style="line-height: 1.5; text-align: center;">
                <strong>DIREKTUR</strong> <br>
                <div style="margin: 40px 0;">
                </div>
                <strong>
                    <hr style="width: 150px;">
                </strong>
            </div>
        </td>
    </tr>
</table>