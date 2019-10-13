function [mu,mumin,mumax]=correlation(L)
corlist=zeros(300,1);
corfunchandle=@(x) corfunc(80,4,0.1,x);
parfor i=1:length(corlist)
    corlist(i)=feval(corfunchandle,L);
end
x=sort(corlist);
y=(1:length(corlist))'/length(corlist);
ft=fittype('1/2*(erf(k*(x-mu))+erf(k*(1+mu)))','independent','x','dependent','y');
fitresult=fit(x,y,ft,'StartPoint',[0,0.2]);
coeff=coeffvalues(fitresult);
mu=coeff(2);
int95=confint(fitresult);
mumin=int95(1,2);
mumax=int95(2,2);


function cor=corfunc(m,n,gn,L)
[H1,W1]=hwg_nw(m,n,gn,L);
enlist=-5:5e-2:5;
condlist=arrayfun(@(x) Gm(x,H1,W1),enlist,'UniformOutput',false); 
condmat=cat(3,condlist{:});
cor=corrcoef([squeeze(condmat(1,1,:)),squeeze(condmat(2,2,:))]);
cor=cor(1,2);
end
end
