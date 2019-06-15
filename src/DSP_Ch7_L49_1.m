%��������������Ӧ���䷨���IIR���ֵ�ͨ�˲�����
%ָ�����£�1��ͨ����ֹƵ��0.1�� rad��
%�����ʼƵ��0.2�� rad��
%ͨ�����˥����p=3dB�������С˥����s=30dB
%T=0.01s��T=0.5s

clc; 
clear;
close all;

T=0.01; 
Wp=0.1*pi/T;Ws=0.2*pi/T;Rp=3;Rs=30; %��ģ���˲�������ָ��
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s');
[b,a]=butter(N,Wc,'s');
[bz,az]=impinvar(b,a,1/T);    %����������Ӧ���䷨�������˲���ϵͳ����

T1=0.5; 
Wp=0.1*pi/T1;Ws=0.2*pi/T1;Rp=3;Rs=30; 
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); 
[b1,a1]=butter(N,Wc,'s'); 
[bz1,az1]=impinvar(b1,a1,1/T1);

w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);
[h1,w]=freqz(bz1,az1,w);
w=w/pi;
figure; plot(w,20*log10(abs(h)),'LineWidth',1.5); hold on;
plot(w,20*log10(abs(h1)),'k--','LineWidth',1.5); 
xlabel('\omega/\pi');ylabel('���ȣ�dB��');title('�����˲�����Ƶ��Ӧ');grid on;

w = 0:0.1:1/T;     
[h2,w] = freqs(b,a,w); 
figure; plot(w,20*log10(abs(h2)/max(abs(h2))),'LineWidth',1.5); 
xlabel('Hz');ylabel('���ȣ�dB��');title('T=0.01sģ���˲�����Ƶ��Ӧ');grid on;

w = 0:0.1:1/T1;     
[h2,w] = freqs(b1,a1,w); 
figure; plot(w,20*log10(abs(h2)/max(abs(h2))),'LineWidth',1.5); 
xlabel('Hz');ylabel('���ȣ�dB��');title('T=0.5sģ���˲�����Ƶ��Ӧ');grid on