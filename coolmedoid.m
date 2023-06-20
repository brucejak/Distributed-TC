function [meds,locs] = coolmedoid(data,idx,distm)
%COOLMEDOID Summary of this function goes here
%   Detailed explanation goes here
uni = unique(idx);

num = numel(uni);

[~,dim]=size(data);

meds = zeros(num,dim);
locs = zeros(num,1);

parfor i=1:num
[meds(i,:),locs(i)] = medoid(data((idx==uni(i)),:),distm);
end

end

