function [m,loc] = medoid(data,metric)
%MEDOID Summary of this function goes here
%   Detailed explanation goes here
DM = squareform(pdist(data,metric));

sum_DM = sum(DM);

gd = find(sum_DM==min(sum_DM));

m = data(gd(1),:);
loc = gd(1);

end

