<?php

namespace App\Controllers;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class PenggunaanDana extends BaseController
{
    protected $base_name;
    protected $model_name;

    public function __construct()
    {
        $this->base_name   = 'penggunaan_dana';
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

        // ========== HEADER ==========
        $sheet->setCellValue('A1', 'No.');
        $sheet->setCellValue('B1', 'Jenis Penggunaan');
        $sheet->setCellValue('C1', 'Dana (Rp)');
        $sheet->setCellValue('F1', 'Jumlah (Rp)');

        $sheet->setCellValue('C2', 'TS-2');
        $sheet->setCellValue('D2', 'TS-1');
        $sheet->setCellValue('E2', 'TS');

        // merge sesuai struktur HTML
        $sheet->mergeCells('A1:A2');
        $sheet->mergeCells('B1:B2');
        $sheet->mergeCells('C1:E1');
        $sheet->mergeCells('F1:F2');

        // style header center + bold
        $sheet->getStyle('A1:F2')->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle('A1:F2')->getFont()->setBold(true);

        // ========== ISI DATA ==========
        $data_row = 3;
        $total_jumlah_ts_2 = 0;
        $total_jumlah_ts_1 = 0;
        $total_jumlah_ts_0 = 0;
        $total_jumlah_ts_sumber_dana = 0;

        $id_grup = [11, 12];

        foreach ($id_grup as $v) :

            $master_dana = model('MasterDana')->where('id_kategori_dana', $v)->findAll();
            $jumlah_ts_2 = 0;
            $jumlah_ts_1 = 0;
            $jumlah_ts_0 = 0;
            $jumlah_ts_sumber_dana = 0;

            foreach ($master_dana as $key => $v2) :
                $ts_2 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_2_tanggal_awal'),
                        'created_at <=' => appSettings('ts_2_tanggal_akhir'),
                    ])
                    ->first()['nominal'];

                $ts_1 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_1_tanggal_awal'),
                        'created_at <=' => appSettings('ts_1_tanggal_akhir'),
                    ])
                    ->first()['nominal'];

                $ts_0 = (int)model('Keuangan')
                    ->selectSum('nominal')
                    ->where([
                        'id_sumber_dana' => $v2['id'],
                        'created_at >=' => appSettings('ts_tanggal_awal'),
                        'created_at <=' => appSettings('ts_tanggal_akhir'),
                    ])
                    ->first()['nominal'];

                $jumlah_ts_sebaris = $ts_2 + $ts_1 + $ts_0;
                $jumlah_ts_2 += $ts_2;
                $jumlah_ts_1 += $ts_1;
                $jumlah_ts_0 += $ts_0;
                $jumlah_ts_sumber_dana += $jumlah_ts_sebaris;

                // isi baris data
                $sheet->setCellValue("A{$data_row}", $key + 1);
                $sheet->setCellValue("B{$data_row}", $v2['nama']);
                $sheet->setCellValue("C{$data_row}", dotsNumber(abs($ts_2)));
                $sheet->setCellValue("D{$data_row}", dotsNumber(abs($ts_1)));
                $sheet->setCellValue("E{$data_row}", dotsNumber(abs($ts_0)));
                $sheet->setCellValue("F{$data_row}", dotsNumber($jumlah_ts_sebaris));

                // rata kanan untuk angka
                $sheet->getStyle("C{$data_row}:F{$data_row}")
                    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

                $data_row++;
            endforeach;

            // Tambah ke total keseluruhan
            $total_jumlah_ts_2 += $jumlah_ts_2;
            $total_jumlah_ts_1 += $jumlah_ts_1;
            $total_jumlah_ts_0 += $jumlah_ts_0;
            $total_jumlah_ts_sumber_dana += $jumlah_ts_sumber_dana;

            // ========== JUMLAH per grup ==========
            $sheet->setCellValue("B{$data_row}", 'Jumlah');
            $sheet->setCellValue("C{$data_row}", dotsNumber(abs($jumlah_ts_2)));
            $sheet->setCellValue("D{$data_row}", dotsNumber(abs($jumlah_ts_1)));
            $sheet->setCellValue("E{$data_row}", dotsNumber(abs($jumlah_ts_0)));
            $sheet->setCellValue("F{$data_row}", dotsNumber(abs($jumlah_ts_sumber_dana)));

            $sheet->getStyle("B{$data_row}")->getAlignment()
                ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("B{$data_row}:F{$data_row}")->getFont()->setBold(true);
            $sheet->getStyle("C{$data_row}:F{$data_row}")
                ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

            $data_row++;

        endforeach;

        // ========== TOTAL KESELURUHAN ==========
        $sheet->setCellValue("B{$data_row}", 'Total');
        $sheet->setCellValue("C{$data_row}", dotsNumber(abs($total_jumlah_ts_2)));
        $sheet->setCellValue("D{$data_row}", dotsNumber(abs($total_jumlah_ts_1)));
        $sheet->setCellValue("E{$data_row}", dotsNumber(abs($total_jumlah_ts_0)));
        $sheet->setCellValue("F{$data_row}", dotsNumber(abs($total_jumlah_ts_sumber_dana)));

        $sheet->getStyle("B{$data_row}")->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle("B{$data_row}:F{$data_row}")->getFont()->setBold(true);
        $sheet->getStyle("C{$data_row}:F{$data_row}")
            ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);

        // Lebar Kolom Sesuai Isinya
        foreach (range('A', $sheet->getHighestColumn()) as $col) $sheet->getColumnDimension($col)->setAutoSize(true);

        $filename = 'penggunaan_dana.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }
}
