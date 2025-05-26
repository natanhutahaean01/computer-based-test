<?php

namespace App\Http\Controllers;

use App\Models\guru;
use App\Models\User;
use App\Models\Operator;
use App\Models\mata_pelajaran;
use App\Imports\GuruImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class GuruController extends Controller
{
    public function index()
    {
        $gurus = Guru::with('user')->get();
        $user = auth()->user();

        if (!$user) {
            return redirect()->route('login');
        }

        return view('Role.Operator.Guru.index', compact('gurus', 'user'));
    }

    public function upload()
    {
        return view('Role.Operator.Guru.index');
    }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',  // 20MB max
        ], [
            'file.required' => 'File harus diupload.',
            'file.mimes' => 'File harus bertipe .xlsx atau .xls.',
            'file.max' => 'Ukuran file maksimal adalah 20MB.',
        ]);

        if ($request->hasFile('file') && $request->file('file')->isValid()) {
            try {
                Excel::import(new GuruImport, $request->file('file'));
                return redirect()->route('Operator.Guru.index')->with('success', 'Data guru berhasil diupload.');
            } catch (\Exception $e) {
                Log::error('Error during import: ' . $e->getMessage());
                return redirect()->back()->with('error', 'Terjadi kesalahan saat mengimpor data: ' . $e->getMessage());
            }
        } else {
            return redirect()->back()->with('error', 'File tidak valid atau gagal diupload.');
        }
    }

    public function create()
    {
        $mataPelajaran = mata_pelajaran::all();
        $user = auth()->user();

        if (!$user) {
            return redirect()->route('login');
        }

        return view('Role.Operator.Guru.create', compact('user', 'mataPelajaran'));
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'nip' => 'required|numeric|digits:16|min:16|unique:guru',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|string|min:8|confirmed',
                'status' => 'in:Aktif,Tidak Aktif',
                'mata_pelajaran' => 'required|exists:mata_pelajaran,id_mata_pelajaran',
            ], [
                'name.required' => 'Nama guru harus diisi.',
                'nip.required' => 'NIP harus diisi.',
                'nip.unique' => 'NIP sudah terdaftar.',
                'nip.numeric' => 'NIP harus berupa angka.',
                'nip.digits' => 'NIP harus terdiri dari 16 digit.',
                'nip.min' => 'NIP harus terdiri dari minimal 16 digit.',
                'email.required' => 'Email harus diisi.',
                'email.email' => 'Format email tidak valid.',
                'email.unique' => 'Email sudah terdaftar.',
                'password.required' => 'Password harus diisi.',
                'password.min' => 'Password minimal terdiri dari 8 karakter.',
                'status.in' => 'Status harus bernilai "Aktif" atau "Tidak Aktif".',
                'mata_pelajaran.required' => 'Mata pelajaran harus dipilih.',
                'mata_pelajaran.exists' => 'Mata pelajaran yang dipilih tidak valid.',
            ]);

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);

            $user->assignRole('Guru');

            $operator = Operator::where('id_user', auth()->user()->id)->first();

            if (!$operator) {
                Log::error('Operator not found for user: ' . auth()->user()->id);
                return redirect()->back()->withErrors('ID Operator tidak ditemukan.');
            }

            Guru::create([
                'nama_guru' => $request->name,
                'nip' => $request->nip,
                'id_user' => $user->id,
                'id_operator' => $operator->id_operator,
                'status' => $request->status ?? 'Aktif',
                'id_mata_pelajaran' => $request->mata_pelajaran,
            ]);

            return redirect()->route('Operator.Guru.index')->with('success', 'Guru berhasil ditambahkan.');
        } catch (\Exception $e) {
            Log::error('Error adding guru: ' . $e->getMessage(), ['request' => $request->all(), 'user_id' => auth()->user()->id]);
            return redirect()->back()->withErrors('Terjadi kesalahan saat menambahkan guru.');
        }
    }

    public function show(string $id)
    {
        $guru = Guru::with('user')->findOrFail($id);
        return view('Role.Operator.Guru.show', compact('guru'));
    }

    public function edit(string $id)
    {
        $mataPelajaran = mata_pelajaran::all();
        $guru = Guru::with('user')->findOrFail($id);
        return view('Role.Operator.Guru.edit', compact('guru', 'mataPelajaran'));
    }

    public function update(Request $request, string $id_guru)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'nip' => 'required|numeric|digits:18|min:18|unique:guru,nip,' . $id_guru . ',id_guru',
            'password' => 'nullable|string|min:8|confirmed',
            'status' => 'required|in:Aktif,Tidak Aktif',
        ], [
            'name.required' => 'Nama guru harus diisi.',
            'nip.required' => 'NIP harus diisi.',
            'nip.unique' => 'NIP sudah terdaftar.',
            'nip.numeric' => 'NIP harus berupa angka.',
            'nip.digits' => 'NIP harus terdiri dari 18 digit.',
            'nip.min' => 'NIP harus terdiri dari minimal 18 digit.',
            'password.min' => 'Password minimal terdiri dari 8 karakter.',
            'password.confirmed' => 'Password dan konfirmasi password tidak cocok.',
            'status.required' => 'Status harus diisi.',
            'status.in' => 'Status harus bernilai "Aktif" atau "Tidak Aktif".',
        ]);

        $guru = Guru::findOrFail($id_guru);
        $guru->nama_guru = $request->name;
        $guru->nip = $request->nip;
        $guru->status = $request->status;

        if ($guru->user) {
            $guru->user->name = $request->name;
        }

        if ($request->filled('password')) {
            $guru->password = bcrypt($request->password);
            if ($guru->user) {
                $guru->user->password = bcrypt($request->password);
                $guru->user->save();
            }
        }

        $guru->save();

        if ($guru->user) {
            $guru->user->save();
        }

        return redirect()->route('Operator.Guru.index')->with('success', 'Guru berhasil diperbarui.');
    }

    public function destroy(string $id)
    {
        $guru = Guru::findOrFail($id);

        if ($guru->status === 'Aktif') {
            return redirect()->route('Operator.Guru.index')->with('error', 'Guru dengan status "Aktif" tidak dapat dihapus.');
        }

        $guru->delete();
        return redirect()->route('Operator.Guru.index')->with('success', 'Guru berhasil dihapus.');
    }
}