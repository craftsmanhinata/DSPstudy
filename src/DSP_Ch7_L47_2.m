%��������������б�ѩ��I�͹�һ��ģ���ͨ�˲���
clc;
clear;
close all;

Wp=1;Ws=3;Rp=1;Rs=40;              %�����˲�������ָ��,RpΪͨ�����˥����RsΪ�����С˥��
[N,Wpo]=cheb1ord(Wp,Ws,Rp,Rs,'s');          %�����˲���������ͨ����ֹƵ��
[z,p,k]=cheb1ap(N,Rp);                 %���һ���˲������㼫��
[b,a]=zp2tf(z,p,k);                     %���˲���ϵͳ�������ӡ���ĸ����ʽϵ��
w=0:0.02:5; 
[h,w]=freqs(b,a,w); 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('\lambda');ylabel('A(\lambda)(dB)');
title('�б�ѩ��I�͹�һ����ͨ�˲����ķ�Ƶ��Ӧ');