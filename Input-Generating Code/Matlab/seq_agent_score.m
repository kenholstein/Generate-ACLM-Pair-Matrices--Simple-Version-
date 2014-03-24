function [score_keeper] = seq_agent_score( Z )
%For an input matrix of observations Z,
%seq_agent_score returns a matrix score_keeper with the following
%dimensions:
%  if <number of ACLM pairs in Z> >= default_num_rows
%        score_keeper has dimensions (<number of ACLM pairs in Z> , 2)
%  otherwise:
%        score_keeper has dimensions (default_num_rows , 2)
%
%score_keeper provides information about the within-ACLM pair 
%contingency of 2 variables
%

%initialize score_keeper with default_num_rows rows (rows will be added to the vector if needed)
default_num_rows = 4;
score_keeper=99*ones(default_num_rows,2);
%Note: the scalar 99 is an arbitrarily 'large' value, which is used as a 
%default value. This default value is used as an indicator that a certain 
%entry in the score_keeper has not been changed by the below code.

j=1;
%for each observation in z
for i=1:(size(Z,1)-1)
    %if this row and one immediately following it constitute an ACLM pair...
    if Z(i,2)==Z(i+1,2) && (Z(i,1) + Z(i+1,1))==1
        C2_label = Z(i,2); %store the value (absent or present) of C2
        %find the row in which C1=1 and the row in which C1=0
        A_1 = find(Z(i:i+1,1)==1);
        A_0 = find(Z(i:i+1,1)==0);

        %the value in column 2 of score_keeper will be:
        % (<value of E when C1 present> - <value of E when C1 absent>)
        %and column 1 will store the C2_label
        score_keeper(j,:) = [C2_label , Z(i+A_1-1,3) - Z(i+A_0-1,3)];
        j = j + 1;
    end;   
end


end