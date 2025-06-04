<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        // Explicitly clear all session data before authenticating
        $request->session()->flush();
        
        // Authenticate the user
        $request->authenticate();
        
        // Regenerate the session after authentication to avoid session fixation
        $request->session()->regenerate();
        
        // Get the authenticated user
        $user = Auth::user();
        
        // Redirect based on the user's role
        if ($user->hasRole('Admin')) {
            return redirect()->route('Admin.Akun.index');
        } elseif ($user->hasRole('Guru')) {
            return redirect()->route('Guru.Course.index');
        } elseif ($user->hasRole('Siswa')) {
            return redirect()->route('Siswa.Course.index');
        } elseif ($user->hasRole('Operator')) {
            return redirect()->route('Operator.Kurikulum.index');
        }
        
        // Fallback redirect to login if no valid role is found
        return redirect()->route('login');
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        // Logout the user
        Auth::guard('web')->logout();

        // Invalidate the session
        $request->session()->invalidate();

        // Regenerate the CSRF token to prevent attacks
        $request->session()->regenerateToken();

        // Redirect to the home page after logging out
        return redirect('/');
    }
}
