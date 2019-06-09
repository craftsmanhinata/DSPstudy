% Ƶ�׷���֮դ������
% һ���������� Ƶ�׼���豸�Դ����ڵ��źŽ���ʵʱƵ�׼��㣬������Ŀ���źź�����Ҫ��������Ƶ�ʣ�
% ���ڽ�һ���������źš������ù��Ƴ���Ƶ�ʶԸ��źŽ��������±�Ƶ��Ȼ���������Ʒ�ʽ��
% ���ù��Ƴ���Ƶ�ʶԸ��ź�ʵʩͬ���ȡ���������Ӧ�ö��ԣ�Ƶ�ʹ��Ƶľ���ֱ��Ӱ���˺�˴��������ܣ�
% Ϊ����Ҫ����ѡ��Ƶ�׷����Ĳ������Ի�ýϸߵ�Ƶ�ʹ��ƾ��ȡ�
% ����ԭ������ ����DFT����Ƶ�׷���������x(n)���������δ��ضϳ�Ϊ�����У�
% �����DFT�Ƕ�y(n)��SFT�ĵȼ�����������Ƕ�ԭ����SFT�ĵȼ��������
% SFTƵ�׵ķֱ��ʾ������׷����ܹ����ֵ�����Ƶ�ʵ���С�������Ϊģ��Ƶ�׷ֱ���F=Fs/N�����Ǵ�����������ȵ�һ�롣
% ������Ƶ�ʵļ������SFTƵ�׷ֱ���ʱ�������ǿɷֵģ�����ͨ������DFT�������Լ���դ��ЧӦ�����Ƶ�ʹ��ƾ��ȡ�
close all;
clear;

samples=150;FFTN=2048;%�źų���������FFT����
n=0:samples-1; 
Fs=100;%����Ƶ��(kHz)
f1=15.1;f2=16.2;f3=20.5;%�ź�Ƶ��(kHz)
x=sin(2*pi*f1/Fs*n)+2*sin(2*pi*f2/Fs*n)+sin(2*pi*f3/Fs*n); 
fx=fft(x,FFTN);%�趨FFT����ΪFFTN
df=Fs/samples;%ģ��Ƶ�׷ֱ���
dk=floor(df/Fs*FFTN);%��֮��Ӧ��k 
if dk==0         
    dk=1;  
end
fx1=fx(1:FFTN/2); %ʵ�ź�ֻ����0��k<N/2��Χ��Ѱ�Ҽ���ֵ
[m,n]=max(abs(fx1));%Ѱ�����ֵ
f1=(n-1)/FFTN*Fs;%��һ�����Ƴ���Ƶ��
fx1(n-dk:n+dk)=0;
[m,n]=max(abs(fx1));%Ѱ�Ҵδ�ֵ
f2=(n-1)/FFTN*Fs;%�ڶ������Ƴ���Ƶ��
fx1(n-dk:n+dk)=0;
[m,n]=max(abs(fx1));%Ѱ�ҵ�����ֵ
f3=(n-1)/FFTN*Fs;%���������Ƴ���Ƶ��
[f1 f2 f3] 
figure; 
plot((0:FFTN/2-1)/FFTN*Fs,20*log10((abs((fx(1:FFTN/2))))),'b','LineWidth',2);
grid on; 
xlabel('kHz','fontsize',12);
ylabel('|X(e^j\omega)|','fontsize',12);
axis([0 50 -10 50]);