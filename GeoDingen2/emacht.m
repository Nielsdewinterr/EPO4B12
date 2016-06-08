

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
%     x=(a*t+1/b*exp(-b*(t+c)))-exp(-b*c)/b;
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



close all;
%astraight=0.88
%bstraight=0.51

t=[0:0.001:10];

%straight constants

a=1.03;
b=0.91;
c=log(a)/-b;

%turn constants
at=0.5;
bt=0.91;
ct=log(at)/-b;


%straight speed/distance
v=a-exp(-b*(t+c));
x=(a*t+1/b*exp(-b*(t+c)))-exp(-b*c)/b;

%turn speed/distance
vt=at-exp(-bt*(t+ct));
xt=(at*t+1/bt*exp(-bt*(t+ct)))-exp(-bt*c)/bt;

%%lineare benaderig
tmeting=[0,.5,1,1.5,2,2.5,3];
dmeting=[0,.2,.52,.91,1.39,2.03,2.66]

plot(t,v)
hold on
plot(t,vt)


figure(2)
hold on
% plot(t,x)
% hold on
% plot(t,xt)
% hold on
plot(tmeting,dmeting)
hold on
plot([0:0.01:3],interp1(tmeting,dmeting,[0:0.01:3],'spline'))
