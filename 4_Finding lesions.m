t = 1;
for i = 1:36
    for j = 1:90
        a(i, j) = t;
        t = t + 1;
    end
end
for i = 1:342
    [XX(i), YY(i)] = find(a == bianhao(i));
end 
brain =zeros(1,90);      
for i = 1:90   
     brain (i) = length(find(YY == i));   
end
[rank_b,brain_pos_b]=sort(brain,'descend'); 
brain_new=[rank_b; brain_pos_b];            
jiyin = zeros(1, 36);
for i = 1:36
    jiyin(i) = length(find(XX == i));
end
[rank_j, brain_pos_j]=sort(jiyin,'descend'); 
jiyin_new=[rank_j; brain_pos_j]; 