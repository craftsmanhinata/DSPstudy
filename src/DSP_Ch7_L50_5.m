%������Ƚϲ�ͬ�Ĳ����������˫���Ա任����ģ���˲���ת��Ϊ�����˲�����ķ�Ƶ��Ӧ��
clc;
clear;
close all;

T=0.05; T1=0.02; 
b=[2,1]; a=[1,3,4]; 
w=0:0.1:10;
[h,w]=freqs(b,a,w);
[bz,az]=bilinear(b,a,1/T); %����˫���Ա任��������Ƶ��Ϊ20
[bz1,az1]=bilinear(b,a,1/T1); %����˫���Ա任��������Ƶ��Ϊ50
wz=0:0.01*pi:0.999*pi;
[hz,wz]=freqz(bz,az,wz);
[hz1,wz]=freqz(bz1,az1,wz);
wz=wz/pi;
figure;plot(w,20*log10(abs(h))); xlabel('kHz');ylabel('���ȣ�dB��');title('ģ���˲�����Ƶ��Ӧ');grid on;
figure;plot(wz,20*log10(abs(hz)),wz,20*log10(abs(hz1)));
legend('T=0.05s','T=0.02s'); 
xlabel('\omega/\pi');ylabel('���ȣ�dB��');title('�����˲�����Ƶ��Ӧ');grid on;

figure;plot(wz/(2*T),20*log10(abs(hz)));
xlabel('hzi');ylabel('���ȣ�dB��');
%axis([0,10]);
set(gca,'XLim',[0 10]);

figure;plot(wz/(2*T1),20*log10(abs(hz1)));
xlabel('hz');ylabel('���ȣ�dB��');
%axis([0,10]);
set(gca,'XLim',[0 10]);