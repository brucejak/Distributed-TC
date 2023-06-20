function [newdata,mass,community] = TCsampling(data,distm,level)
%TCSAMPLING Summary of this function goes here
%   Detailed explanation goes here
DM = pdist2(data,data,distm);
cls = TorqueClustering_PF(DM,0);

scl = cls(:,level);

uni = unique(scl); unum = numel(uni);

newdata = coolMean(data,scl);
    %mdata = coolmedoid(X{i},siteslabels{i},distm);
mass = hist(scl,uni);

community = cell(1,unum);

parfor i=1:unum
    community{i} = find(scl==uni(i));
end


end

