% Function to simulate AWGN Channel with given SNR
function [r] = myAWGN(y,SNR,n,m)
No = 1/(10^(SNR/10));
    No_2 = No/2*3;
    noise = sqrt(No_2)*randn(n,m);
    r = y + noise;
end