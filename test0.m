[H0,W0]=hwg(800,4,0.1);
figure;
hold on
enlist=-1:1e-2:1;
condlist=arrayfun(@(x) G(x,H1,W0),enlist); 
plot(enlist,real(condlist));
xlabel('Energy');
ylabel('$G(\frac{e^2}{h})$','Interpreter','latex');
