close all;
clear;

clear;%����ڴ�
close all   ;%�ر�����ͼ��
filename1='../resource/canon.wav'; 
info = audioinfo(filename1);
[s1,fs]=audioread(filename1);%��ȡ�����źţ�����Ƶ��Ϊfs


%�ı�dfN���Թ۲�DFT���������Ƶ�׷ֱ��ʵ����� 
dfN=1024;%ÿ���źŵĳ��ȣ�Ҳ���Ǵ�����
dd=819200/dfN; 

for i=1:dd         
    y(i,:)=x(1+dfN*(i-1):dfN*i);%�����ݷֶ�        
    xf1(i,:)=20*log10(abs(fft(y(i,:))));  
end

m=(1:dd)/20;n=(0:dfN-1)*200/dfN;%�ٲ�ͼ������
figure;
mesh(n,m,xf1);
xlabel('kHz','fontsize',12);ylabel('t',   'fontsize',12); %���Ͳ���Ƶ�ʶ����Ƶ�׷ֱ��ʵ�����
x1=x.*exp(-2*1i*pi*135/200*(1:length(x))); %Ƶ�����°���135kHz
h(1:5)=0.2; %�˲���
y1=filter(h,1,x1);
y2=filter(h,1,y1(6:length(y1))); 
y3=filter(h,1,y2(6:length(y2)));
y4=filter(h,1,y3(6:length(y3)));
y5=filter(h,1,y4(6:length(y4))); 
y=y5(6:5:length(y5)); %�����˻����ź�
for i=1:150     
    xf(i,:)=20*log10(abs(fft(y(1+1024*(i-1):1024+1024*(i-1))))); %DFT����1024 
end

m=(1:150)/10;n=(0:1023)*40/1024;%����Ƶ�ʽ�Ϊ40kHz
figure;
mesh(n,m,xf); 
xlabel('kHz','fontsize',12);
ylabel('t',   'fontsize',12);

