% ���������˫����Ƶ�źţ�DTMF����������
clear;
close all;

table = [697,1209;770,1366;852,1447;941,1633]; %����Ƶ�ʶ��ձ�
Fs=40000; %����Ƶ��
code=input('please input the code No: ');
snr=input('please input the SNR: ');
n=(0:1024*8-1); %ʱ�����
FFTN=1024; %FFT����
Nn=randn(1,length(n));  %��·�е�����(���ֵ������Ϊ1)
amp=sqrt(2*10^(snr/10));    %����
if code==0
    f1=941;
    f2=1336;
else
    f1=table(fix((code-1)/3)+1,1);
    f2=table(code-3*(fix((code-1)/3)),2);
end

x = amp*(sin(2*pi*f1/Fs*n)+sin(2*pi*f2/Fs*n));   %DTMF�ź�
sound(x,Fs);pause(1);

x1 = amp*(sin(2*pi*1209/Fs*n)+sin(2*pi*697/Fs*n));
sound(x1,Fs);pause(1);

x5 = amp*(sin(2*pi*1336/Fs*n)+sin(2*pi*770/Fs*n));
sound(x5,Fs);pause(1);

x9 = amp*(sin(2*pi*1447/Fs*n)+sin(2*pi*852/Fs*n));
sound(x9,Fs);pause(1);




fx=fft(x,FFTN);
figure;
subplot(2,1,1);
plot(x, 'LineWidth', 1.5);
xlabel('n');ylabel('x(n)');title('DTMF�źŵ�ʱ����');
subplot(2,1,2);
plot((0:FFTN/2-1)/FFTN*Fs,abs(fx(1:FFTN/2)), 'LineWidth', 1.5);
xlabel('Hz');ylabel('|X(exp(jw))|');title('DTMF�źŵķ�Ƶ����');
