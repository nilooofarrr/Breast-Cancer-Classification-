function [ Train_Time, Accuracy_Array ] = SPLIT_NMF_BINClassify_CROSSVALID()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

load('matlab.mat');

Train_Time= zeros(size(split_arr));
Accuracy_Array= zeros(size(split_arr));
endfor= size(split_arr);

for i=1:endfor(2)
    c1=clock;
    
    if(split_arr(i)==0)
       data = DATA_27579;
    Accuracy_Array(i)=MyCrossValidation(i_fold, data, Hidden_node_array(i));  
    
    c2=clock;
    Train_Time(i)= c2(6)- c1(6) + (c2(5)-c1(5))*60;
    end

    if(split_arr(i)~=0)
       data = column_split_nmf(split_arr(i), 27000, DATA_27579);
       %%%%ADD labels column to the left
       data(:, 2:(split_arr(i) *100+1)) = data(:, 1:(split_arr(i) *100));
       data(:, 1) = DATA_27579(:, 1);
    
     Accuracy_Array(i)=MyCrossValidation(i_fold, data, Hidden_node_array(i));
 
    c2=clock;
    Train_Time(i)= c2(6)- c1(6) + (c2(5)-c1(5))*60;
    end

end

Train_Time
Accuracy_Array
end

