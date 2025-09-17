% Task 1: Generate and plot common continuous-time signals
% Define a time vector (covers negative and positive times)
t = -5:0.01:5;   % from -5 to 5 with 0.01 step

%% 1) Unit Impulse (approximated with a very narrow pulse)
delta = (t == 0);   % 1 only at t=0 (discrete approx)
figure;
stem(t, delta, 'filled');   % stem is better for impulse
title('Unit Impulse \delta(t)');
xlabel('Time (t)');
ylabel('\delta(t)');
grid on;

%% 2) Unit Step u(t)
u = double(t >= 0);   % 1 for t>=0, else 0
figure;
plot(t, u, 'LineWidth', 1.5);
title('Unit Step u(t)');
xlabel('Time (t)');
ylabel('u(t)');
grid on;

%% 3) Unit Ramp r(t)
r = t .* (t >= 0);   % t for t>=0, else 0
figure;
plot(t, r, 'LineWidth', 1.5);
title('Unit Ramp r(t)');
xlabel('Time (t)');
ylabel('r(t)');
grid on;

%% 4) Exponential Signal e^{a t}
a = -0.5;           % decay rate (change to see growth/decay)
x_exp = exp(a * t);
figure;
plot(t, x_exp, 'LineWidth', 1.5);
title(['Exponential Signal e^{', num2str(a), 't}']);
xlabel('Time (t)');
ylabel('e^{a t}');
grid on;

%% 5) Signum Signal sgn(t)
sgn = sign(t);      % -1 for t<0, 0 at t=0, 1 for t>0
figure;
plot(t, sgn, 'LineWidth', 1.5);
title('Signum Signal sgn(t)');
xlabel('Time (t)');
ylabel('sgn(t)');
ylim([-1.5 1.5]);   % fix y limits
grid on;

%% 6) Sinc Signal sinc(t) = sin(pi t)/(pi t)
x_sinc = sinc(t);   % MATLAB sinc(x) = sin(pi*x)/(pi*x)
figure;
plot(t, x_sinc, 'LineWidth', 1.5);
title('Sinc Signal sinc(t)');
xlabel('Time (t)');
ylabel('sinc(t)');
grid on;
