%IIR�����˲�����ƣ������ð�����˹�͡��б�ѩ��I��II�ͺ���Բ���˲��������ܡ�
clc;
clear;
close all;

%��ȡ�ź�
s_in = wavread('music1-32.wav'); 
L = length(s_in);   
Fs = 30000;     %����Ƶ�ʣ���λ��Hz��
% ���������źŷ�Ƶ����
S_inAA = meanfft(s_in,L); 
plot((-2047:2048)/4096*Fs/1000,20*log10(fftshift(S_inAA))); grid on;
xlabel('kHz'); ylabel('��Ƶ����'); 
%�۲��Ƶ���Կ�֪�����������źŵĽ�ֹƵ��Ϊ7kHz������1��Ƶ��f1 = 9kHz,����2��Ƶ��f2 = 14kHz
fp = 7000;f1 = 8500; f2 = 14; %����˲���
wp = fp/Fs*2;ws = f1/Fs*2; Rp  =  3;        %�趨ͨ�����˥��Ϊ1dB
Rs = 50;     %�趨�����С˥��Ϊ50dB
%���б�ѩ��I�����
[N,Wc] = cheb1ord(wp,ws,Rp,Rs); %���б�ѩ��I�˲����Ľ�����ͨ����ֹƵ��
[b,a] = cheby1(N,Rp,Wc); 
w = 0:0.01*pi:pi;
[h,w] = freqz(b,a,w); 
h=20*log10(abs(h)/max(abs(h))); %��Ƶ����Ӧ�����ȹ�һ
y = filter(b,a,s_in); %��δ�����˲����������źŽ����˲�
Y= meanfft(y,length(y)); 
%����
qq = 5; bqr=intbR(b,qq); aqr=intbR(a,qq);     %�˲���ϵ����������Ϊqqλ
[hr,wr]=freqz(bqr,aqr,w);           %ֱ���͵�ϵͳƵ����Ӧ
hr=20*log10(abs(hr)/max(abs(hr)));    %���������˲�����Ƶ����Ӧ�����ȹ�һ
yd = filter(bqr,aqr,s_in); %��ֱ���Ͷ������źŽ����˲�
Yd= meanfft(yd,length(yd));
[sos,g]=tf2sos(b,a);        %���˲���������ϵͳ��ϵͳ����
b1=sos(1,1:3);a1=sos(1,4:6); b2=sos(2,1:3);a2=sos(2,4:6);      
b3=sos(3,1:3);a3=sos(3,4:6); b4=sos(4,1:3);a4=sos(4,4:6);      
%b5=sos(5,1:3);a5=sos(5,4:6);    
bqr1=intbR(b1,qq);  aqr1=intbR(a1,qq);      %������ϵͳϵ��
[h1,w1]=freqz(bqr1,aqr1,w); %����������ϵͳ��Ƶ����Ӧ
bqr2=intbR(b2,qq); aqr2=intbR(a2,qq); 
[h2,w1]=freqz(bqr2,aqr2,w); 
bqr3=intbR(b3,qq); aqr3=intbR(a3,qq); 
[h3,w1]=freqz(bqr3,aqr3,w); 
bqr4=intbR(b4,qq); aqr4=intbR(a4,qq); 
[h4,w1]=freqz(bqr4,aqr4,w); 
% bqr5=intbR(b5,qq); aqr5=intbR(a5,qq);
% [h5,w1]=freqz(bqr5,aqr5,w);
hhh=h1.*h2.*h3.*h4;    
hhh=20*log10(abs(hhh)/max(abs(hhh)));      %������ϵͳϵ���������Ƶ����Ӧ
[z,p,k]=tf2zp(b,a);    %��ֱ����ϵͳ�㼫��
[zr,pr,kr]=tf2zp(bqr,aqr); %��ֱ����ϵ���������ϵͳ�㼫��
ysos = sosfilt(sos,s_in); %�ü����Ͷ������źŽ����˲�
Ysos= meanfft(ysos,length(ysos)); 
figure;zplane(z,zr);legend('δ����ϵͳ���','ֱ�������������');grid on;
figure;zplane(p,pr);legend('δ����ϵͳ����','ֱ���������󼫵�');grid on;
figure; plot(w/pi,h,'--',w/pi,hr,'-',w/pi,hhh,'.','LineWidth',2); 
legend('δ����ϵͳ','ֱ��������','��������');xlabel('\omega/\pi');ylabel('dB');grid on; 
title('ϵͳƵ����Ӧ') 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Y(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('δ�����˲��������'); 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yd(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('ֱ�����˲��������'); 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Ysos(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�������˲��������');


% ��ʮ������d�������뷨�õ�bλ������������λ������������Ȼ���ٽ���������ת��Ϊʮ������br
% ��������Ĳ�����û���ر𶮣��о�����������֮���ֻ�ԭ��ԭ������ֵ�ˣ������Ļ��ʹ�����ֵ���ȵĶ�ʧ�Լ������ֵ��ӳ�䵽ͬһ����ֵ��
function br=intbR(d,b) 
    m=1; 
    dr1=abs(d);
    while fix(dr1)>0
        dr1=abs(d)/(2^m);        
        m=m+1;  
    end
    br=fix(dr1*2^b+.5);  
    br=sign(d).*br.*2^(m-b-1);
end