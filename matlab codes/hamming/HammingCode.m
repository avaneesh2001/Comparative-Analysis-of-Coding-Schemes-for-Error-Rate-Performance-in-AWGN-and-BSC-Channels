function [H,G] = HammingCode(m)
% This function generated parity check matrix and Generator matrix of
% hamming code with given m value as k = 2^m-1-m and n = 2^m -1 

k = 2^m -m-1;
n = 2^m -1; 

% Here we are storing powers of 2 till 2^m-1
% These values will be in identity matrix part
B = zeros(1,m);
for i = 1:1:m
     B(i) = 2^(i-1);
end

% We are calculating the parity matrix part
P = zeros(k,m);

count = 1;
for i = 1:n
    if ismember(i,B)==1 
    else 
    if count <= (n-m)
    P(count,:) = de2bi(i,m);
    count = count + 1;
    end
    end
end

H = [P' eye(m)];

G = H2G(H);
% We can also find G as G = [eye(k) P]


end