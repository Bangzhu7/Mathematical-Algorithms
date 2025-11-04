close all; clear; clc;

% Reproducibility
rng(0);

% 1) Load image (grayscale, double)
I = im2double(rgb2gray(imread('peppers.png')));

% 2) Add different noise types
I_gauss = imnoise(I,'gaussian',0,0.01);
I_sp = imnoise(I,'salt & pepper',0.05);

figure;
tiledlayout(1,3,'Padding','compact','TileSpacing','compact');
nexttile; imshow(I); title('Original');
nexttile; imshow(I_gauss); title('Gaussian noise');
nexttile; imshow(I_sp); title('Salt & pepper noise');

% 3) Simple quality metrics (MSE vs original)
MSE_gauss_noisy = immse(I_gauss, I);
MSE_sp_noisy = immse(I_sp, I);
fprintf('Noisy MSE — Gaussian: %.4f | Salt&Pepper: %.4f\n', MSE_gauss_noisy, MSE_sp_noisy);

% 4) Linear filtering (mean and Gaussian filters)
h_avg = fspecial('average',3);
h_gauss = fspecial('gaussian',[3 3],0.7);

I_avg_gauss = imfilter(I_gauss, h_avg, 'replicate');
I_gauss_gauss = imfilter(I_gauss, h_gauss, 'replicate');

I_avg_sp = imfilter(I_sp, h_avg, 'replicate');
I_gauss_sp = imfilter(I_sp, h_gauss, 'replicate');

% 5) Non-linear filtering (median)
I_med_gauss = medfilt2(I_gauss,[3 3]);
I_med_sp = medfilt2(I_sp, [3 3]);

% 6) Visual comparison
figure;
tiledlayout(2,4,'Padding','compact','TileSpacing','compact');

% Salt & pepper row
nexttile; imshow(I_sp); title('S&P noisy');
nexttile; imshow(I_avg_sp); title('S&P → mean 3x3');
nexttile; imshow(I_gauss_sp); title('S&P → gauss 3x3');
nexttile; imshow(I_med_sp); title('S&P → median 3x3');

% Gaussian row
nexttile; imshow(I_gauss); title('Gaussian noisy');
nexttile; imshow(I_avg_gauss); title('Gaussian → mean 3x3');
nexttile; imshow(I_gauss_gauss); title('Gaussian → gauss 3x3');
nexttile; imshow(I_med_gauss); title('Gaussian → median 3x3');

% 7) Compare metrics after filtering (MSE)
MSE_sp_avg = immse(I_avg_sp, I);
MSE_sp_gauss = immse(I_gauss_sp, I);
MSE_sp_med = immse(I_med_sp, I);

MSE_g_avg = immse(I_avg_gauss, I);
MSE_g_gauss = immse(I_gauss_gauss, I);
MSE_g_med = immse(I_med_gauss, I);

fprintf('After filtering (S&P): mean=%.4f | gauss=%.4f | median=%.4f\n', MSE_sp_avg, MSE_sp_gauss, MSE_sp_med);
fprintf('After filtering (Gauss): mean=%.4f | gauss=%.4f | median=%.4f\n', MSE_g_avg, MSE_g_gauss, MSE_g_med);