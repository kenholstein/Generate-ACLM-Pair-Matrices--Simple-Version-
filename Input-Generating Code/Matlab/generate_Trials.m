function [ Z ] = generate_Trials( ~ )
%generate_Trials
%
% Enter parameters for generate_spellman here:
%
%  ***Specifically***
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

    Z = generate_spellman([4 5], [2 5], [4 5], [2 5]); %20 trials total
    %Z = generate_spellman([8 10], [4 10], [8 10], [4 10]); %40 trials total
end