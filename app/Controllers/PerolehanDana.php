<?php

namespace App\Controllers;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class PerolehanDana extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'perolehan_dana';
        $this->model_name  = str_replace(' ', '', ucwords(str_replace('_', ' ', $this->base_name)));
    }

    /*--------------------------------------------------------------
    # Front-End
    --------------------------------------------------------------*/
    public function main()
    {
        $query = $_SERVER['QUERY_STRING'] ? ('?' . $_SERVER['QUERY_STRING']) : '';
        $data = [
            'get_data'   => $this->base_api . $query,
            'base_route' => $this->base_route,
            'base_api'   => $this->base_api,
            'title'      => ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/main', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # Export Excel
    --------------------------------------------------------------*/
    public function exportExcel()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $data_row = 1; // mulai dari baris pertama Excel

        // header awal mulai di baris 1
        $awal_header = 1;

        // bikin teks header center & middle
        $sheet->getStyle("A{$awal_header}:G" . ($awal_header+1))
            ->getAlignment()
            ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER)
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);

        // font tebal
        $sheet->getStyle("A{$awal_header}:G" . ($awal_header+1))
            ->getFont()->setBold(true);


        // header tabel
        $sheet->mergeCells("A{$data_row}:A" . ($data_row+1));
        $sheet->setCellValue("A{$data_row}", 'No.');

        $sheet->mergeCells("B{$data_row}:B" . ($data_row+1));
        $sheet->setCellValue("B{$data_row}", 'Sumber Dana');

        $sheet->mergeCells("C{$data_row}:C" . ($data_row+1));
        $sheet->setCellValue("C{$data_row}", 'Jenis Dana');

        $sheet->mergeCells("D{$data_row}:F{$data_row}");
        $sheet->setCellValue("D{$data_row}", 'Dana (Rp)');

        $sheet->mergeCells("G{$data_row}:G" . ($data_row+1));
        $sheet->setCellValue("G{$data_row}", 'Jumlah (Rp)');

        $data_row++;

        // header subkolom Dana
        $sheet->setCellValue("D{$data_row}", 'TS-2');
        $sheet->setCellValue("E{$data_row}", 'TS-1');
        $sheet->setCellValue("F{$data_row}", 'TS');

        // isi data
        $kategori_dana = model('KategoriDanaMasuk')->findAll();

        $total_jumlah_ts_2 = 0;
        $total_jumlah_ts_1 = 0;
        $total_jumlah_ts_0 = 0;
        $total_jumlah_ts_sumber_dana = 0;

        $data_row++;

        foreach ($kategori_dana as $v) :
            if (! in_array($v['id'], [1, 2, 3, 4])) continue;

            $master_dana = model('MasterDana')->where('id_kategori_dana', $v['id'])->findAll();
            $total_data = count($master_dana);

            $jumlah_ts_2 = 0;
            $jumlah_ts_1 = 0;
            $jumlah_ts_0 = 0;
            $jumlah_ts_sumber_dana = 0;

            foreach ($master_dana as $key2 => $v2) :
                $ts_2 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_2_tanggal_awal'),
                        'created_at <=' => appSettings('ts_2_tanggal_akhir'),
                    ])->first()['nominal'];

                $ts_1 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_1_tanggal_awal'),
                        'created_at <=' => appSettings('ts_1_tanggal_akhir'),
                    ])->first()['nominal'];

                $ts_0 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_tanggal_awal'),
                        'created_at <=' => appSettings('ts_tanggal_akhir'),
                    ])->first()['nominal'];

                $jumlah_ts_sebaris = $ts_2 + $ts_1 + $ts_0;
                $jumlah_ts_2 += $ts_2;
                $jumlah_ts_1 += $ts_1;
                $jumlah_ts_0 += $ts_0;
                $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;

                // isi baris
                if ($key2 == 0) {
                    $endRow = $data_row + $total_data - 1;
                    $sheet->mergeCells("A{$data_row}:A{$endRow}");
                    $sheet->mergeCells("B{$data_row}:B{$endRow}");
                    $sheet->setCellValue("A{$data_row}", $v2['id_kategori_dana']);
                    $sheet->setCellValue("B{$data_row}", $v2['nama_kategori_dana']);
                }

                $sheet->setCellValue("C{$data_row}", $v2['nama']);
                $sheet->setCellValue("D{$data_row}", dotsNumber($ts_2));
                $sheet->setCellValue("E{$data_row}", dotsNumber($ts_1));
                $sheet->setCellValue("F{$data_row}", dotsNumber($ts_0));
                $sheet->setCellValue("G{$data_row}", dotsNumber($jumlah_ts_sebaris));

                $sheet->getStyle("D{$data_row}:G{$data_row}")
                    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

                $data_row++;
            endforeach;

            // subtotal per kategori
            $sheet->setCellValue("A{$data_row}", '');
            $sheet->mergeCells("B{$data_row}:C{$data_row}");
            $sheet->setCellValue("B{$data_row}", 'Jumlah');
            $sheet->setCellValue("D{$data_row}", dotsNumber($jumlah_ts_2));
            $sheet->setCellValue("E{$data_row}", dotsNumber($jumlah_ts_1));
            $sheet->setCellValue("F{$data_row}", dotsNumber($jumlah_ts_0));
            $sheet->setCellValue("G{$data_row}", dotsNumber($jumlah_ts_sumber_dana));

            $sheet->getStyle("B{$data_row}")->getAlignment()
                ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("B{$data_row}:G{$data_row}")->getFont()->setBold(true);
            $sheet->getStyle("D{$data_row}:G{$data_row}")
                ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

            $data_row++;

            $total_jumlah_ts_2 += $jumlah_ts_2;
            $total_jumlah_ts_1 += $jumlah_ts_1;
            $total_jumlah_ts_0 += $jumlah_ts_0;
            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;
        endforeach;

        // total (1+2+3+4)
        $sheet->setCellValue("A{$data_row}", '');
        $sheet->mergeCells("B{$data_row}:C{$data_row}");
        $sheet->setCellValue("B{$data_row}", 'Total (1 + 2 + 3 + 4)');
        $sheet->setCellValue("D{$data_row}", dotsNumber($total_jumlah_ts_2));
        $sheet->setCellValue("E{$data_row}", dotsNumber($total_jumlah_ts_1));
        $sheet->setCellValue("F{$data_row}", dotsNumber($total_jumlah_ts_0));
        $sheet->setCellValue("G{$data_row}", dotsNumber($total_jumlah_ts_sumber_dana));

        $sheet->getStyle("B{$data_row}")->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle("B{$data_row}:G{$data_row}")->getFont()->setBold(true);
        $sheet->getStyle("D{$data_row}:G{$data_row}")
            ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

        $data_row++;

        // kategori id = 5
        foreach ($kategori_dana as $v) :
            if ($v['id'] != 5) continue;

            $master_dana = model('MasterDana')->where('id_kategori_dana', $v['id'])->findAll();
            $total_data = count($master_dana);

            $jumlah_ts_2 = 0;
            $jumlah_ts_1 = 0;
            $jumlah_ts_0 = 0;
            $jumlah_ts_sumber_dana = 0;

            foreach ($master_dana as $key2 => $v2) :
                // hitung ts_2, ts_1, ts_0 sama seperti di atas
                $jumlah_ts_sebaris = $ts_2 + $ts_1 + $ts_0;
                $jumlah_ts_2 += $ts_2;
                $jumlah_ts_1 += $ts_1;
                $jumlah_ts_0 += $ts_0;
                $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;

                if ($key2 == 0) {
                    $endRow = $data_row + $total_data - 1;
                    $sheet->mergeCells("A{$data_row}:A{$endRow}");
                    $sheet->mergeCells("B{$data_row}:B{$endRow}");
                    $sheet->setCellValue("A{$data_row}", $v2['id_kategori_dana']);
                    $sheet->setCellValue("B{$data_row}", $v2['nama_kategori_dana']);
                }

                $sheet->setCellValue("C{$data_row}", $v2['nama']);
                $sheet->setCellValue("D{$data_row}", dotsNumber($ts_2));
                $sheet->setCellValue("E{$data_row}", dotsNumber($ts_1));
                $sheet->setCellValue("F{$data_row}", dotsNumber($ts_0));
                $sheet->setCellValue("G{$data_row}", dotsNumber($jumlah_ts_sebaris));

                $data_row++;
            endforeach;

            // subtotal kategori 5
            $sheet->setCellValue("A{$data_row}", '');
            $sheet->mergeCells("B{$data_row}:C{$data_row}");
            $sheet->setCellValue("B{$data_row}", 'Jumlah');
            $sheet->setCellValue("D{$data_row}", dotsNumber($jumlah_ts_2));
            $sheet->setCellValue("E{$data_row}", dotsNumber($jumlah_ts_1));
            $sheet->setCellValue("F{$data_row}", dotsNumber($jumlah_ts_0));
            $sheet->setCellValue("G{$data_row}", dotsNumber($jumlah_ts_sumber_dana));

            $sheet->getStyle("B{$data_row}")->getAlignment()
                ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("B{$data_row}:G{$data_row}")->getFont()->setBold(true);
            $sheet->getStyle("D{$data_row}:G{$data_row}")
                ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

            $data_row++;

            $total_jumlah_ts_2 += $jumlah_ts_2;
            $total_jumlah_ts_1 += $jumlah_ts_1;
            $total_jumlah_ts_0 += $jumlah_ts_0;
            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;
        endforeach;

        // total akhir
        $sheet->setCellValue("A{$data_row}", '');
        $sheet->mergeCells("B{$data_row}:C{$data_row}");
        $sheet->setCellValue("B{$data_row}", 'Total');
        $sheet->setCellValue("D{$data_row}", dotsNumber($total_jumlah_ts_2));
        $sheet->setCellValue("E{$data_row}", dotsNumber($total_jumlah_ts_1));
        $sheet->setCellValue("F{$data_row}", dotsNumber($total_jumlah_ts_0));
        $sheet->setCellValue("G{$data_row}", dotsNumber($total_jumlah_ts_sumber_dana));

        $sheet->getStyle("B{$data_row}")->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle("B{$data_row}:G{$data_row}")->getFont()->setBold(true);
        $sheet->getStyle("D{$data_row}:G{$data_row}")
      ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

        // Lebar Kolom Sesuai Isinya
        foreach (range('A', $sheet->getHighestColumn()) as $col) $sheet->getColumnDimension($col)->setAutoSize(true);

        $filename = 'perolehan_dana.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }
}
