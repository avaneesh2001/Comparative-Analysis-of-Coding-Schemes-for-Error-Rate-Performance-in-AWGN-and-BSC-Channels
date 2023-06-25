clc;
clear;

% Get user input
m = 4;

% Get the parity check and generator matrix
[H,G] = HammingCode(m);
[k,n] = size(G);

% display H and G matrices
fprintf('\n For m = %d we get (%d ,%d) Hamming code \n',m,n,k);
fprintf('___________________________________________\n \n');
disp("Generator matrix")
disp(G)
disp("Parity check  matrix")
disp(H)

% random message is sent
n = 10000;
x = randi([0 1],n,k);
%code word
c = rem(x*G,2);
[n , m]= size(c);

y = zeros(n,m);
%bpsk

y =1-2.*c;

SNR_arr = [0:2:10]; 
error_arr = zeros(1,length(SNR_arr));

decoded = zeros(n,m); 

for a = 1:length(SNR_arr)
    
    % awqn noise
    r = myAWGN(y,SNR_arr(a),n,m);
   
    c_cap =  zeros(n,m);


    % decoding-hard
    for i=1:n
        for j=1:m
            if r(i,j) >=0
                c_cap (i,j) = 0;
            else
                 c_cap (i,j) = 1;
            end
            
        end
    end
    for b = 1:n
        % Syndrome decoding
        decoded(b,:) = SyndromeDecode(c_cap(b,:),H);
    end

    decoded1 = decoded(:,1:k);
    
    error = sum(sum(abs(x-decoded1)))/(n*k);
    error_arr(a) = error;
    

end

semilogy(SNR_arr,error_arr)
xlabel("SNR/bit (dB)")
ylabel("BER")
title("Hamming Code")

grid on;

%save('Hamming_AWGN','error_arr')
