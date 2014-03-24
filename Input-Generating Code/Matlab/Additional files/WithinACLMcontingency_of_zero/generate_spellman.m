function [ Z ] = generate_spellman(R_B, R_nB, nR_B, nR_nB)
%Generate matrix of data identical to that from BA Spellman's
%1996 "Acting as Intuitive Scientists" paper.
%   Enter (1x2) vectors encoding the numbers (80 observations will be generated in total) 
%   and proportions of each type of observation, and also (as described
%   below), the number of times for each type of observation that the
%   effect occurs.
%   Within each vector, the 2nd parameter indicates total # obs for this type.... 
%   the 1st param indicates how many times the effect was present for this
%   combination of factors (e.g. "red and blue liquid both present"). Enter
%   these vectors in the following order: R_B, R_nB, nR_B, nr_nB.
%
%The output matrix will be in the following format:
%   rows are trials
%   column 1 represents Factor1/A
%   column 2 represents Factor2/B
%   column 3 represents Effect

%generate spellman data (in a default order)
length_obs=R_B(2) + R_nB(2) + nR_B(2) + nR_nB(2);
Z = zeros(length_obs,3);

i=1;
for j=i:i+R_B(1,1)-1
    Z(j,:) = [1 1 1];
end;
i=i+R_B(1,1);
empty_obs=R_B(1,2)-R_B(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [1 1 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+R_nB(1,1)-1
    Z(j,:) = [1 0 1];
end;
i=i+R_nB(1,1);
empty_obs=R_nB(1,2)-R_nB(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [1 0 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+nR_B(1,1)-1
    Z(j,:) = [0 1 1];
end;
i=i+R_nB(1,1);
empty_obs=nR_B(1,2)-nR_B(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [0 1 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+nR_nB(1,1)-1
    Z(j,:) = [0 0 1];
end;
i=i+nR_nB(1,1);
empty_obs=nR_nB(1,2)-nR_nB(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [0 0 0];
    end;
    i=i+empty_obs;
end;

end