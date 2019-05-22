load('M80/N4/Gn0.1/sweepalpha50.mat','H','ww')
H1=H{26};
H2=H{31};
H3=H{33};
W1=ww;


% alpha1list=0:0.005:1;
% alpha2list=0:0.005:1;
enlist=-2:0.01:2;
condmap0=zeros(length(traj),length(enlist));
% eiglist=zeros(length(alphalist),length(H1));
% eigroot=zeros(length(alphalist),length(H1));
% count=0;
for alphaindex=1:length(alphalistx)
    alpha1=alphalistx(alphaindex);
    alpha2=alphalisty(alphaindex);
    hh=alpha1*H1+alpha2*H2+(1-alpha1-alpha2)*H3;
    condlist=arrayfun(@(x)G(x,hh,W1),enlist); 
    %Finite temperature
%     [flag,~,~,root]=isimag(hh,W1);
%         if flag==1
%             T=root(1)/(2*0.7717);
%         else
            T=0;
%         end      
%     condlist=GE(T,enlist,condlist);
    
    condmap0(alphaindex,:)=condlist;
%     eiglist(alphaindex,:)=eig(hh);
%     count=count+isimag(hh,W1);
%     hheff=heff(hh,W1);g
%     eigroot(alphaindex,:)=eig(hheff);
end
% disp(count/length(alphalist))
condmap0=real(condmap0);
figure;
surf(1:length(alphalistx),enlist,condmap0','edgecolor','none');view(2)
ylabel('E/\delta_0')
colorbar
% hold on
% plot3(alphalist,eiglist,10*ones(length(alphalist),1),'k');
% ylim([-2,2])