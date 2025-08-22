<?php

namespace App\Models;

use CodeIgniter\Model;

class PembayaranMahasiswa extends Model
{
    protected $table         = 'pembayaran_mahasiswa';
    protected $protectFields = false;
    protected $useTimestamps = true;
}
