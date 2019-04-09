%% example1:x(n) = (0.9)^n
clear;
close all;
n = -10 : 10;
x = (-0.9) .^ n;
k = -200 : 200;
w = (pi / 100) * k;
y = x*(exp((-1i) * pi / 100)) .^ (n' * k);
magy = abs(y);
angy = angle(y);

figure;
plot(w, magy);
xlabel('Frequency');
ylabel('|y|');
grid on;

figure;
plot(w, angy);
xlabel('Frequency');
ylabel('angle');
grid on;

%% example2 x(n) = R6(n)
clear;
close all;
n1 = 600;
%x1 = [1 1 1 1 1 1];
x1 = ones(1, n1);
k1 = -100 : 100;
w1 = (pi / 100) * k1;
y1 = (exp( (-1i) * ((n1 - 1) / 2) * w1) .* sin(n1 * w1 / 2) ./ sin(w1 / 2));


magy1 = abs(y1);
angy1 = angle(y1);

figure;
plot(w1, magy1);
xlabel('Frequency');
ylabel('|y1|');
grid on;

figure;
plot(w1, angy1);
xlabel('Frequency');
ylabel('angle of y1');
grid on;

figure;
plot(real(y1), imag(y1), 'xr');
grid on

