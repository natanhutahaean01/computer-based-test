<?php

namespace App\Http\Controllers;

use App\Models\TahunAjaran;
use App\Models\Operator;
use Illuminate\Http\Request;

class TahunAjaranController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        if (!$user) {
            return redirect()->route('login');
        }

        $operator = Operator::where('id_user', $user->id)->first();

        $tahunAjaran = TahunAjaran::where('id_operator', $operator->id_operator)
            ->with('operator')
            ->get();

        return view('Role.Operator.Tahun Ajaran.index', compact('tahunAjaran', 'user'));
    }

    public function create()
    {
        // Pastikan id_operator valid
        $user = auth()->user();

        if (!$user) {
            return redirect()->route('login');
        }

        return view('Role.Operator.Tahun Ajaran.create', compact('user'));
    }

    public function store(Request $request)
    {
        // Custom validation rules
        $request->validate([
            'Nama_Tahun_Ajaran' => 'required|string|unique:tahun_ajaran',
            'Mulai_Tahun_Ajaran' => 'required|date',
            'Selesai_Tahun_Ajaran' => 'required|date',
        ], [
            'Nama_Tahun_Ajaran.required' => 'Nama tahun ajaran harus diisi.',
            'Nama_Tahun_Ajaran.string' => 'Nama tahun ajaran harus berupa teks.',
            'Nama_Tahun_Ajaran.unique' => 'Nama tahun ajaran sudah ada, silakan pilih nama lain.',
            'Mulai_Tahun_Ajaran.required' => 'Tanggal mulai tahun ajaran harus diisi.',
            'Mulai_Tahun_Ajaran.date' => 'Tanggal mulai tahun ajaran harus berupa format tanggal yang valid.',
            'Selesai_Tahun_Ajaran.required' => 'Tanggal selesai tahun ajaran harus diisi.',
            'Selesai_Tahun_Ajaran.date' => 'Tanggal selesai tahun ajaran harus berupa format tanggal yang valid.',
        ]);

        $idUser = auth()->id();

        $operator = Operator::where('id_user', $idUser)->first();

        if (!$operator || !$operator->id_operator) {
            return redirect()->route('Operator.TahunAjaran.index')->with('error', 'Operator tidak ditemukan atau tidak memiliki ID yang valid.');
        }

        $status = now()->between($request->Mulai_Tahun_Ajaran, $request->Selesai_Tahun_Ajaran) ? 'Aktif' : 'Tidak Aktif';

        TahunAjaran::create([
            'Nama_Tahun_Ajaran' => $request->Nama_Tahun_Ajaran,
            'Mulai_Tahun_Ajaran' => $request->Mulai_Tahun_Ajaran,
            'Selesai_Tahun_Ajaran' => $request->Selesai_Tahun_Ajaran,
            'Status' => $status,
            'id_operator' => $operator->id_operator,  // Make sure this is set correctly
        ]);

        return redirect()->route('Operator.TahunAjaran.index')->with('success', 'Tahun ajaran berhasil ditambahkan.');
    }


    public function show(string $id)
    {
        $tahunAjaran = TahunAjaran::with('operator')->findOrFail($id);
        return view('Role.Operator.Tahun Ajaran.show', compact('tahunAjaran'));
    }

    public function edit(string $id)
    {
        $tahunAjaran = TahunAjaran::findOrFail($id);
        $user = auth()->user();
        return view('Role.Operator.Tahun Ajaran.edit', compact('tahunAjaran', 'user'));
    }

    public function update(Request $request, string $id)
    {
        $request->validate([
            'Nama_Tahun_Ajaran' => 'required|string|unique:tahun_ajaran,Nama_Tahun_Ajaran,' . $id . ',ID_Tahun_Ajaran',
            'Mulai_Tahun_Ajaran' => 'required|date',
            'Selesai_Tahun_Ajaran' => 'required|date',
        ], [
            'Nama_Tahun_Ajaran.required' => 'Nama tahun ajaran harus diisi.',
            'Nama_Tahun_Ajaran.string' => 'Nama tahun ajaran harus berupa teks.',
            'Nama_Tahun_Ajaran.max' => 'Nama tahun ajaran tidak boleh lebih dari 10 karakter.',
            'Nama_Tahun_Ajaran.unique' => 'Nama tahun ajaran sudah ada, silakan pilih nama lain.',
            'Mulai_Tahun_Ajaran.required' => 'Tanggal mulai tahun ajaran harus diisi.',
            'Mulai_Tahun_Ajaran.date' => 'Tanggal mulai tahun ajaran harus berupa format tanggal yang valid.',
            'Selesai_Tahun_Ajaran.required' => 'Tanggal selesai tahun ajaran harus diisi.',
            'Selesai_Tahun_Ajaran.date' => 'Tanggal selesai tahun ajaran harus berupa format tanggal yang valid.',
        ]);


        $tahunAjaran = TahunAjaran::findOrFail($id);

        // Cek status apakah Aktif atau Tidak Aktif berdasarkan tanggal saat ini
        $status = now()->between($request->Mulai_Tahun_Ajaran, $request->Selesai_Tahun_Ajaran) ? 'Aktif' : 'Tidak Aktif';

        $tahunAjaran->update([
            'Nama_Tahun_Ajaran' => $request->Nama_Tahun_Ajaran,
            'Mulai_Tahun_Ajaran' => $request->Mulai_Tahun_Ajaran,
            'Selesai_Tahun_Ajaran' => $request->Selesai_Tahun_Ajaran,
            'Status' => $status, // Set status berdasarkan tanggal
        ]);

        return redirect()->route('Operator.TahunAjaran.index')->with('success', 'Tahun ajaran berhasil diperbarui.');
    }

    public function destroy(string $id)
    {
        $tahunAjaran = TahunAjaran::findOrFail($id);
        $tahunAjaran->delete();

        return redirect()->route('Operator.TahunAjaran.index')->with('success', 'Tahun ajaran berhasil dihapus.');
    }
}
