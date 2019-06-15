%����MATLAB��������Ӧ���䷨�⺯�����IIR���ֵ�ͨ�˲�����
%����ָ�����£�1��ͨ����ֹƵ�ʦ�p=4000�� rad/s�������ʼƵ�ʦ�s=8000�� rad/s
%ͨ�����˥����p=3dB�������С˥����s=30dB
%T=0.1ms��T=0.05ms

clc;
clear;
close all; 
f1=10000;f2=20000;
Wp=4000*pi;Ws=8000*pi;Rp=3;Rs=30; %ģ���˲�������ָ��
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); 
[b,a]=butter(N,Wc,'s'); 
[bz,az]=impinvar(b,a,f1);%����������Ӧ���䷨�������˲���ϵͳ����
[bz1,az1]=impinvar(b,a,f2); 

w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);
[h1,w]=freqz(bz1,az1,w);
w=w/pi;
figure; 
plot(w,20*log10(abs(h)),'-.',w,20*log10(abs(h1)),'-','LineWidth',1.5); 
legend('T=0.1ms','T=0.05ms'); 
xlabel('\omega/\pi');ylabel('���ȣ�dB��');title('�����˲�����Ƶ��Ӧ');grid on;