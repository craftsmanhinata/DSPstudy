% 第三十五讲  Matlab程序 
% (一)程序说明  本程序主要用于基2FFT算法编程实现以及与直接计算DFT进行比较。
% Matlab为解释性语言，有fft.m函数采用目的码编译，dft.m函数实际调用fft函数。
% 为了更深刻理解基2FFT算法的基本原理和运算规律，并与直接计算DFT进行比较，所以鼓励学生自己动手编程。

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
    nxd=bin2dec(fliplr(dec2bin([1:N]-1,m)))+1;      %比特逆序
    y=x(nxd);                             % 变址
    for mm=1:m             
        Nmr=2^mm;u=1;           
        WN=exp(-1i*2*pi/Nmr);          
        for j=1:Nmr/2         
            for k=j:Nmr:N              
                kp=k+Nmr/2;               
                t=y(kp)*u;                     
                y(kp)=y(k)-t;          %蝶形运算
                y(k)=y(k)+t;      %蝶形运算
            end
            u=u*WN;               % 递推求权值
        end
    end
end
    
function y=testdft(x) 
    N=length(x);             
    n=0:N-1; 
    k=n;            
    WN=exp(-1i*2*pi/N);
    nk=n'*k;  
    WNnk=WN.^nk;      % 旋转因子
    Xk=x*WNnk;
    y=Xk;         %DFT的矩阵运算
end
        
%(三)结果分析计算时间与个人计算机的运算能力相关，不同计算机会得到不同的运算时间，总体来说以计算相同点数的DFT为前提，fft.m运算时间最快，自己编程实现的基2FFT算法次之，自己编程实现的DFT算法最慢。