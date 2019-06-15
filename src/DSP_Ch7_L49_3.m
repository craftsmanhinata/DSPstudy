%������Ƚϲ�ͬ�Ĳ����������������Ӧ���䷨��ģ���˲���ת��Ϊ�����˲�����ķ�Ƶ��Ӧ��
%��֪ģ���˲�����ϵͳ����
clc;
clear;
close all;

T=0.5;
T1=0.05; 
b=[0 0 3];
a=[1 4 3];
[bz,az]=impinvar(b,a,1/T); %����������Ӧ���䷨�������˲�����ϵͳ����
[bz1,az1]=impinvar(b,a,1/T1); 
w=0:0.01*pi:pi; 
[h,w] = freqz(bz,az,w); %�������˲�����Ƶ����Ӧ
[h1,w] = freqz(bz1,az1,w); 

w=w/pi; 
figure; 
plot(w,20*log10(abs(h)),'-',w,20*log10(abs(h1)),'k--','LineWidth',2); 
legend('T=0.5s','T=0.05s'); 
xlabel('\omega/\pi');ylabel('���ȣ�dB��');title('�����˲�����Ƶ��Ӧ');grid on;