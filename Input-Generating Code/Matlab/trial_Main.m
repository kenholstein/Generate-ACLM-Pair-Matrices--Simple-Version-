function [ Z ] = trial_Main(num_examples,  num_pairs, pair_direction, threshold)
%trial_Main
%
%first input argument: 
%   number of trial sequences to generate
%
%second input argument: 
%   exact number of adjacent confound-level-matched (ACLM) pairs to include
%
%third input argument:
%   direction of contingency (-1 or +1) within ACLM pairs
%
%fourth input argument:
%   for chosen direction, the within-pair contingency will be constrained
%   to be greater-than (or less-than, if the pair direction is -1) 
%   pair_direction*threshold, where 0 < threshold < 1


%generates num_examples matrices having the order-invariant properties 
%specified in the code of generate_Trials (modify as needed), and the
%ordered properties determined by the input parameters of this function
%and the value of confound_ACLM_contingency in order_Trials
for i=1:num_examples
    success=0;
    %tries order_Trials until success flag is returned 
    %... note that infinite loops are currently possible
    while (success ~= 1)
        [success, Z]=order_Trials(num_pairs, pair_direction, threshold);
    end;
    
    %write grouped matrix to .csv file
    dlmwrite('generated_cases.csv',Z,'-append','roffset',2)
    
end

end

