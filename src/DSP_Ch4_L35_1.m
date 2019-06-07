% ����ʮ�彲  Matlab���� 
% (һ)����˵��  ��������Ҫ���ڻ�2FFT�㷨���ʵ���Լ���ֱ�Ӽ���DFT���бȽϡ�
% MatlabΪ���������ԣ���fft.m��������Ŀ������룬dft.m����ʵ�ʵ���fft������
% Ϊ�˸��������2FFT�㷨�Ļ���ԭ���������ɣ�����ֱ�Ӽ���DFT���бȽϣ����Թ���ѧ���Լ����ֱ�̡�

M=input('M=');
x=randn(1,2^M);
tic,x=fft(x),toc 
tic,x=testfft(x),toc
tic,x=testdft(x),toc

function y=testfft(x)
    m=nextpow2(x);
    N=2^m;
    if length(x)<N
        x=[x,zeros(1,N-length(x))];
    end
    nxd=bin2dec(fliplr(dec2bin([1:N]-1,m)))+1;      %��������
    y=x(nxd);                             % ��ַ
    for mm=1:m             
        Nmr=2^mm;u=1;           
        WN=exp(-1i*2*pi/Nmr);          
        for j=1:Nmr/2         
            for k=j:Nmr:N              
                kp=k+Nmr/2;               
                t=y(kp)*u;                     
                y(kp)=y(k)-t;          %��������
                y(k)=y(k)+t;      %��������
            end
            u=u*WN;               % ������Ȩֵ
        end
    end
end
    
function y=testdft(x) 
    N=length(x);             
    n=0:N-1; 
    k=n;            
    WN=exp(-1i*2*pi/N);
    nk=n'*k;  
    WNnk=WN.^nk;      % ��ת����
    Xk=x*WNnk;
    y=Xk;         %DFT�ľ�������
end
        
%(��)�����������ʱ������˼����������������أ���ͬ�������õ���ͬ������ʱ�䣬������˵�Լ�����ͬ������DFTΪǰ�ᣬfft.m����ʱ����죬�Լ����ʵ�ֵĻ�2FFT�㷨��֮���Լ����ʵ�ֵ�DFT�㷨������