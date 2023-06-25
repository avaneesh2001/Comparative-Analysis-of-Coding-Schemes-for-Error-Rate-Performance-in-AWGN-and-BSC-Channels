clc;
clear;

% Get user input
m = 4;

% Get the parity check and generator matrix
[H,G] = HammingCode(m);
[k,n] = size(G);

% display H and G matrices
% fprintf('\n For m = %d we get (%d ,%d) Hamming code \n',m,n,k);
% fprintf('___________________________________________\n \n');
% disp("Generator matrix")
% disp(G)
% disp("Parity check  matrix")
% disp(H)

% random message is sent
n = 10000;
x = randi([0 1],n,k);
%code word
c = rem(x*G,2);
[n , m]= size(c);

y = zeros(n,m);
y = c;
p = [0:0.1:1]; 
error_arr = zeros(1,length(p));
decoded = zeros(n,m); 

for a = 1:length(p)
    
    % bsc noise
    r = myBSC(y,p(a));

    % decoding-hard
    
    for b = 1:n
        % Syndrome decoding
        decoded(b,:) = SyndromeDecode(r(b,:),H);
    end

    decoded1 = decoded(:,1:k);
    
    error = sum(sum(abs(x-decoded1)))/(n*k);
    error_arr(a) = error;
end

semilogy(p,error_arr)

xlabel("Perror")
ylabel("BER")
title("Hamming Code")
grid on;
save('Hamming_BSC','error_arr')

