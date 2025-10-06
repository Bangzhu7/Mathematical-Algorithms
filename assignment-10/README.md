Moving Average Filter Analysis in MATLAB
Overview

This MATLAB script demonstrates the frequency response and zero-pole analysis of 5-point and 9-point moving average filters. Moving average filters are commonly used in signal processing to smooth signals and reduce noise.

The code performs the following tasks:

Normalizes the filter coefficients.

Plots the frequency response of both filters.

Computes the zero-pole representation of the filters.

Plots the zero-pole diagrams to visualize filter stability and behavior.

Files

moving_average_analysis.m — Main MATLAB script containing the code for frequency response and zero-pole analysis.

Instructions

Define the filter coefficients:

b1 = [1 1 1 1 1]; % 5-point moving average
a1 = 1;

b2 = [1 1 1 1 1 1 1 1 1]; % 9-point moving average
a2 = 1;

Normalize the coefficients:

b1n = b1 / sum(b1);
b2n = b2 / sum(b2);

Plot the frequency response:

figure;
subplot(2,1,1); freqz(b1n, a1, 1024); title("5-point Moving Average");
subplot(2,1,2); freqz(b2n, a2, 1024); title("9-point Moving Average");

Compute zeros, poles, and gain:

[z1, p1, k1] = tf2zpk(b1n, a1);
[z2, p2, k2] = tf2zpk(b2n, a2);

Plot the zero-pole diagrams:

figure;
subplot(2,1,1); zplane(z1, p1); title("Zero-Pole Plot for 5-point Moving Average");
subplot(2,1,2); zplane(z2, p2); title("Zero-Pole Plot for 9-point Moving Average");

Output

Frequency Response Plots — Shows magnitude and phase response for 5-point and 9-point moving average filters.

Zero-Pole Plots — Displays the location of zeros and poles of the filters, useful for analyzing filter stability and behavior.

Notes

The moving average filter is a type of FIR filter. Since a = 1, all poles are at the origin.

Increasing the number of points (e.g., from 5 to 9) makes the filter smoother but reduces its responsiveness to rapid signal changes.
