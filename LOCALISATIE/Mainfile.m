load audiodata_B11.mat;
[ref1]=extract_data(RXXr,1);
ref1 = ref1(2200:3200);

  for i = 6:11

[a,b,c,d,e]=extract_data(RXXr,i);
[r12,r13,r14,r15,r23,r24,r25,r34,r35,r45]=TDOA(a,b,c,d,e,ref1);
[x,y] = Lin(r12,r13,r14,r23,r24,r34);
plot(y,x,'x');
a=num2str(i);
text(y,x,a)
hold on;
 xlim([0,4.53]);
 ylim([0,4.14]);
    end

