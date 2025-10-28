

% ex12_main.m
% FIR Ideal Low-Pass (sinc) filter: impulse and frequency responses
% Robust for MATLAB and GNU Octave (no exportgraphics; safe TeX usage)

clear; close all; clc;

% Output folder
outDir = fullfile(pwd, 'figures');
if ~exist(outDir, 'dir'); mkdir(outDir); end

% Parameters
wc = 1; % cutoff frequency [rad]
Nfft = 1024; % FFT length (use consistently)
w_fft = linspace(-pi, pi, Nfft); % frequency axis for FFT plots
M_list = [20 64];

% Storage for comparison plot
H_all = cell(numel(M_list), 1);
labels = arrayfun(@(m) sprintf('M = %d', m), M_list, 'UniformOutput', false);

for k = 1:numel(M_list)
M = M_list(k);
n = 0:M;

text
% Ideal low-pass impulse response (truncated sinc)
h = sin(wc*(n - M/2)) ./ (pi*(n - M/2));
h(n == M/2) = wc/pi;  % handle 0/0 exactly

% Optional: enforce DC gain exactly 1
% h = h / sum(h);

% Frequency response (store for comparison)
H = fft(h, Nfft);
H_all{k} = H;

% ---- Plot impulse response (indexed) ----
figure;
stem(n, h, 'filled'); grid on;
title(['Impulse Response h_{LP}(n), ' labels{k}], 'Interpreter', 'tex');
xlabel('n'); ylabel('h_{LP}(n)', 'Interpreter', 'tex');
xlim([0 M]);
set(gcf,'Renderer','painters'); % safe renderer
print('-dpng', fullfile(outDir, sprintf('hLP_M%d.png', M)));

% ---- Optional: centered view (nice to verify symmetry) ----
% m = n - M/2;
% figure;
% stem(m, h, 'filled'); grid on;
% title(['Centered Impulse Response h_{LP}(m), ' labels{k}], 'Interpreter', 'tex');
% xlabel('m = n - M/2'); ylabel('h_{LP}(m)', 'Interpreter', 'tex');
% xlim([min(m) max(m)]);
% print('-dpng', fullfile(outDir, sprintf('hLP_M%d_centered.png', M)));

% ---- Optional: single magnitude plot for this M (FFT-based) ----
% figure;
% plot(w_fft/pi, abs(fftshift(H)), 'LineWidth', 1.2); grid on;
% title(['Magnitude |H_{LP}(e^{j\omega})|, ' labels{k}], 'Interpreter', 'tex');
% xlabel('\omega/\pi', 'Interpreter', 'tex'); ylabel('|H_{LP}|', 'Interpreter', 'tex');
% xlim([-1 1]);
% print('-dpng', fullfile(outDir, sprintf('HLP_M%d_fft.png', M)));
end

% Safety check before comparison
assert(~isempty(H_all) && ~any(cellfun(@isempty, H_all)), ...
'H_all is empty. Compute H responses before comparison plot.');

% ---- Combined comparison plot (FFT-based, −π..π) ----
figure; hold on; grid on;
colors = lines(numel(M_list));
for k = 1:numel(M_list)
Hk = H_all{k};
% Build matching frequency axis for this H
wk = linspace(-pi, pi, numel(Hk));
plot(wk/pi, abs(fftshift(Hk)), 'LineWidth', 1.4, 'Color', colors(k,:));
end
title('Magnitude Response Comparison |H_{LP}(e^{j\omega})|', 'Interpreter', 'tex');
xlabel('\omega/\pi', 'Interpreter', 'tex'); ylabel('|H_{LP}|', 'Interpreter', 'tex');
xlim([-1 1]);
legend(labels, 'Location', 'SouthWest');
print('-dpng', fullfile(outDir, 'HLP_compare.png'));

disp('Done. Saved: figures/hLP_M20.png, figures/hLP_M64.png, figures/HLP_compare.png');