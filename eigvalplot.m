ilist=[1,55,155];
colorlist=['b','r','k'];
figure;
for ind=1:length(ilist)
    % i=201;
% H1=H{end};
% W1=W{end};
% H1=hh;
% W1=ww;
% Heff=heff(H1,W1);
% eiglist=eig(Heff);

% scatter(real(eiglist(:)),imag(eiglist(:)),'.');
i=ilist(ind);
if hm>vm
    dispname=(strcat("\alpha_1=",num2str(alpha2list(i)),"\alpha_2=",num2str(alpha1list(hpos))));
else
    dispname=(strcat("\alpha_1=",num2str(alpha1list(vpos)),"\alpha_2=",num2str(alpha2list(i))));
end
scatter(real(eigroot(i,:)),imag(eigroot(i,:)),200,strcat('.',colorlist(ind)),'DisplayName',dispname);
grid
xlim([-1,1])
hold on
end
legend;


hold off
figure;
fig=zeros(length(ilist),2);
for ind=1:length(ilist)
i=ilist(ind);
if hm>vm
    dispname=(strcat("\alpha_1=",num2str(alpha2list(i)),"\alpha_2=",num2str(alpha1list(hpos))));
else
    dispname=(strcat("\alpha_1=",num2str(alpha1list(vpos)),"\alpha_2=",num2str(alpha2list(i))));
end
fig(ind,1)=plot(enlist,enmap(i,:),strcat('-',colorlist(ind)),'DisplayName',dispname);
xlabel("E/\delta_0");
ylabel("G(e^2/h)")
hold on;
fig(ind,2)=plot(enlist,enmap1(i,:),strcat('--',colorlist(ind)));
end
legend(fig(:,1))



for i=ilist
	if hm>vm
        line([alpha1list(i),alpha1list(i)],[-2,2],[10,10],'color','r','linewidth',2);
    else
        line([alpha2list(i),alpha2list(i)],[-2,2],[10,10],'color','r','linewidth',2);
    end
end
