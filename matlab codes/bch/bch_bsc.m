clc;
clf;
clear;

M = 4;
n = 2^M-1;   % Codeword length
k = 5;       % Message length
nwords = 10000; % Number of words to encode

msgTx = gf(randi([0 1],nwords,k));
t = bchnumerr(n,k)

enc = bchenc(msgTx,n,k);
z = enc.x;
z = double(z);
y = z;

P = [0:0.1:1]; 

error_arr = zeros(1,length(P));
for a = 1:length(P)
    error =0;
    q=0;
    % awqn noise
    p = P(a);
    r = myBSC(y,p);
    c_cap =  r;
    
    c_cap= uint32(c_cap);
    m = enc.m;
    prim_poly=enc.prim_poly;
    q = gf(c_cap,m,prim_poly); 
    msgRx = bchdec(q,n,k);
 
    out = msgRx.x;
    out = double(out);
    in = msgTx.x;
    in = double(in);
    error = sum(sum(abs(in-out)))/(size(in,1)*size(in,2));
    error_arr(a) = error;
end


semilogy(P,error_arr)
xlabel("SNR/bit (dB)")
ylabel("Pm Probability of error")
title("BCH Code")
grid on;

save("BCH_BSC","error_arr")

function [r] = myBSC(c,p)

% This function takes input bit stream and generates another by inverting
% each bit with probability p;
r = zeros(size(c,1),size(c,2));
for q=1:size(c,1)
    for i = 1:size(c,2)
        % create a random number between 0 and 1
        check = rand();
        % if check (random number ) <= p flip the bit
        if (check<=p)
            r(q,i) = 1-c(q,i);
        else
            r(q,i) = c(q,i);
        end
    end
end
end