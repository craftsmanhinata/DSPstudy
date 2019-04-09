%%
fs=44100;
t=0: 1/fs: 1;
t1=0: 1/fs:0.1;
do=sin(2*pi*261.63 *t); 
re=sin(2*pi*293.66 *t); 
mi=sin(2*pi*329.63 *t); 
fa=sin(2*pi*349.23 *t); 
so=sin(2*pi*392.00 *t); 
la=sin(2*pi*440.00 *t); 
ti=sin(2*pi*493.88 *t); 
nul=sin(2*pi*25000 *t);
gap=sin(2*pi*25000 *t1);
Cscale=[do gap do gap so gap so gap la gap la gap so gap nul...
          fa fa mi mi re re do nul... 
          so so fa fa mi mi re nul...
          so so fa fa mi mi re nul...
          do do so so la la so nul...
          fa fa mi mi re re do nul...
    ];
sound(Cscale,fs)
%%
fs=44100;
t=0: 1/fs: 0.5;
t1=0: 1/fs:0.1;

k1=sin(2*pi*1209*t)+sin(2*pi*697*t);
k2=sin(2*pi*1336*t)+sin(2*pi*697*t);
k3=sin(2*pi*1447*t)+sin(2*pi*697*t);

k4=sin(2*pi*1209*t)+sin(2*pi*770*t);
k5=sin(2*pi*1336*t)+sin(2*pi*770*t);
k6=sin(2*pi*1447*t)+sin(2*pi*770*t);

k7=sin(2*pi*1209*t)+sin(2*pi*852*t);
k8=sin(2*pi*1336*t)+sin(2*pi*852*t);
k9=sin(2*pi*1447*t)+sin(2*pi*852*t);

k0=sin(2*pi*1336*t)+sin(2*pi*941*t);



nul=sin(2*pi*25000 *t);
gap=sin(2*pi*25000 *t1);

Cscale=[k1 gap k3 gap k1 gap k3 gap k7 gap k8 gap k0 gap k7 gap k0 gap k1 gap k6 gap];
sound(Cscale,fs)


%%
fs=44100;
    t=0: 1/fs: 0.5;
    y = sin(2*pi*261.63*t);
    y = y + sin(2*pi*329.63*t);
    y = y + sin(2*pi*392*t);
    soundsc(y,fs);   %soundsc()没有限制音量

%%
 clear
    fs=44100;
    t=0: 1/fs: 0.5;

    %%%%%backing track%%%%%
    one=0.5*sin(2*pi*261.63*t);
    one=one+0.5*sin(2*pi*329.63*t);
    one=one+0.5*sin(2*pi*466.16*t);
    four=0.5*sin(2*pi*349.23*t);
    four=four+0.5*sin(2*pi*440*t);
    four=four+0.5*sin(2*pi*622.25*t);
    five=0.5*sin(2*pi*392*t);
    five=five+0.5*sin(2*pi*493.88*t);
    five=five+0.5*sin(2*pi*698.46*t);
    bar1=[one one one one];
    bar4=[four four four four];
    bar5=[five five five five];
    backing=[bar1 bar1 bar1 bar1 bar4 bar4 bar1 bar1    bar5 bar4 bar1 bar1];

    %%%%%pentatonic%%%%%
    so=sin(2*pi*196*t);
    la=sin(2*pi*220*t);
    do=sin(2*pi*261.63*t);
    re=sin(2*pi*293.66*t);
    blue=sin(2*pi*311.13*t);
    blk=sin(2*pi*0*t); %blank 

    %%%%%melody%%%%%
    melody=[so so la la do do blue blue blue blk re do do do la blue blue la ...
    la do blue re so la do blk blk re blue do re so la la so la do re blue ...
    blue blue so so la la re blue do];

    melody1=[so so la la do do blue blue blue blk re do do do la blue blue la ...
    la do blue re so la do blk blk re blue do re so la la so la do re blue ...
    blue blue so so la la re blue do];

    %%%%%%%%%%%%%%%
    song=[backing;melody];
    soundsc(song,fs)
    
    
    
    %%
    [y,Fs] = audioread('record.m4a');
    t=length(y);
    t=linspace(0, 6,t);
    plot(t,y)
    %%
    t=0:0.01:1;
    f=1:5;
    [t,f]=meshgrid(t,f);
    y=sin(2*pi*f.*t);
    waterfall(t,f,y);
    xlabel('t');
    ylabel('f');
    zlabel('y');