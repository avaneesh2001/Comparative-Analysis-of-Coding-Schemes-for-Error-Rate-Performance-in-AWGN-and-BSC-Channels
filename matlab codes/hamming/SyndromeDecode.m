function [c_] = SyndromeDecode(r,H)
% This function receives H matrix and received vector r and uses Syndrome
% decoding to find C_



% Find Syndrome of received vector
S = rem(r*H',2);

[x,n] = size(H);
k = n-x;

% creating coset leaders table (as matrix)
B = zeros(1,n+1);
for i = 2:1:n+1
    % coset leaders in decimal
     B(i) = 2^(i-2);
end
CosetLead = zeros(n+1,n);
for count = 2:n+1 
    % coset leaders in binary (as vectors)
    CosetLead(count,:) = de2bi(B(count),n,'left-msb');
end

% Create coset leaders - syndrome mapping
SynMap = zeros(n+1,n-k);
for i = 1:n+1 
    SynMap(i,:) = rem(CosetLead(i,:)*H',2);
end
% 
% disp("Coset leaders")
% disp(CosetLead)
% disp("Syndrome of coset leaders")
% disp(SynMap)

e = zeros(1,n);

for i = 1:n+1
    % determine one bit error by reverse mapping syndrome of r to coset leader(error)
    if S == SynMap(i,:)
        e = CosetLead(i,:);
    end
end
% disp("error")
% disp(e)

% decoded c_ = r+e 
c_ = rem(r + e,2);
end