function [success, Z, scores] = order_Trials(num_pairs, pair_direction, threshold)
%order_Trials 
% Generate a matrix with trials ordered such that num_pairs ACLM pairs are
% generated, with (the absolute-value of) the within-ACLM pair contingency 
% greater than or equal to the threshold
%

%The within-ACLM pair contingency of C2 will be constrained to be equal to
%the value of confound_ACLM_contingency
confound_ACLM_contingency = 0.4; % ****Change this value to whatever you'd like****

%maximum iterations before terminating (as the program is currently set-up,
%'termination' will result in order_Trials being called again)
max_iterations = 10000;

%generate trials according to the parameters in the generate_Trials
%function
Z = generate_Trials;

j=1;
success=0;
while j < max_iterations
    %randomly permute Z
    Z=Z(randperm(size(Z,1)),:);

    %get scores from seq_agent_score (i.e. compute within-ACLM-pair contingency for C1 and E)
    scores = seq_agent_score(Z);

    %if the correct number of ACLM pairs are generated, and the within-ACLM
    %pair contingency is e
    if size(scores,1)==num_pairs && all(abs(scores(:,2)) <=1) && mean(pair_direction*scores(:,2))>=threshold
        scores(:,2) %***for testing purposes*** ...displays score vector each time the correct number of ACLM pairs are generated
        
        %compute within-ACLM-pair contingency, this time for C2 and E
        V = seq_agent_score(Z(:,[2,1,3]));
        confound_ACLM_score = mean(V(:,2));
        %force within-ACLM-pair contingency of the confounding variable to be equal to a certain value
        if confound_ACLM_score==confound_ACLM_contingency
            success = 1;
            break;
        end
    end
    
    j=j+1; 
end

end