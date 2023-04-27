%SVM
Train= DATA_27579(1:123, 2:2757);
Train_TargetVector= DATA_27579(1:123, 1);
Test= DATA_27579(124:137, 2:2757);

SVM_MoDEL= fitcsvm(Train, Train_TargetVector,'KernelFunction', 'rbf', 'Standardize', true);

[label score] = predict(SVM_MoDEL, Test);

reallabel= DATA_27579(124:137, 1);


errorArray= reallabel-label;
for i=1:14
if(errorArray(i) <0)
errorArray(i) = errorArray(i) *(-1);
end
end
[lengthoftest b]=size(Test);
number_of_loss_datda= sum(errorArray);
TestAccuracy =1- number_of_loss_datda/lengthoftest;

TestAccuracy


