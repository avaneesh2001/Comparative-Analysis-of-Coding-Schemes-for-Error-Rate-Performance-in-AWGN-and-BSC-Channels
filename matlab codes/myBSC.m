% Function to simulate BSC with Perr =p
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
