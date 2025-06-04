<?php

namespace App\Http\Controllers;

use App\Models\latihan;
use App\Models\kurikulum;
use App\Models\mata_pelajaran;
use App\Models\soal;
use App\Models\guru;
use App\Models\kelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class LatihanSoalController extends Controller
{
    public function index(Request $request)
    {
        $latihan = latihan::orderBy('id_latihan', 'DESC')->get();
        $id_latihan = $request->query('id_latihan');
        $kurikulums = kurikulum::all();
        $mapel = mata_pelajaran::all();
        $mataPelajarans = mata_pelajaran::with(['operator', 'kurikulum'])->get();
        $kelas = kelas::all();
        $user = auth()->user();

        return view('Role.Guru.Latihan.index', compact('latihan', 'mataPelajarans', 'user', 'kurikulums', 'mapel', 'kelas', 'id_latihan'));
    }

    public function create(Request $request)
    {
        $id_kurikulum = $request->input('id_kurikulum');

        // Get all kurikulum and classes
        $kurikulums = kurikulum::all();
        $kelas = kelas::all();
        $user = auth()->user();

        // If a kurikulum is selected, get the first mata pelajaran that matches
        if ($id_kurikulum) {
            $mapel = mata_pelajaran::where('id_kurikulum', $id_kurikulum)->first();
        } else {
            $mapel = null;
        }

        $mataPelajarans = mata_pelajaran::with(['operator', 'kurikulum'])->get();

        // Return the view with the selected mata pelajaran and other data
        return view('Role.Guru.Latihan.create', compact('mataPelajarans', 'mapel', 'kurikulums', 'kelas', 'user'));
    }


    public function store(Request $request)
    {
        // Log the request data to check if everything is correct
        Log::info('Request data:', $request->all());

        // Validasi input
        $validated = $request->validate([
            'Topik' => 'required|string|max:255',
            'id_kurikulum' => 'required|exists:kurikulum,id_kurikulum',
            'id_mata_pelajaran' => 'required|exists:mata_pelajaran,id_mata_pelajaran',
            'id_kelas' => 'required|exists:kelas,id_kelas',
            'acak' => 'required|in:Aktif,Tidak Aktif',
            'status_jawaban' => 'required|in:Aktif,Tidak Aktif',
            'grade' => 'required|integer|min:100|max:100',
        ],[
            'Topik.required' => 'Topik harus diisi',
            'id_kurikulum.required' => 'Kurikulum Harus dipilih',
            'id_mata_pelajaran' => 'Mata Pelajaran Harus dipilih',
            'id_kelas' => 'Kelas harus dipilih',
            'acak' => 'Pilih acak soal',
            'status_jawaban' => 'Pilih status jawaban',
            'grade' => 'Grade min 100 max 100'

        ]);

        // Log the validated data
        Log::info('Validated data:', $validated);

        $idUser   = auth()->user()->id;
        $guru = guru::where('id_user', $idUser)->first();

        if (!$guru) {
            throw new \Exception('Guru tidak ditemukan untuk pengguna yang sedang login.');
        }
        // Menyimpan data latihan
        $latihan = latihan::create([
            'Topik' => $validated['Topik'],
            'acak' => $validated['acak'],
            'status_jawaban' => $validated['status_jawaban'],
            'grade' => $validated['grade'],
            'id_guru' => $guru->id_guru,
            'id_kurikulum' => $validated['id_kurikulum'],
            'id_mata_pelajaran' => $validated['id_mata_pelajaran'],
            'id_kelas' => $validated['id_kelas'],
        ]);

        // Log the created `latihan` object
        Log::info('Latihan created:', ['id_latihan' => $latihan->id]);

        // Redirect atau kembali dengan pesan sukses
        return redirect()->route('Guru.Latihan.index')->with('success', 'Latihan berhasil dibuat.');
    }

    public function show(latihan $latihanSoal)
    {
        return view('Role.Guru.Latihan.index', compact('mataPelajarans', 'mapel', 'kurikulums', 'kelas', 'user'));
    }

    public function edit(Request $request, $id_latihan)
    {
        $id_kurikulum = $request->input('id_kurikulum');
        $kurikulums = kurikulum::all();
        $kelas = kelas::all();
        $user = auth()->user();

        $latihan = latihan::where('id_latihan', $id_latihan)->firstOrFail();

        if ($id_kurikulum) {
            $mapel = mata_pelajaran::where('id_kurikulum', $id_kurikulum)->first();
        } else {
            $mapel = null;
        }

        $mataPelajarans = mata_pelajaran::with(['operator', 'kurikulum'])->get();

        return view('Role.Guru.Latihan.edit', compact('mataPelajarans', 'mapel', 'kurikulums', 'id_latihan', 'kelas', 'user', 'latihan'));
    }


    public function update(Request $request, $id_latihan)
    {
        $validated = $request->validate([
            'Topik' => 'required|string|max:255',
            'id_kurikulum' => 'required|exists:kurikulum,id_kurikulum',
            'id_mata_pelajaran' => 'required|exists:mata_pelajaran,id_mata_pelajaran',
            'id_kelas' => 'required|exists:kelas,id_kelas',
            'acak' => 'required|in:Aktif,Tidak Aktif',
            'status_jawaban' => 'required|in:Aktif,Tidak Aktif',
            'grade' => 'required|integer|min:100|max:100',
        ]);

        $latihan = latihan::findOrFail($id_latihan);
        $latihan->update($validated);

        return redirect()->route('Guru.Latihan.index')->with('success', 'Latihan berhasil diperbarui.');
    }

    public function destroy(latihan $latihanSoal)
    {
        if ($latihanSoal->Image) {
            Storage::disk('public')->delete($latihanSoal->Image);
        }

        $latihanSoal->delete();

        return redirect()->route('Guru.Latihan.index')->with('success', 'Latihan Soal deleted successfully.');
    }
}
