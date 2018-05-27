clear all;
close all;
clc;
%%
syms lambda

n(lambda) = sqrt((0.6961663*lambda^2)/(lambda^2-0.0684043^2)+...
            (0.4079426*lambda^2)/(lambda^2-0.1162414^2)+...
            (0.8974794*lambda^2)/(lambda^2-9.896161^2)+1);

D(lambda) = -(lambda/Const.c0).*diff(diff(n,lambda),lambda)*(1e12)/((1e3)*(1e-3));        

fn = matlabFunction(n);
fD = matlabFunction(D);

%Lambda = linspace(0.21,6.7,500);
Lambda = linspace(0.8,3.8,500);

figure
plot(Lambda,fn(Lambda),'k');grid
xlabel('\lambda (\mum)')
ylabel('Refractive index')
title('Fused silica, 20 °C')

figure
plot(Lambda,fD(Lambda),'k');grid
xlabel('\lambda (\mum)')
ylabel('Dispersion [ps/(nm km)]')
title('Fused silica, 20 °C')

%%





