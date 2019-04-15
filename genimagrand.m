clear all
num=100;
H={};
W={};
gamma=[];
for i=1:num
    [hh,ww]=hw(40,2);  
    [flag,hh,ww,gg]=isimag(hh,ww);
    if flag==1
        H{end+1}=hh;
        W{end+1}=ww;
        gamma=[gamma,sort(gg)];
    end
end
cond=zeros(length(gamma),1);
parfor i=1:length(gamma)
    condlist=arrayfun(@(x) G(x,H{i},W{i}),-0.05:0.005:0.05);
    cond(i)=real(mean(condlist));
end
figure;scatter(cond,log(gamma(2,:)./gamma(1,:)),'.');
title(sprintf('%d out of %d = %f',length(gamma),num,length(gamma)/num));
savefig(sprintf('ratio%d.fig',num))
figure;scatter3(gamma(1,:),gamma(2,:),cond,'.');
title(sprintf('%d out of %d = %f',length(gamma),num,length(gamma)/num));
xlabel('\gamma_1');
ylabel('\gamma_2');
zlabel('G');
savefig(sprintf('gamma%d.fig',num))
save(sprintf('num%d.mat',num), '-v7.3');