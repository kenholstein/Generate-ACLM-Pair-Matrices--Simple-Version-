function [ Z ] = generate_spellman(C1_C2, C1_nC2, nC1_C2, nC1_nC2)
%Generate matrix of data identical in form to ones found in BA Spellman's
%1996 "Acting as Intuitive Scientists" paper.
%   Input 4 (1x2) vectors encoding [as will be described below] 
%   the total numbers of observations with a certain combination
%   of factors (C1 and C2), and also the number of times 
%   that the effect occurs for each type of observation.
%   Within each (1x2) vector, the 2nd parameter indicates total # of 
%   observations for this type, and the 1st parameter indicates how many 
%   times the effect was present for this combination of factors.
%
%   Enter these vectors in the following order: 
%   C1_C2, C1_nC2, nC1_C2, nC1_nC2.
%   (where nC1_C2, for example, is the vector:
%    [ <# of observations with effect E present when C1 absent and 
%     C2 present>, <total # of observations with C1 absent and C2 present> ] )
%
%   ***In other words: each input vector corresponds to a cell in one of
%   the 2x2 matrices that Spellman uses to describe different experimental
%   conditions. The first input with each input vector then corresponds to the
%   numerator of the term within each of these cells, and the second input
%   term corresponds to the denominator.***
%
%The output matrix will be in the following format:
%   rows are observations/trials
%   column 1 represents C1
%   column 2 represents C2
%   column 3 represents Effect
%


%generate spellman matrix with observations in a default order (i.e. not randomized)
length_obs=C1_C2(2) + C1_nC2(2) + nC1_C2(2) + nC1_nC2(2); %total number of observations in matrix
Z = zeros(length_obs,3); %initialize the matrix

%the code below populates the matrix sequentially (and rather unelegantly)
i=1;
for j=i:i+C1_C2(1,1)-1
    Z(j,:) = [1 1 1];
end;
i=i+C1_C2(1,1);
empty_obs=C1_C2(1,2)-C1_C2(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [1 1 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+C1_nC2(1,1)-1
    Z(j,:) = [1 0 1];
end;
i=i+C1_nC2(1,1);
empty_obs=C1_nC2(1,2)-C1_nC2(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [1 0 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+nC1_C2(1,1)-1
    Z(j,:) = [0 1 1];
end;
i=i+C1_nC2(1,1);
empty_obs=nC1_C2(1,2)-nC1_C2(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [0 1 0];
    end;
    i=i+empty_obs;
end;

for j=i:i+nC1_nC2(1,1)-1
    Z(j,:) = [0 0 1];
end;
i=i+nC1_nC2(1,1);
empty_obs=nC1_nC2(1,2)-nC1_nC2(1,1);
if empty_obs ~=  0
    for j=i:i+empty_obs-1
        Z(j,:) = [0 0 0];
    end;
    i=i+empty_obs;
end;

end