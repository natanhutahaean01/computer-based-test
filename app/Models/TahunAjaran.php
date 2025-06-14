<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TahunAjaran extends Model
{
    use HasFactory;

    protected $table = 'tahun_ajaran';
    protected $primaryKey = 'ID_Tahun_Ajaran';
    protected $fillable = [
        'Nama_Tahun_Ajaran',
        'Mulai_Tahun_Ajaran',
        'Selesai_Tahun_Ajaran',
        'Status',
        'id_operator',
    ];
    protected $dates = ['Mulai_Tahun_Ajaran', 'Selesai_Tahun_Ajaran'];

    public function updateStatus()
    {
        $this->Status = now()->between($this->Mulai_Tahun_Ajaran, $this->Selesai_Tahun_Ajaran) ? 'Aktif' : 'Tidak Aktif';
        $this->save();
    }

    public function operator()
    {
        return $this->belongsTo(Operator::class, 'id_operator');
    }

    public function kursus()
    {
        return $this->hasMany(kursus::class, 'id_kursus', 'id_kursus');
    }
}
