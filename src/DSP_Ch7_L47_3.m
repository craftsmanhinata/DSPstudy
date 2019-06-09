%���������������Բ�͹�һ��ģ���ͨ�˲���
clc;
clear;
close all;

Wp=1;Ws=3;Rp=1;Rs=40;              %�����˲�������ָ��
[N,Wpo]=ellipord(Wp,Ws,Rp,Rs,'s');            %�����˲���������ͨ����ֹƵ��
[z,p,k]=ellipap(N,Rp,Rs);                              %���һ���˲������㼫��
[b,a]=zp2tf(z,p,k);                                          %���˲���ϵͳ�������ӡ���ĸ����ʽϵ��
w=0:0.02:5; 
[h,w]=freqs(b,a,w); 
figure;
plot(w,20*log10(abs(h)));grid on;
xlabel('\lambda');ylabel('A(\lambda)(dB)');
title('��Բ�͹�һ����ͨ�˲����ķ�Ƶ��Ӧ');