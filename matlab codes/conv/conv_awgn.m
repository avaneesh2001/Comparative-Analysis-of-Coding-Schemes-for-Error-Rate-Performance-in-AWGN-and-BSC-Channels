clc;
clear;
% random message is sent
n = 10000;
x = randi([0 1],1,n);

[y,G]= conv_encode(x);
%size(G,1)

%bpsk
y =1-2.*y;
SNR_arr = [0:2:10]; 
error_arr = zeros(1,length(SNR_arr));
for a = 1:length(SNR_arr)
    
    % awqn noise
    r = myAWGN(y,SNR_arr(a),1,length(y));
    c_cap =  zeros(1,n);
    % decoding-hard
    for i=1:size(y,1)
        for j=1:size(y,2)
            if r(i,j) >=0
                c_cap (i,j) = 0;
            else
                 c_cap (i,j) = 1;
            end
            
        end
    end
    x_hat = viterbi(G,1,c_cap);
    x = x(1,1:length(x_hat));

    
    error = sum(sum(abs(x-x_hat)))/(n);
    error_arr(a) = error;
end

semilogy(SNR_arr,error_arr)
xlabel("SNR/bit (dB)")
ylabel("Pm Probability of error")
title("Convolutional Code")
grid on;

%save('Conv_AWGN','error_arr')

function [y,G] = conv_encode(x)
a = 0;b = 0;c = 0;d = 0;e=0;
y = zeros(1,3*length(x));
G = [1,0,1,0,1;1,1,0,1,1;1,1,1,1,1];
for i = 1:length(x)
e=d;
d=c;
c=b;
b=a;
a=x(i);

p = rem(a+c+e,2);
q = rem(a+b+d+e,2);
r = rem(a+b+c+d+e,2);

y(3*i-2) = p;
y(3*i-1) = q;
y(3*i) = r;
end
end