function [ Z ] = trial_Main(num_examples,  num_pairs, pair_direction, control_var)
%trial_Main
%
%first input argument: 
%   number of trial sequences to generate
%
%second input argument: 
%   exact number of adjacent confound-level-matched (aclm) pairs to include
%
%third input argument:
%   direction (0 or +1) within aclm pairs
%
%fourth input argument:
%   enter '1' to generate sequences in which NO
%   adjacent pairs of observations with constant confound levels are
%   allowed (this is to prevent potential inferences about variation across
%   trials in a particular target cause's efficacy, while confounds are held constant)
%       Otherwise, enter '0'.

for i=1:num_examples
    
    %NOTE: this outer for-loop will concatenate two 20-trial matrices
    for j=1:2
        success=0;
        while (success ~= 1)
            [success, Q]=order_Trials(control_var,num_pairs,pair_direction);
            Z( (j*20 - 19):(j*20) ,:) = Q;
        end;
    end;
    
    %write special-grouped matrix to .csv file
    dlmwrite('generated_cases.csv',Z,'-append','roffset',2)

    
end

end

