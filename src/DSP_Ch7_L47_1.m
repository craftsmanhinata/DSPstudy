%������������ư�����˹�͹�һ��ģ���ͨ�˲���
clc;
clear;
close all;

Wp=1;Ws=4;Rp=3;Rs=40;               %�����˲�������ָ��,RpΪͨ�����˥����RsΪ�����С˥��
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); %�����˲���������3dB��ֹƵ��
[z,p,k]=buttap(N);                   %���һ���˲������㼫��
[b,a]=zp2tf(z,p,k);                 %���˲���ϵͳ�������ӡ���ĸ����ʽϵ��
w=0:0.1:6;%��0��6��Χ��ȡ61��
[h,w]=freqs(b,a,w);%����Ƶ������w�ϵ�Ƶ����Ӧ
figure;
plot(w,20*log10(abs(h)));
grid on;xlabel('\lambda');ylabel('A(\lambda)(dB)');
title('������˼��һ����ͨ�˲����ķ�Ƶ��Ӧ'); 