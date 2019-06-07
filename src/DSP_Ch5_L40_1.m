% 全通滤波器设计
N=256;                    % FFT 长度
s(1:400)=0;
n=1:60;
s(n)=(1+0.4*sin(0.05*pi*n)).*sin(0.25*pi*n);
s(n+60)=(1+0.4*sin(0.05*pi*(n-60))).*sin(0.5*pi*(n-60));
s(n+120)=(1+0.4*sin(0.05*pi*(n-120))).*sin(0.85*pi*(n-120));

h(1:60)=0; 
h(50)=1; 
H=fft(h,N);
theta=angle(H);
theta=unwrap(theta);
n=1:N; 

figure(1);

subplot(2,1,1); 
plot(n*2/N,abs(H)); 
xlabel('Normalized Frequency(\times\pi rad/sample)'); 
ylabel('Magnitude'); 
grid on; 

subplot(2,1,2); 
plot(n*2/N,theta); 
xlabel('Normalized Frequency(\times\pi rad/sample)'); 
ylabel('Phase'); 
grid on; 

figure(2);
subplot(2,1,1);
plot(s); 
grid on;

s2=conv(s,h);
subplot(2,1,2); 
plot(s2(1:400)); 
grid on;