clear all;
close all;

load LocatieA.mat;
[x1,y1] = Mainfile(inputbuffer);


load LocatieB.mat;
[x2,y2] = Mainfile(inputbuffer);


load LocatieC.mat;
[x3,y3] = Mainfile(inputbuffer);


load LocatieD.mat;
[x4,y4] = Mainfile(inputbuffer);


load LocatieE.mat;
[x5,y5] = Mainfile(inputbuffer);


load LocatieF.mat;
[x6,y6] = Mainfile(inputbuffer);

figure
plot(y1,x1,'x')
drawnow
hold on;
xlim([0,4.53]);
ylim([0,4.14]);

plot(y1,x1,'x')
drawnow
hold on;
xlim([0,4.53]);
ylim([0,4.14]);


xlim([0,4.53]);
ylim([0,4.14]);
text(0,0,'mic4');
text(0,4.14,'mic3');
text(4.53,0,'mic1');
text(4.53,4.14,'mic2');

