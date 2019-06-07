% Goertzel�㷨ʶ��DTMF�ź�
% һ������������FFT�㷨��Ȼ�����ٶȿ죬������Ҫ�ϴ�����ݴ洢�ռ䣬����ĳЩʱ�����ǲ�����Ҫȫ��Ƶ���ϵ�Ƶ�ף�
% ������Ҫ����Ƶ���ϵ�Ƶ��ֵ��������ĳƵ���Ƿ�����źš�
% ����ԭ��������Goertzel�㷨������λ����kNW�������ԣ���DFT�����ʾΪ�����˲����㡣
% Goertzel�㷨�ĺô������ڽ�ʡʱ�䣬�����ڽ�ʡ�ռ䡣
% ���ֻ��ҪK��DFT����������ֻ��K�����еĵ������˲������ֱ����K��DFT�������������Դ���ʡӲ�����Դ��
% ��������������DTMF��Double Tone Multi Frequency��˫����Ƶ���ź�����Ƶ�绰�����źš�
% ��DTMF ͨ��ϵͳ�й���8��Ƶ�ʣ�4����Ƶ����4����Ƶ������1����Ƶ����1����Ƶ�����������ʾһ���źţ����ṩ16����ϣ�����16 ���źš�
% ���Ȳ���DTMF�źţ�����Goertzel�㷨���ʶ��
clear;
close all;

d=input('����绰����= ','s');
symbol=abs(d);                      % ������ASCII��
tm=[49,50,51,65;52,53,54,66;55,56,57,67;42,48,35,68];        
for p=1:4 
    for q=1:4 
        if tm(p,q)==abs(d) 
            break;
        end
    end
    if tm(p,q)==abs(d)
        break;
    end
end
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:2040;
x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);
%������
%x = awgn(x, 0.1);
sound(x, 8000);                                                                
disp('˫Ƶ�ź��Ѿ����ɲ�����');
pause;

N=205;
k=round([f1,f2]/8000*N);
for m = 1:8
    X(m)=gfft(x(1:N),k(m));                            % ��Goertzel�㷨����8��DFT����
end
val = abs(X);                           
stem(k,val,'.');
grid;
xlabel('k');ylabel('|X(k)|') 

set(gcf,'color','w');
shg;
disp('ͼ����ʾ���Ǽ�⵽�İ˸����ƻ�ƵDFT����');
pause;
limit = 80;                 
for s=5:8 
    if val(s) > limit
        break, 
    end
end
for r=1:4 
    if val(r) > limit 
        break,
    end
end
disp(['���շ���⵽�ĺ�����',setstr(tm(r,s-4))]);