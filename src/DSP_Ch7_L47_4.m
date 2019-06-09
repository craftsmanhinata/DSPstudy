%���������ڱȽϰ�����˹�͡��б�ѩ���ͺ���Բ���˲����ķ�Ƶ���ԣ����Ƚ���ͬ�����ķ�Ƶ���Ժ�Ⱥʱ�ӡ�
clc;
clear;
close all;

Rp=1;Rs=30;
wp=0.2;ws=0.3;
N=4;

[bb,ab]=butter(N,wp);
gb= grpdelay(bb,ab,128);
[bc,ac]=cheby1(N,Rp,wp);
gc= grpdelay(bc,ac,128);
[be,ae]=ellip(N,Rp,Rs,wp);
ge= grpdelay(be,ae,128);   

w=0:0.01:2.5; 
ww=(1:50)/25;%(1:50)/25;
figure; 
plot(ww,gb(1:50),'-',ww,gc(1:50),'-.',ww,ge(1:50),'--','LineWidth',1.5); 
grid on;
xlabel('\lambda');ylabel('ʱ��');
title('������ͬʱ����ͬ�˲�����Ⱥʱ��'); 
legend('������˼','�б�ѩ��I','��Բ');

[z,p,k]=buttap(N); [bb,ab]=zp2tf(z,p,k); 
[zc,pc,kc]=cheb1ap(N,Rp); [bc,ac]=zp2tf(zc,pc,kc);
[ze,pe,ke]=ellipap(N,Rp,Rs); [be,ae]=zp2tf(ze,pe,ke);

[h,w]=freqs(bb,ab,w); 
[h1,w1]=freqs(bc,ac,w); 
[h2,w2]=freqs(be,ae,w); 

figure; plot(w,abs(h),'-',w,abs(h1),'-.',w,abs(h2),'--','LineWidth',1.5); grid on;
xlabel('\lambda');ylabel('����ƽ������');
title('����Ϊ4ʱ����ͬԭ���˲����ķ�Ƶ��Ӧ'); 
legend('������˼','�б�ѩ��I','��Բ'); 