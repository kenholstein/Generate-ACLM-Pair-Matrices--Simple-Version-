for i=1:60
    V=ones(3)*50;
    while not(mean(V(:,2)) <= 1)
        Q = trial_Main(1,6,0,0)
        V = seq_agent_score(Q(:,[2,1,3]),0)
    end;
    zero_scores(i) = mean(V(:,2))
    
end

for i=1:60
    V=ones(3)*50;
    while not(mean(V(:,2)) <= 1)
        Q = trial_Main(1,6,1,0)
        V = seq_agent_score(Q(:,[2,1,3]),0)
    end;
    one_scores(i) = mean(V(:,2))
    
end