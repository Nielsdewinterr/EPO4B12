function [hhat] = ch3(x,y)
Ny = length(y);
Nx = length(x);
L = Ny - Nx + 1;

Y = fft(y);
X = fft([x zeros(1,Ny - Nx)]); % zero padding to length Ny
tresh=0.1*max(abs(Y));%treshold
ii = find(abs(Y)<tresh);


%making a vector G that has length N(=length(X)=Length(Y))
%with value 1 where X>tresh
Hhat(ii)=0;Hhat = X./Y; % frequency domain deconvolution
hhat=ifft(Hhat);
end