function [fidx] = DTC(X,distm)
%DTC Summary of this function goes here
%   Detailed explanation goes here
% X: cell containing data from each site
% distm: choice for distance (eg. euclidean, cosine)

snum = size(X,2); %% number of sites
%datadim = size(X{1},2);
DMs = cell(1,snum);

parfor i=1:snum
    DMs{i} = pdist2(X{i},X{i},distm);
end

siteslabels=cell(1,snum);
cls=cell(1,snum);
K = 0;
cutstep = 2;
parfor i=1:snum
    cls{i}=TorqueClustering_PF_cutstep(DMs{i},cutstep,0);
end

parfor i=1:snum
    siteslabels{i}=cls{i}(:,end);
end

subcommu_num = zeros(1,snum);

parfor i=1:snum
    subcommu_num(i) = numel(unique(siteslabels{i}));
end

%core_num = sum(subcommu_num);
%coredata = zeros(core_num,datadim);
%iniM = zeros(core_num,1);
coredata=[];iniM=[];

for i=1:1:snum
    mdata = coolMean(X{i},siteslabels{i});
    %mdata = coolmedoid(X{i},siteslabels{i},distm);
    submass = hist(siteslabels{i},unique(siteslabels{i}));
    coredata = [coredata;mdata];
    iniM = [iniM;submass'];
end

coreDM = pdist2(coredata,coredata,distm);

%for i=1:1:size(coredata,1)
%    coreDM(i,i)=-inf;
%end
coreDM(logical(eye(size(coreDM)))) = -inf;


idx = WTorqueClustering(coreDM,iniM,K,0,0);

Out = mat2cell(idx', 1, subcommu_num);

fidx=[];

for i=1:snum
    gd = subidx(siteslabels{i},Out{i}',subcommu_num(i));
    fidx = [fidx;gd];
end




    function subcl = subidx(silabels,flabel,commu_num)
           
        num = length(silabels); subcl = zeros(num,1);
        community=cell(1,commu_num);
        uni = unique(silabels);
        parfor i=1:commu_num
            community{i}=find(silabels==uni(i));
        end
        for i=1:commu_num
            subcl(community{i}) = flabel(i);
        end
    end



end

