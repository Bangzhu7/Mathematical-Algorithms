% Exercise 11: FIR Types I–IV — Magnitude, Phase, and Zero Plots
% See Lecture 6, slides 16–17
% - Defines four FIR filters (Types I–IV) via impulse responses
% - Plots Magnitude, Phase (unwrapped), and Pole-Zero diagrams
% - Organizes plots as 4 rows (Type I–IV) x 3 cols (Mag | Phase | Z-plane)
% - Saves the figure to results/ex11_results.png

clear; close all; clc;

% Impulse responses (given)
h1 = [1 2 3 4 4 3 2 1]; % Type I (M even, symmetric)
h2 = [1 2 3 4 3 2 1]; % Type II (M odd, symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1]; % Type III (M even, antisymmetric)
h4 = [-1 -2 -3 0 3 2 1]; % Type IV (M odd, antisymmetric)

filters = {h1, h2, h3, h4};
titles = { ...
'FIR Type I (M even, symmetric)', ...
'FIR Type II (M odd, symmetric)', ...
'FIR Type III (M even, antisymmetric)', ...
'FIR Type IV (M odd, antisymmetric)'};

% Create results folder
outDir = fullfile(pwd, 'results');
if ~exist(outDir, 'dir'); mkdir(outDir); end

% Detect availability of toolbox functions
hasFreqz = ~isempty(which('freqz'));
hasZplane = ~isempty(which('zplane'));

% Figure layout: 4 rows (Type I–IV) x 3 columns (Mag | Phase | Z-plane)
fig = figure('Name', 'Exercise 11 – FIR Types I–IV', 'Color', 'w', 'Position', [100 100 1400 1000]);
tiledlayout(4,3, 'Padding','compact', 'TileSpacing','compact');

% Fallback FFT parameters (used if freqz is unavailable)
Nfft = 2048;
halfN = Nfft/2 + 1; % number of bins from 0..pi

for k = 1:4
h = filters{k};

text
% Frequency response
if hasFreqz
    [H, w] = freqz(h, 1, 512);       % [0, pi]
else
    Hfull = fft(h, Nfft);
    H     = Hfull(1:halfN).';        % column vector for [0, pi]
    w     = linspace(0, pi, halfN).'; % rad/sample
end
magH = abs(H);
phH  = unwrap(angle(H));

% Magnitude
nexttile;
plot(w/pi, magH, 'b', 'LineWidth', 1.4); grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('|H(e^{j\omega})|');
title(sprintf('%s — Magnitude', titles{k}));
xlim([0 1]);

% Phase (unwrapped)
nexttile;
plot(w/pi, phH, 'r', 'LineWidth', 1.2); grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Unwrapped Phase (rad)');
title(sprintf('%s — Phase', titles{k}));
xlim([0 1]);

% Pole-Zero plot
nexttile;
if hasZplane
    zplane(h, 1);
    title(sprintf('%s — Z-plane', titles{k}));
else
    % Fallback: plot zeros and unit circle
    z = roots(h);
    plot(real(z), imag(z), 'ob', 'MarkerFaceColor','b'); hold on; grid on; axis equal;
    th = linspace(0, 2*pi, 400);
    plot(cos(th), sin(th), 'k--');
    xlim([-1.2 1.2]); ylim([-1.2 1.2]);
    xlabel('Real'); ylabel('Imag');
    title(sprintf('%s — Z-plane (fallback)', titles{k}));
    hold off;
end
end

% Save figure
outPath = fullfile(outDir, 'ex11_results.png');
exportgraphics(fig, outPath, 'Resolution', 200);
disp(['Saved figure: ' outPath]);

% Optional: also save as .fig for MATLAB
savefig(fig, fullfile(outDir, 'ex11_results.fig'));
disp('Saved MATLAB .fig in results/');

% Notes on expected behavior:
% - Type I, II: symmetric -> linear phase; magnitude nonzero at w=0 (DC).
% - Type III: antisymmetric with even M -> H(0) = 0 (zero at DC).
% - Type IV: antisymmetric with odd M -> H(pi) = 0 (zero at Nyquist).
% - Zeros come in conjugate pairs for real coefficients; FIR has all zeros (no poles except at origin in some forms).
% - Linear phase => approximately straight-line unwrapped phase vs frequency.