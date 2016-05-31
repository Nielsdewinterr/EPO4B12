function [hhat] = ch3(x,y)
Ny = length(y);
Nx = length(x);
L = Ny - Nx + 1;

Y = fft(y);
X = fft([x zeros(1,Ny - Nx)]); % zero padding to length Ny
Hhat = Y./X; % frequency domain deconvolution
tresh=0.01*max(abs(X));%treshold
%making a vector G that has length N(=length(X)=Length(Y))
%with value 1 where X>tresh
ii = find(abs(X)<tresh);
Hhat(ii)=0;
hhat=ifft(Hhat);
end