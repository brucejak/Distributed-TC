clear
data=importdata('data_TB_100000.mat');
datalabels=data.gt;
data=data.fea;
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('data_CC_100000.mat');
datalabels=data.gt;
data=data.fea;
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('ring.mat');
datalabels=data(:,end);
data(:,end)=[];
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('birch2.txt');
datalabels=importdata('b2-gt.txt');
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('worms_64.data');
datalabels=importdata('worms_64.labels0');
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
commandhistory
data=importdata('MNIST_UMAP.mat');
datalabels=data.datalabels;
data=data.data;
X = splitdata(data,2500);
tic,cl=DTC(X,'euc');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear;
disp('For Shuttle data set:')
data=importdata('shuttle.mat');
datalabels=double(data.gtlabels)';
data=double(data.X);
datalabels=datalabels+1;
X = splitdata(data,2500);
tic,cl=DTC(X,'cosine');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('NH.mat');
datalabels=data.datalabels;data=data.data;
X = splitdata(data,2500);
tic,cl=DTC(X,'cosine');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('pendigits.mat');
datalabels=data.datalabels;data=data.data;
X = splitdata(data,2500);
tic,cl=DTC(X,'cosine');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)

clear
data=importdata('satimage.mat');
datalabels=data.datalabels;data=data.data;
X = splitdata(data,2500);
tic,cl=DTC(X,'cosine');toc,NC=numel(unique(cl)),AM=ami(cl,datalabels+1),NM=nmi(cl,datalabels)