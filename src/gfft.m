function X=gfft(x,k)
    %《数字信号处理教程――MATLAB释义与实现》
    % Goertzel算法子程序
    % 电子工业出版社出版  陈怀琛编著 2004年9月
    %
    %  X=gfft(x,k)
    % ----------------------------------
    % 用Goertzel算法计算序号为k的DFT样本
    % x 输入序列，其长度即DFT长度
    % k 指定的DFT样本的序号
    % X 待求的DFT样本
    %
    N=length(x);x1=[x,0];       % 递推要N+1次，故把输入序列长度加一
    d1 = 2*cos(2*pi*k/N);   % 二阶滤波环节中间项系数
    v = filter(1,[1,-d1,1],x1);     % 用滤波函数实现卷积
    W = exp(-1i*2*pi*k/N);           % 为下一步计算求W
    X = v(N+1) - W*v(N);            % 最后求出第k个DFT样本
end