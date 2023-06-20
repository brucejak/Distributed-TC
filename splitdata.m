function [data_subsets] = splitdata(data,subsize)
%SPLITDATA Summary of this function goes here
%   Detailed explanation goes here
subset_size = subsize;
num_subsets = ceil(size(data, 1) / subset_size);
data_subsets = cell(1, num_subsets);

for i = 1:num_subsets
    start_idx = (i - 1) * subset_size + 1;
    end_idx = min(i * subset_size, size(data, 1));
    data_subsets{i} = data(start_idx:end_idx, :);
end
end

