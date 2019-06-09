%���������FIR�˲������������ִ������Խ��˸��ź�Զ�˸��ŵ��˳����ܡ�
%һ�����������������ź��о����������ж�����Ŵ��ڵ����������˸���1��Զ�˸���2��
%��Ҫ���һ���˲����������˳����˸���1����Ҫ���˳�Զ�˸���2��
%Ȼ�������ô��������FIR�˲���ʱ���������Ͳ�ͬ���Խ��˺�Զ�˵�˥��Ҳ�ǲ�һ���ģ�
%�����Ҫ�������ִ������Խ��˸��ź�Զ�˸��ŵ��˳����ܣ��ܽ����������ѡȡԭ��

clc;
clear;
close all;

%��ȡ�ź�
filename = '../resource/canon.wav';
s_in = audioread(filename);
s_info = audioinfo(filename);

%L = length(s_in);
L = s_info.TotalSamples;
Fs = s_info.SampleRate / 1000;     %����Ƶ�ʣ���λ��kHz��

% ���������źŷ�Ƶ����
S_inAA = meanfft(s_in,L);
plot((-2047:2048)/4096*Fs,20*log10(fftshift(S_inAA)));
grid;xlabel('kHz'); ylabel('��Ƶ����');
%�۲��Ƶ���Կ�֪�����������źŵĽ�ֹƵ��Ϊ7kHz������1��Ƶ��Ϊ9kHz,����2��Ƶ��Ϊ14kHz

fp = 2; %�趨��ͨ�˲�����ͨ����ֹƵ��
f1 = 2.5;%�趨��ͨ�˲����������ʼƵ��
%����˲���
wp = fp/Fs*2*pi;
ws = f1/Fs*2*pi;
wd=0.5*(wp+ws);      %���������ͨ�˲�����ͨ����ֹƵ��
Bt=abs(wp-ws);        %������ɴ�
alphas=40;                %�趨�����С˥��Ϊ40dB

%�ú��������
N1=ceil(8*pi/Bt); %���㺺�����ĳ���
hhan=fir1(N1-1,wd/pi,'low',hann(N1)); %����fir1�����ͨFIR�˲���
HHan=fft(hhan,512);
yhhan = conv(hhan,s_in); %�������źŽ����˲�
Yhhan = meanfft(yhhan,length(yhhan));

%�ú��������
N2=ceil(8*pi/Bt); %���㺺�����ĳ���
hhm=fir1(N2-1,wd/pi,'low',hamming(N2)); %����fir1�����ͨFIR�˲���
HHm=fft(hhm,512);
yhhm = conv(hhm,s_in);
Yhhm = meanfft(yhhm,length(yhhm));

%�ò������������
N3=ceil(12*pi/Bt); %���㲼���������ĳ���
hb=fir1(N3-1,wd/pi,'low',blackman(N3)); %����fir1�����ͨFIR�˲���
HHb=fft(hb,512);
yhb = conv(hb,s_in);
Yhb = meanfft(yhb,length(yhb));

%�ÿ��������
beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21);        % ���������Ʋ���
N4=ceil((alphas-8)/(2.285*Bt));
hks=fir1(N4-1,wd/pi,'low',kaiser(N4,beta)); %����fir1�����ͨFIR�˲���
Hks=fft(hks,512);
yhks = conv(hks,s_in);
Yhks = meanfft(yhks,length(yhks));

%�þ��δ����
N5 = ceil(4*pi/Bt); %������δ��ĳ���
hr =fir1(N5-1,wd/pi,'low',rectwin(N5)); %����fir1��Ƶ�ͨFIR�˲���
Hr=fft(hr,512);
yhr = conv(hr,s_in);
Yhr = meanfft(yhr,length(yhr));

%�����Ǵ����
N6 = ceil(8*pi/Bt); %�������Ǵ��ĳ���
hba =fir1(N6-1,wd/pi,'low',bartlett(N6)); %����fir1�����ͨFIR�˲���
Hba=fft(hba,512);yhba = conv(hba,s_in);
Yhba = meanfft(yhba,length(yhba));

%��ͼ
figure;
plot((0:255)/512*Fs,20*log10(abs(HHan(1:256))),'b-','linewidth',2);
grid;xlabel('kHz'); ylabel('20lg|H(\omega)|');
hold on;
plot((0:255)/512*Fs,20*log10(abs(HHm(1:256))),'k--','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(HHb(1:256))),'r->','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hks(1:256))),'c-*','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hr(1:256))),'m-o','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hba(1:256))),'g-p','linewidth',2);
legend('������','������','����������','������','���δ�','���Ǵ�');

figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhhan(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�ú���������˲���');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhhm(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�ú���������˲���');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhb(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�ò�������������˲���');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhks(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�ÿ���������˲���');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhr(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�þ��δ�����˲���');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhba(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('�����Ǵ�����˲���');

function XX = meanfft(s_in,L) % ��fft�ľ�ֵ
    % s_inΪ�����ź�
    % LΪ�źų���
    % XXΪ����ź�
    for i = 1: floor(L/4096)         
        S_inA(i,:)  =  abs(fft(s_in((i-1)*4096+1:i*4096)));  
    end
    S_inAA = mean(S_inA); 
    XX= S_inAA;
end