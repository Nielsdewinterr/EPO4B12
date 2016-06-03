
% count=1
% real3=2.03
% real5=4.03
% real0=0
% 
% for j=1:200;
%     
%     a=j*0.01;
%     
%     for k=1:200;
%     
%         b=k*0.01;
%         
%         c=log(a)/-b;
%     t=[0:0.001:10];
%     v =a-exp(-b*(t+0.15));
% acount(count)=a;
% bcount(count)=b;
%     x=v.*t;
%     
%     x3(count)=x(3000);
%     x5(count)=x(5000);
%       
%     count=count+1;
%     
%     end
% end
% 
% 
% 
% for l=1:40000;
%     error3=abs(x3(l)-real3);
%     error5=abs(x5(l)-real5);
%     errorr(l)=error5+error3;
%     
% end
% 
% [small samp]=min(errorr);
% 
% a=acount(samp)
% b=bcount(samp)

figure(1)
hold on
a=0.52


t=[0:0.001:10];

c=log(a)/-b
v=a-exp(-b*(t+c))
plot(t,v)
figure(2)
plot(t,v.*t)
    
    
    



