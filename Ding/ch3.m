function [hhat] = ch3(x,y)
Ny = length(y);
Nx = length(x);

Y = fft(y);
X = fft([x zeros(1,Ny - Nx)]); % zero padding to length Ny
tresh=0.15*max(abs(Y));%treshold
%making a vector G that has length N(=length(X)=Length(Y))
%with value 1 where X>tresh
ii = find(abs(Y)<tresh);
Y(ii)=0;

Hhat = Y./X; % frequency domain deconvolution
hhat=ifft(Hhat);
end