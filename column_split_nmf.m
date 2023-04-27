function second_data = column_split_nmf(split, originalsize, data)% RawINtmethylation27579 )
%%%%%%%%%%%%%%%%%%%%%originalsize = 27000%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%load('matlab.mat')
each_part_column = floor(originalsize/split);

A = zeros(split, 137, each_part_column);
%A_rest = zeros(137, 579);

for i=1:(split+1)
    
    
%    if (i == 28)
%     for j=1: 579
%     A_rest(:,:) =  RawINtmethylation27579(:, j); %the rest columns in A(i, :, j) would be zero
%     end
%    end
 
if i <(split+1)
   % for j=1: 1000
     A(i, :, 1:each_part_column) =  data(:,( 1+each_part_column*(i-1) ):(each_part_column*i) );
   % end
end    
end


%NMF
second_dimension = 100 * split;
second_data = zeros(137, second_dimension);

  for i=1:split
         B= zeros(137, each_part_column);
         B(:,:) = A(i, :, :); %contains the ith 138 * 1000 matrix of data
        
 %        if (i == 28)
 %          B = A_rest;
 %        end    
               
          if i<(split+1)
                  [W1, H1] = nnmf(B, 100);
 
                   for k=1:100
                   second_data(:, k+100*(i-1))= W1(:, k);
                   end
          end
          
  end
      
          
end




