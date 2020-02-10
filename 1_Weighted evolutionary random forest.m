clearvars -except FC
EMCI = -ones(1, 37);
LMCI = ones(1, 26);
labels = [EMCI, LMCI];
 
n = 45;               
x = randperm(63);
y = x(1:n);             
z = x(n+1:63);         
 
N = 300;               
test_num = length(z);  
test_lab = labels(z);   
 
fc_num = 57;            
sam_num = 30;          
 
weight = zeros(1, N);   
fc = zeros(N, fc_num);  
 
val_out = zeros(N, 15);
test_out = zeros(N, test_num);
 
 
for i = 1:N
    flag = zeros(1, n);
    sample_num = randsample(length(y), sam_num, 'false');
    flag(sample_num) = 1;
    train = y(sample_num);     
    train_lab = labels(train);
    fc(i, :) = randsample(size(FC, 2), fc_num, 'false');
    fc_temp = fc(i, :);
    validate = y(flag == 0);
    val_lab = labels(validate);
    train_set = FC(train, fc_temp);
    tree = fitctree(train_set, train_lab);
    validate_set = FC(validate, fc_temp);
    val_out(i, :) = predict(tree, validate_set);
    weight(i) = sum(val_lab == val_out(i, :))/length(val_lab);
    test_set = FC(z, fc_temp);
    test_out(i, :) = predict(tree, test_set);
end
result = zeros(1, length(z));
for i = 1:length(z)
    result(i) = sum(test_out(:, i) .* weight');
end
result1 = sign(result);
R = sum(result1 == test_lab);
['Accuracy rate:' num2str(R/length(z))]
f = find(weight <= 0.5);    
fc1 = fc(f, :);            
len = zeros(1, size(FC, 2));
for i = 1:size(FC, 2)
    len(i) = length(find(fc1 == i));
end
Freq = find(len > 6);
FC(:, Freq) = [];
bianhao = find(len <= 6);
