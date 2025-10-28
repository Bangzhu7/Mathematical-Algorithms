Exercise 12: FIR Low-Pass Filter (Ideal Sinc) — Impulse and Frequency Response

How to run

Open MATLAB or GNU Octave.
cd into exercise12_fir_lowpass.
Run: ex12_main
Figures saved to figures/: hLP_M20.png, hLP_M64.png, HLP_compare.png.
Observations

Increasing M increases the impulse response length (M+1 taps), giving a closer time-domain approximation to the ideal sinc.
As M grows (20 → 64), the transition band narrows and the cutoff becomes sharper around ωc/π = wc/π.
A higher M reduces the main-lobe width in frequency, improving selectivity; sidelobe spacing becomes denser, and the overall magnitude response looks smoother.
Because this is an unwindowed truncation, sidelobe levels are not strongly reduced; a window could trade transition width for lower ripple.
Parameters

M ∈ {20, 64}, wc = 1 rad, Nfft = 1024, n = 0:M.
Environment

MATLAB/Octave version:
OS:
Name/Date:
Notes

Titles/labels use TeX safely (no invalid escapes).
The comparison plot uses consistent Nfft and checks that responses are computed before plotting.
