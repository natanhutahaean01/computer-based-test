<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Operator extends Model
{
   
    protected $table = 'operator'; 

    protected $primaryKey = 'id_operator';

    protected $fillable = [
        'id_operator',
        'nama_sekolah',
        'durasi',
        'status',
        'id_user',
    ];


    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function kurikulum(){
        return $this->hasMany(kurikulum::class);
    }

    public function guru(){
        return $this->hasMany(guru::class);
    }

    public function kelas(){
        return $this->hasMany(kelas::class);
    }

    public function mata_pelajaran(){
        return $this->hasMany(mata_pelajaran::class);
    }

    public function siswa(){
        return $this->hasMany(siswa::class);
    }
}
