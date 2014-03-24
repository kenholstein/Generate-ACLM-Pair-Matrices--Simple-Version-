function [score_vector] = seq_agent_score( Z, pair_direction )
%
score_vector=99*ones(4,2);

if pair_direction==1
    j=1;
    for i=1:(size(Z,1)-1)
        if Z(i,2)==Z(i+1,2)         %if F1 is constant between these trials
            if (Z(i,1) + Z(i+1,1))==1   %if C is 0 on one of these trials, 1 on the other
                F1=Z(i,2);
                factor_label = F1; %arbitrarily chosen coefficients... factor_label represents specific factor-levels

                %find row in which C=1 and row in which C=0
                A_1 = find(Z(i:i+1,1)==1);
                A_0 = find(Z(i:i+1,1)==0);

                score_vector(j,:) = [factor_label , Z(i+A_1-1,3)-Z(i+A_0-1,3)]; %the value in column 2 will be (C1_effect - C0_effect)
                j = j + 1;

            end;
        end;   
    end;
end

if pair_direction==0
    j=1;
    for i=1:(size(Z,1)-1)
        if Z(i,2)==Z(i+1,2)         %if F1 is constant between these trials
            if (Z(i,1) + Z(i+1,1))==1   %if C is 0 on one of these trials, 1 on the other
                if not(Z(i,1)==1 && Z(i,3)==0 && Z(i+1,1)==0 && Z(i+1,3)==0 ) && not(Z(i,1)==0 && Z(i,3)==1 && Z(i+1,1)==1 && Z(i+1,3)==1)
                    F1=Z(i,2);
                    factor_label = F1; %arbitrarily chosen coefficients... factor_label represents specific factor-levels

                    %find row in which C=1 and row in which C=0
                    A_1 = find(Z(i:i+1,1)==1);
                    A_0 = find(Z(i:i+1,1)==0);

                    score_vector(j,:) = [factor_label , Z(i+A_1-1,3)-Z(i+A_0-1,3)]; %the value in column 2 will be (C1_effect - C0_effect)
                    j = j + 1;
                end;
            end;
        end;   
    end;
end

end