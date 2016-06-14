function multipleGoals(x,y,rot,A)

clf;
C=size(A);
C=C(1);
for i=1:C
    [x,y,rot] = testControlDrive(x,y,rot,A(i,1),A(i,2))
end