clc;
clear;
close all;

% Sampling parameters
Fs = 1000;              % Sampling frequency (Hz)
T = 1/Fs;               % Sampling period
L = 1000;               % Number of samples
t = (0:L-1)*T;          % Time vector

% Define your signal (example: sum of two sine waves)
f1 = 50;                % Frequency 1
f2 = 120;               % Frequency 2
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

% FFT computation
X = fft(x);

% Magnitude
P2 = abs(X/L);          
P1 = P2(1:L/2+1);       
P1(2:end-1) = 2*P1(2:end-1);

% Frequency axis
f = Fs*(0:(L/2))/L;

% Plot
figure;
subplot(2,1,1);
plot(t,x);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f,P1);
title('Frequency Spectrum (FFT)');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
grid on;
