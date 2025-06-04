<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class jawaban_soal extends Model
{

    protected $table = 'jawaban_soal'; 

    protected $primaryKey = 'id_jawaban_soal';

    protected $fillable = [
        'id_jawaban_siswa',
        'jawaban',
        'benar',
        'id_soal',
        'id_tipe_soal',
    ];

    public function soal()
    {
        return $this->belongsTo(Soal::class, 'id_soal' ,'id_soal');
    }

    public function tipe_soal()
    {
        return $this->belongsTo(TipeSoal::class, 'id_tipe_soal', 'id_tipe_soal');
    }


    public function jawaban_siswa(){
        return $this->hasMany(jawaban_siswa::class);
    }
}
