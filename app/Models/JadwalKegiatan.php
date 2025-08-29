<?php

namespace App\Models;

use CodeIgniter\Model;

class JadwalKegiatan extends Model
{
    protected $table         = 'jadwal_kegiatan';
    protected $protectFields = false;
    protected $useTimestamps = true;
}
