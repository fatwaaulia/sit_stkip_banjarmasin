<?php

namespace App\Controllers;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Dompdf\Dompdf;

class FormInput extends BaseController
{
    protected $base_name;
    protected $model_name;
    protected $upload_path;

    public function __construct()
    {
        $this->base_name   = 'form_input';
        $this->model_name  = str_replace(' ', '', ucwords(str_replace('_', ' ', $this->base_name)));
        $this->upload_path = dirUpload() . $this->base_name . '/';
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

    public function new()
    {
        $data = [
            'base_api' => $this->base_api,
            'title'    => 'Add ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];

        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/new', $data);
        return view('dashboard/header', $view);
    }

    public function edit($id = null)
    {
        $data = [
            'base_api'  => $this->base_api,
            'base_name' => $this->base_name,
            'data'      => model($this->model_name)->find($id),
            'title'     => 'Edit ' . ucwords(str_replace('_', ' ', $this->base_name)),
        ];
        
        $view['sidebar'] = view('dashboard/sidebar');
        $view['content'] = view($this->base_name . '/edit', $data);
        return view('dashboard/header', $view);
    }

    /*--------------------------------------------------------------
    # API
    --------------------------------------------------------------*/
    public function index()
    {
        $select     = ['*'];
        $base_query = model($this->model_name)->select($select);
        $limit      = (int)$this->request->getVar('length');
        $offset     = (int)$this->request->getVar('start');
        $records_total   = $base_query->countAllResults(false);
        $array_query_key = ['tanggal_awal', 'tanggal_akhir'];

        $get_tanggal_awal = $this->request->getVar('tanggal_awal');
        $get_tanggal_akhir = $this->request->getVar('tanggal_akhir');
        if (array_intersect(array_keys($_GET), $array_query_key)) {
            if ($get_tanggal_awal) {
                $base_query->where('tanggal_kegiatan >=', $get_tanggal_awal);
            }

            if ($get_tanggal_akhir) {
                $base_query->where('tanggal_kegiatan <=', $get_tanggal_akhir);
            }
        }

        // Datatables
        $columns = array_column($this->request->getVar('columns') ?? [], 'name');
        $search = $this->request->getVar('search')['value'] ?? null;
        dataTablesSearch($columns, $search, $select, $base_query);

        $order = $this->request->getVar('order')[0] ?? null;
        if (isset($order['column'], $order['dir']) && !empty($columns[$order['column']])) {
            $base_query->orderBy($columns[$order['column']], $order['dir'] === 'desc' ? 'desc' : 'asc');
        }
        // End | Datatables

        $total_rows = $base_query->countAllResults(false);
        $data       = $base_query->findAll($limit, $offset);

        $users = model('Users')->select(['id', 'nama'])->findAll();
        $nama_user_by_id = array_column($users, 'nama', 'id');
        foreach ($data as $key => $v) {
            $data[$key]['no_urut'] = $offset + $key + 1;
            $data[$key]['gambar'] = webFile('image', $this->base_name, $v['gambar'], $v['updated_at']);
            $data[$key]['dokumen_pendukung'] = $v['dokumen_pendukung'] ? webFile('', $this->base_name, $v['dokumen_pendukung'], $v['updated_at']) : '';
            $data[$key]['harga'] = formatRupiah($v['harga']);
            $data[$key]['tanggal_kegiatan'] = $v['tanggal_kegiatan'] ? dateFormatter($v['tanggal_kegiatan'], 'cccc, d MMMM yyyy HH:mm') : '';
            $data[$key]['created_at'] = date('d-m-Y H:i:s', strtotime($v['created_at']));
            $data[$key]['created_by'] = $nama_user_by_id[$v['created_by']];
        }

        return $this->response->setStatusCode(200)->setJSON([
            'recordsTotal'    => $records_total,
            'recordsFiltered' => $total_rows,
            'data'            => $data,
            'tanggal_awal'    => $get_tanggal_awal,
            'tanggal_akhir'   => $get_tanggal_akhir,
        ]);
    }

    public function detail($id = null)
    {
        $data = model($this->model_name)->find($id);

        if ($data) {
            return $this->response->setStatusCode(200)->setJSON([
                'status'  => 'success',
                'message' => 'Data ditemukan',
                'data'    => $data,
            ]);
        } else {
            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data tidak ditemukan',
            ]);
        }
    }

