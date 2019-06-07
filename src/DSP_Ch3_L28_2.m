% �����ϱ�Ƶ��
Fs=50;%����Ƶ��(kHz)
f1=5;%�ź�Ƶ��(kHz)
f0=150;%NCO��Ƶ��(kHz)
n=1024;%������

x=cos(2*pi*f1/Fs*(0:n-1));
fx=fft(x); 
figure;
subplot(2,1,1);plot(real(x(1:100)),'b'   ,'LineWidth',2);
grid on; xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
title('�ڲ�ǰ������','fontsize',12); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('�ڲ�ǰ���еķ�Ƶ����','fontsize',12); 

I=10;%�ڲ�����
y1=zeros(1,I*length(x));
y1(1:I:length(y1))=x;%�ڲ�������
fy1=fft(y1); 
figure; plot((0:length(y1)-1)/length(y1)*I*Fs,20*log10(abs(fy1)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('��������еķ�Ƶ����','fontsize',12); 

b=I*fir1(79,12/(Fs*I),blackman(80));%����˲���
y3=conv(b,y1); 
y2=y3(80:length(y3)-80);%ȥ����̬��Ӧ
fy2=fft(y2); 
figure; plot((0:length(y2)-1)/length(y2)*I*Fs,20*log10(abs(fy2)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('��ͨ�˲���ķ�Ƶ����','fontsize',12); 

y=y2.*exp(1i*2*pi*f0/(I*Fs)*(0:length(y2)-1));%����Ƶ
fy=fft(y); 
figure; 
subplot(2,1,1);plot(real(y(1:500)),'b'   ,'LineWidth',2);
grid on; xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12); 
title('�ڲ�������','fontsize',12);
subplot(2,1,2); 
plot((0:length(y)-1)/length(y)*I*Fs,20*log10(abs(fy(1:length(y)))),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('�����ϱ�Ƶ����źŵķ�Ƶ����','fontsize',12); 