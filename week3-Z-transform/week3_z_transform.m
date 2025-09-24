%% Week 3 – Z-transform Assignment
% Author: Your Name
% Course: DSP
% ------------------------------------------------------------

clear; clc; close all;
syms n z

%% A1 – Warm-up: Finite Sequences → Polynomials
% (i)
X1 = 1 + 2*z^(-1) + 5*z^(-2);
disp('A1(i) X(z) =');
pretty(X1)

% (ii)
X2 = 0 + 3*z^(-1) + 0*z^(-2) + 4*z^(-3);
disp('A1(ii) X(z) =');
pretty(X2)

%% A2 – Infinite Sequences & ROC

% (a) x[n] = (0.6)^n u[n]
a = 0.6;
X_a = ztrans(a^n * heaviside(n), n, z);
disp('A2(a), a=0.6:');
pretty(X_a)
% ROC: |z| > 0.6

% (b) x[n] = (-0.8)^n u[n]
X_b = ztrans((-0.8)^n * heaviside(n), n, z);
disp('A2(b), a=-0.8:');
pretty(X_b)
% ROC: |z| > 0.8

% (c) x[n] = -(0.9)^n u[-n-1]   left-sided
X_c = ztrans(-(0.9)^n * heaviside(-n-1), n, z);
disp('A2(c), left-sided seq:');
pretty(X_c)
% ROC: |z| < 0.9
%% A3 – Properties: Linearity & Shifting
x1 = (0.5)^n * heaviside(n);
x2 = (-0.5)^n * heaviside(n);

% (a) linearity
X_lin = ztrans(2*x1 - 3*x2, n, z);
disp('A3(a) Linearity:'); pretty(X_lin)

% (b) shift: x1[n-3]
X_shift = ztrans(subs(x1, n, n-3), n, z);
disp('A3(b) Shift:'); pretty(X_shift)

%% A4 – Inverse Z-Transform
Xa = 1 / (1 - 0.7*z^(-1));
xa = iztrans(Xa, z, n);
disp('A4(a) inverse ZT:');
pretty(xa)

Xb = (1 - 0.5*z^(-1)) / (1 - 0.8*z^(-1));
xb = iztrans(Xb, z, n);
disp('A4(b) inverse ZT:');
pretty(xb)

%% A5 – H(z), Poles/Zeros & Frequency Response
b = [1 -2.4 2.88];
a = [1 -0.8 0.64];

% (a) Poles and zeros
figure; zplane(b,a); grid on; title('A5(a) Pole-Zero Plot');

% (b) Frequency response
[H,w] = freqz(b,a,512);
figure;
subplot(2,1,1);
plot(w/pi, abs(H)); grid on; ylabel('|H|'); title('Magnitude Response');
subplot(2,1,2);
plot(w/pi, angle(H)); grid on; xlabel('\omega/\pi'); ylabel('Phase');

% (c) Test signal – optional
n_num = 0:511;
x = sin(0.2*pi*n_num) + 0.5*sin(0.8*pi*n_num);
y = filter(b,a,x);
figure; plot(n_num, [x' y']); legend('Input','Output'); title('Filter response')