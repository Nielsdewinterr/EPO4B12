
function [hout] = ch2(x,y)
Ny= length(y); 
Nx= length(x); 
L=Ny-Nx+1;
xr = flipud(x);
h = filter(xr,1,y);
h = h(Nx+1:end)
%alpha = x'*x;
%hout = h/alpha;
hout = h;

end
