<?php
namespace App\Imports;

use App\Models\Guru;
use App\Models\User;
use App\Models\Operator;
use App\Models\mata_pelajaran;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Spatie\Permission\Models\Role;
use Maatwebsite\Excel\Concerns\WithValidation;

class GuruImport implements ToModel, WithStartRow, WithValidation
{
    protected $id_operator;

    public function __construct($id_operator)
    {
        $this->id_operator = $id_operator;
    }

    public function startRow(): int
    {
        return 2;
    }

    public function model(array $row)
    {
        if (Guru::where('nip', $row[1])->exists()) {
            throw new \Exception("NIP {$row[1]} sudah ada di tabel guru.");
        }

        $guruRole = Role::where('name', 'guru')->first();

        if (!$guruRole) {
            throw new \Exception('Role "guru" tidak ditemukan.');
        }

        $user = User::create([
            'name' => $row[0],
            'email' => $row[2],
            'password' => Hash::make($row[3]),
        ]);

        $user->assignRole('Guru');

        $mataPelajaran = mata_pelajaran::where('nama_mata_pelajaran', $row[4])->first();

        if (!$mataPelajaran) {
            throw new \Exception("Mata pelajaran {$row[4]} tidak ditemukan.");
        }

        return Guru::create([
            'nama_guru' => $row[0],
            'nip' => $row[1],
            'id_user' => $user->id,
            'id_operator' => $this->id_operator,
            'status' => 'Aktif',
            'id_mata_pelajaran' => $mataPelajaran->id_mata_pelajaran,
        ]);
    }

    public function rules(): array
    {
        return [
            '0' => 'required|string',
            '1' => 'required|numeric|unique:guru,nip',
            '2' => 'required|email|unique:users,email',
            '3' => 'required|string',
            '4' => 'required|string',
        ];
    }
}