function [ accuracy ] = MyCrossValidation(i, Labeled_DATA, Hidden_node)


%load('matlab.mat')
accuracy=0;

Indices = crossvalind('Kfold', 137, 10);
testindex = 1;
trainindex = 1;

[row col] = size(Labeled_DATA);

%for SVM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Unlabeld_DATA = Labeled_DATA(:, 2:col);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:10
   for j=1:137

      if (Indices(j)==i)
           %forELM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           %Test(testindex, :)= DATA(j, :);
           %forSVM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           Test(testindex, :)= Unlabeld_DATA(j, :);
           Test_TargetVector(testindex) = Labeled_DATA(j, 1);%forSVM
           testindex = testindex +1;
      end 

      if (Indices(j)~=i)
           %forELM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           %Train(trainindex, :)= DATA(j, :);
           %forSVM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           Train(trainindex, :)= Unlabeld_DATA(j, :);
           Train_TargetVector(trainindex) = Labeled_DATA(j, 1);%forSVM
           trainindex = trainindex +1;
      end
         
   end   
   %ELM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %accuracy= accuracy + ELM(Train, Test, 1, Hidden_node, 'sig');
   %SVM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SVM
%Train= DATA_27579(1:123, 2:2757);
%Train_TargetVector= DATA_27579(1:123, 1);
%Test= DATA_27579(124:137, 2:2757);

%SVM_MoDEL= fitcsvm(Train, Train_TargetVector,'KernelFunction', 'rbf', 'Standardize', true);
SVM_MoDEL= fitcsvm(Train, Train_TargetVector,'KernelScale','auto','Standardize',true,...
    'OutlierFraction',0.05);

[label score] = predict(SVM_MoDEL, Test);

%reallabel= DATA_27579(124:137, 1);

[x y]=size(Test);

errorArray= transpose(Test_TargetVector)-label;

for p=1:x
if(errorArray(p) <0)
errorArray(p) = errorArray(p) *(-1);
end
end
[lengthoftest b]=size(Test);
number_of_loss_datda= sum(errorArray);
TestAccuracy =1- number_of_loss_datda/lengthoftest;

accuracy = accuracy + TestAccuracy;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
 end
 
 accuracy = accuracy/10;
end  

  



