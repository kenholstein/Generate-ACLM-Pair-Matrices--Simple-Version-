function [ var_check ] = var_control( Z )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

var_check=1;
for i=1:(size(Z,1)-1)
    if Z(i,2:3)==Z(i+1,2:3)         %if F1,F2 are constant between these trials
        if ( (Z(i,1) + Z(i+1,1))==0 || (Z(i,1) + Z(i+1,1))==2 )  %if C is 0 on both of these trials, or 1 on both trials
            var_check=0;
            break;
        end
    end
end

end