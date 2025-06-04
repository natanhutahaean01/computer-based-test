<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class jawaban_siswa extends Model
{

    protected $table = 'jawaban_siswa'; 

    protected $primaryKey = 'id_jawaban_siswa';

    protected $fillable = [
        'id_jawaban_siswa',
        'jawaban_siswa',
        'id_soal',
        'id_siswa',
        'id_jawaban_soal',
    ];

    public function soal(){
        return $this->belongsTo(soal::class);
    }

    public function siswa(){
        return $this->belongsTo(siswa::class);
    }

    public function jawaban_soal(){
        return $this->belongsTo(jawaban_soal::class);
    }
}
