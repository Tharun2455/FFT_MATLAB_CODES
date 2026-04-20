clc;
clear;
close all;

% Sampling
Fs = 1000;                 % Sampling frequency
t = 0:1/Fs:1-1/Fs;         % Time vector

% Original clean signal
f_signal = 50;
x_clean = sin(2*pi*f_signal*t);

% Add noise
noise = 0.8*randn(size(t));
x_noisy = x_clean + noise;

% FFT of noisy signal
X = fft(x_noisy);

% Frequency axis
N = length(X);
f = (-N/2:N/2-1)*(Fs/N);

% Shift FFT for visualization
X_shift = fftshift(X);

% --- Simple Low Pass Filter ---
cutoff = 100;   % Hz (keep only low frequencies)

H = abs(f) < cutoff;   % filter mask

% Apply filter
X_filtered = X_shift .* H;

% Inverse FFT
x_filtered = real(ifft(ifftshift(X_filtered)));

% Plot
figure;

subplot(3,1,1);
plot(t, x_clean);
title('Original Signal');

subplot(3,1,2);
plot(t, x_noisy);
title('Noisy Signal');

subplot(3,1,3);
plot(t, x_filtered);
title('Filtered Signal (Noise Removed)');