    public function create()
    {
        $rules = [
            'nama'              => "required|is_unique[$this->base_name.nama]",
            'harga'             => 'required',
            'dokumen_pendukung' => 'max_size[dokumen_pendukung,2048]|ext_in[dokumen_pendukung,pdf]|mime_in[dokumen_pendukung,application/pdf]',
            'gambar'            => 'max_size[gambar,2048]|ext_in[gambar,png,jpg,jpeg]|mime_in[gambar,image/png,image/jpeg]|is_image[gambar]',
            'select_multiple'   => 'required',
            'checkbox'          => 'required',
            'persetujuan'       => 'required',
        ];
        if (! $this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $dokumen_pendukung = $this->request->getFile('dokumen_pendukung');
        if ($dokumen_pendukung->isValid()) {
            $filename_dokumen_pendukung = $dokumen_pendukung->getRandomName();
            $dokumen_pendukung->move($this->upload_path, $filename_dokumen_pendukung);
        } else {
            $filename_dokumen_pendukung = '';
        }

        $gambar = $this->request->getFile('gambar');
        if ($gambar->isValid()) {
            $filename_gambar = $gambar->getRandomName();
            if ($gambar->getExtension() != 'jpg') {
                $filename_gambar = str_replace($gambar->getExtension(), 'jpg', $filename_gambar);
            }
            compressConvertImage($gambar, $this->upload_path, $filename_gambar);
        } else {
            $filename_gambar = '';
        }

        $gambar_multiple = $this->request->getFiles()['gambar_multiple'];
        $array_filename_gambar_multiple = [];
        foreach ($gambar_multiple as $file) {
            if ($file->isValid() && str_starts_with($file->getMimeType(), 'image/')) {
                $filename_gambar_multiple = $file->getRandomName();
                if ($file->getClientMimeType() == 'image/png') {
                    $filename_gambar_multiple = str_replace('.png', '.jpg', $filename_gambar_multiple);
                }
                $array_filename_gambar_multiple[] = $filename_gambar_multiple;
                compressConvertImage($file, $this->upload_path, $filename_gambar_multiple);
            }
        }

        for (;;) {
            $random_string = strtoupper(random_string('alnum', 5));
            $cek_kode = model($this->model_name)->select('kode')->where('kode', $random_string)->countAllResults();
            if ($cek_kode == 0) {
                $kode = $random_string;
                break;
            }
        }

        $nama = $this->request->getVar('nama');
        $slug = url_title($nama, '-', true);
        $cek_nama = model($this->model_name)->select('nama')->where('nama', $nama)->countAllResults();
        if ($cek_nama != 0) {
            $random_string = strtolower(random_string('alpha', 5));
            $slug = $slug . '-' . $random_string;
        }

        $select_multiple = $this->request->getVar('select_multiple');
        $checkbox = $this->request->getVar('checkbox');
        $data = [
            'kode'              => $kode,
            'nama'              => $nama,
            'slug'              => $slug,
            'harga'             => $this->request->getVar('harga', FILTER_SANITIZE_NUMBER_INT),
            'deskripsi'         => $this->request->getVar('deskripsi'),
            'dokumen_pendukung' => $filename_dokumen_pendukung,
            'gambar'            => $filename_gambar,
            'gambar_multiple' => json_encode($array_filename_gambar_multiple),
            'tanggal_kegiatan'  => $this->request->getVar('tanggal_kegiatan') ?: null,
            'select_multiple'   => $select_multiple ? json_encode($select_multiple) : null,
            'checkbox'          => $checkbox ? json_encode($checkbox) : null,
            'persetujuan'       => $this->request->getVar('persetujuan'),
            'created_by'        => userSession('id'),
        ];

        model($this->model_name)->insert($data);

        // Faker
        // $faker = \Faker\Factory::create('id_ID');
        // $data = [];
        // for ($i = 1; $i <= 3; $i++) :
        //     $kode = strtoupper(random_string('alnum', 5));

        //     if (date('s') >= 50 && date('s') <= 59) {
        //         $filename_gambar = 'dummy_' . rand() . '.jpg';
        //         $image_path = "assets/uploads/form_input/$filename_gambar";
        //         $dummy_image_url = 'https://unsplash.it/400/200?random=' . rand();
        //         file_put_contents($image_path, file_get_contents($dummy_image_url));
        //     } else {
        //         $filename_gambar = '';
        //     }

        //     $data[] = [
        //         'kode'   => $kode,
        //         'gambar' => $filename_gambar,
        //         'nama'   => str_replace('.', '', $faker->sentence(mt_rand(2, 5))),
        //         'harga'  => rand(10000, 500000),
        //         'gambar' => $filename_gambar,
        //         'tanggal_kegiatan' => date('Y-m-d H:i:s', rand(strtotime('2025-01-15'), strtotime('2025-02-15'))),
        //         'persetujuan'      => ['Iya', 'Tidak'][mt_rand(0, 1)],
        //     ];
        // endfor;
        // model($this->model_name)->insertBatch($data);
        // End | Faker

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil ditambahkan',
            'route'   => $this->base_route,
        ]);
    }

    public function update($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $rules = [
            'nama'              => "required|is_unique[$this->base_name.nama,id,$id]",
            'harga'             => 'required',
            'dokumen_pendukung' => 'permit_empty|max_size[dokumen_pendukung,2048]|ext_in[dokumen_pendukung,pdf]|mime_in[dokumen_pendukung,application/pdf]',
            'gambar'            => 'permit_empty|max_size[gambar,2048]|ext_in[gambar,png,jpg,jpeg]|mime_in[gambar,image/png,image/jpeg]|is_image[gambar]',
            'select_multiple'   => 'required',
            'checkbox'          => 'required',
            'persetujuan'       => 'required',
        ];
        if (! $this->validate($rules)) {
            $errors = array_map(fn($error) => str_replace('_', ' ', $error), $this->validator->getErrors());

            return $this->response->setStatusCode(400)->setJSON([
                'status'  => 'error',
                'message' => 'Data yang dimasukkan tidak valid!',
                'errors'  => $errors,
            ]);
        }

        // Lolos Validasi
        $dokumen_pendukung = $this->request->getFile('dokumen_pendukung');
        if ($dokumen_pendukung && $dokumen_pendukung->isValid()) {
            $filename_dokumen_pendukung = $find_data['dokumen_pendukung'] ?: $dokumen_pendukung->getRandomName();
            $dokumen_pendukung->move($this->upload_path, $filename_dokumen_pendukung);
        } else {
            $filename_dokumen_pendukung = $find_data['dokumen_pendukung'];
        }

        $gambar = $this->request->getFile('gambar');
        if ($gambar->isValid()) {
            $filename_gambar = $find_data['gambar'] ?: $gambar->getRandomName();
            if ($gambar->getExtension() != 'jpg') {
                $filename_gambar = str_replace($gambar->getExtension(), 'jpg', $filename_gambar);
            }
            compressConvertImage($gambar, $this->upload_path, $filename_gambar);
        } else {
            $filename_gambar = $find_data['gambar'];
        }

        $default_images_save = $this->request->getVar('default_images_save');
        $array_filename_gambar_multiple = json_decode($default_images_save);
        $gambar_multiple = $this->request->getFiles()['gambar_multiple'];
        foreach ($gambar_multiple as $file) {
            if ($file->isValid() && str_starts_with($file->getMimeType(), 'image/')) {
                $filename_gambar_multiple = $file->getRandomName();
                if ($file->getClientMimeType() == 'image/png') {
                    $filename_gambar_multiple = str_replace('.png', '.jpg', $filename_gambar_multiple);
                }
                $array_filename_gambar_multiple[] = $filename_gambar_multiple;
                compressConvertImage($file, $this->upload_path, $filename_gambar_multiple);
            }
        }
        $default_images_delete = $this->request->getVar('default_images_delete');
        if ($default_images_delete) {
            foreach (json_decode($default_images_delete, true) as $v) {
                $file = $this->upload_path . $v;
                if (is_file($file)) unlink($file);
            }
        }

        $select_multiple = $this->request->getVar('select_multiple');
        $checkbox = $this->request->getVar('checkbox');
        $data = [
            'nama'              => $this->request->getVar('nama'),
            'harga'             => $this->request->getVar('harga', FILTER_SANITIZE_NUMBER_INT),
            'deskripsi'         => $this->request->getVar('deskripsi'),
            'dokumen_pendukung' => $filename_dokumen_pendukung,
            'gambar'            => $filename_gambar,
            'gambar_multiple'   => $array_filename_gambar_multiple ? json_encode($array_filename_gambar_multiple) : '',
            'tanggal_kegiatan'  => $this->request->getVar('tanggal_kegiatan') ?: null,
            'select_multiple'   => $select_multiple ? json_encode($select_multiple) : null,
            'checkbox'          => $checkbox ? json_encode($checkbox) : null,
            'persetujuan'       => $this->request->getVar('persetujuan'),
        ];

        model($this->model_name)->update($id, $data);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Perubahan disimpan',
            'route'   => $this->base_route,
        ]);
    }

    public function delete($id = null)
    {
        $find_data = model($this->model_name)->find($id);

        $dokumen_pendukung = $this->upload_path . $find_data['dokumen_pendukung'];
        if (is_file($dokumen_pendukung)) unlink($dokumen_pendukung);

        $gambar = $this->upload_path . $find_data['gambar'];
        if (is_file($gambar)) unlink($gambar);

        $default_images_delete = $find_data['gambar_multiple'];
        if ($default_images_delete) {
            foreach (json_decode($default_images_delete, true) as $v) {
                $file = $this->upload_path . $v;
                if (is_file($file)) unlink($file);
            }
        }

        model($this->model_name)->delete($id);

        return $this->response->setStatusCode(200)->setJSON([
            'status'  => 'success',
            'message' => 'Data berhasil dihapus',
        ]);
    }

    /*--------------------------------------------------------------
    # Export Excel
    --------------------------------------------------------------*/
    public function exportExcel()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Get Data
        $response = $this->index()->getBody();
        $response = json_decode($response, true);
        $data          = $response['data'];
        $tanggal_awal  = $response['tanggal_awal'] ? date('d-m-Y', strtotime($response['tanggal_awal'])) : '';
        $tanggal_akhir = $response['tanggal_akhir'] ? date('d-m-Y', strtotime($response['tanggal_akhir'])) : '';

        // Filtrasi
        $sheet->setCellValue('A1', 'Filtrasi');
        $sheet->setCellValue('A2', 'Tanggal Awal');
        $sheet->setCellValue('A3', 'Tanggal AKhir');
        $sheet->getStyle('A1')->getFont()->setBold(true);

        $sheet->setCellValue('C2', ': ' . $tanggal_awal);
        $sheet->setCellValue('C3', ': ' . $tanggal_akhir);

        $sheet->mergeCells("A1:B1");
        $sheet->mergeCells("A2:B2");
        $sheet->mergeCells("A3:B3");

        // Header
        $header_row = 5;
        $sheet->setCellValue('A' . $header_row, 'No.');
        $sheet->setCellValue('B' . $header_row, 'Kode');
        $sheet->setCellValue('C' . $header_row, 'Nama');
        $sheet->setCellValue('D' . $header_row, 'Harga');
        $sheet->getStyle("A$header_row:{$sheet->getHighestColumn()}$header_row")->getFont()->setBold(true);

        $sheet->getStyle('A' . $header_row)->getAlignment()->setHorizontal('center');

        // Data
        $first_row_data = $header_row + 1;
        foreach ($data as $key => $v) {
            $data_row = $key + $first_row_data;
            $sheet->setCellValueExplicit('A' . $data_row, $key+1, \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING);
            $sheet->setCellValue('B' . $data_row, $v['kode']);
            $sheet->setCellValue('C' . $data_row, $v['nama']);
            $sheet->setCellValue('D' . $data_row, $v['harga']);

            $sheet->getStyle('A' . $data_row)->getAlignment()->setHorizontal('center');
        }

        // Lebar Kolom Sesuai Isinya
        foreach (range('A', $sheet->getHighestColumn()) as $col) $sheet->getColumnDimension($col)->setAutoSize(true);

        $filename = 'excel.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }

    /*--------------------------------------------------------------
    # Unduh PDF
    --------------------------------------------------------------*/
    public function unduhPDF()
    {
        $response = $this->index()->getBody();
        $response = json_decode($response, true);

        $data = [
            'data' => $response['data'],
        ];

        $dompdf = new Dompdf();
        ob_start();
        $pdf_page = view($this->base_name . '/pdf', $data);
        $dompdf->loadHtml($pdf_page);
        $dompdf->setPaper('A4', 'portrait');
        ob_end_clean();
        $dompdf->render();
        $dompdf->stream("form_input.pdf", ["Attachment" => true]);
        exit;
    }
}
