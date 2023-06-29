

clear
data=importdata('worms_64.data');
datalabels=importdata('worms_64.labels0');
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)


clear
data=importdata('pendigits.mat');
datalabels=data.datalabels;data=data.data;
X = splitdata(data,2500);
tic,cl=DTC(X,'cosine');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)
