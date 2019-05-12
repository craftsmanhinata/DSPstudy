

clear;
clear all;
aaa = intbR(11.9,10);

%z
function br=intbR(d,b) 
    m=1; 
    dr1=abs(d);
    while fix(dr1)>0
        dr1=abs(d)/(2^m);        
        m=m+1;  
    end
    br=fix(dr1*2^b+.5);  
    br=sign(d).*br.*2^(m-b-1);
end