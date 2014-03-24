function [success, Z, scores] = order_Trials(control_var, num_pairs, pair_direction)
%order_Trials Summary of this function goes here
%   Detailed explanation goes here

Z = generate_Trials;

max_iterations = 10000;

%canonized_check_vector = zeros(1,num_pairs);
%canonized_check_vector(((num_pairs/2)+1):num_pairs) = 1;

j=1;
success=0;
while j < max_iterations
    %randomly permute Z
    Z=Z(randperm(size(Z,1)),:);

    %get scores from seq_agent_score
    scores = seq_agent_score(Z,pair_direction);
    
    %check if there are no adjacent observations where confound levels are
    %constant and target cause levels are also constant ('1' will indicate absence)
    if control_var==1
        var_check = var_control(Z);
    end;
    
    if size(scores,1)==num_pairs
        %if sum(sort(scores(:,1))==canonized_check_vector')==num_pairs
            if all(scores(:,2)==pair_direction)  %this will select cases where all (C1_effect - C0_effect) values within our special pairs are (-1 / +1)
                scores(:,2)
                V = seq_agent_score(Z(:,[2,1,3]),1);
                confound_ACLM_score = mean(V(:,2));
                if confound_ACLM_score==0.5     %force within-ACLM-pair contingency of the confounding variable to lie within an interval
                    if control_var==1
                        if var_check==1
                            success = 1;
                            break;
                        end
                    else
                        success = 1;
                        break;
                    end;
                end
            end;
        %end
    end
    
    j=j+1;
    
end

end

