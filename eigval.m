countlist=[];
countmax=0;
for i=10373:length(H)
    j=2;
    if i~=j
    H1=H{i};
    H2=H{j};
    W1=W{1};
    alphalist=0:0.005:1;
    enlist=-1:0.01:1;
    eiglist=zeros(length(alphalist),length(H1));
    count=0;
    parfor alphaindex=1:length(alphalist)
        alpha=alphalist(alphaindex);
        hh=(1-alpha)*H1+alpha*H2;
        count=count+isimag(hh,W1);
        hheff=heff(hh,W1);
        eiglist(alphaindex,:)=eig(hheff)
    %     enmap(alphaindex,:)=arrayfun(@(x)G(x,(1-alpha)*H1+alpha*H2,W1),enlist); 
    %     eiglist(alphaindex,:)=eig((1-alpha)*H1+alpha*H2);
    end
    if  count>countmax
        countmax=count;
        fprintf("%d->%d:%f\n",i,2,count/length(alphalist));
    end
    countlist=[countlist,count];
    % enmap=real(enmap);
    % figure;
    % surf(alphalist,enlist,enmap'-2,'edgecolor','none');view(2)
    % hold on
    % plot(alphalist,eiglist,'k');
    % ylim([-1,1])
    end
end