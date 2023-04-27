function data = column_split_nmf()% RawINtmethylation27579 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



load('matlab.mat')

A = zeros(27, 137, 1000);
A_rest = zeros(137, 579);

for i=1:28
    
    
%    if (i == 28)
%     for j=1: 579
%     A_rest(:,:) =  RawINtmethylation27579(:, j); %the rest columns in A(i, :, j) would be zero
%     end
%    end
 
if i <28
   % for j=1: 1000
     A(i, :, 1:1000) =  Raw_Labeled_27579(:,( 1+1000*(i-1) ):(1000*i) );
   % end
end    
end


%NMF
data = zeros(137, 2700);

  for i=1:27
         B= zeros(137, 1000);
         B(:,:) = A(i, :, :); %contains the ith 138 * 1000 matrix of data
        
 %        if (i == 28)
 %          B = A_rest;
 %        end    
               
          if i<28
                  [W1, H1] = nnmf(B, 100);
 
                   for k=1:100
                   data(:, k+100*(i-1))= W1(:, k);
                   end
          end
          
  end
  data          
          
end




