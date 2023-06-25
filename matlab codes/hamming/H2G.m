function [G] = H2G(H)
% This function converts a H matrix of form [P' I] to corresponding
% generator function

% Get dimensions of H
[n_k,n] = size(H);
k = n - n_k;

% Obtain parity matrix
P = H';  
P((k+1:n), : ) = [];
  
% Creating a Identity matrix of size K x K
I = eye(k);  
  
% Creating generator matrix
G = [I P];

end