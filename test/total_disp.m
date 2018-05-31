clear all;
close all;
clc;
%%
lambda =     linspace(0.8e-6,3.8e-6,100);       % [m] operating wavelength
n2 = 1.475;             % cladding
n1 = 1.5;               % core
nu = 2;

[v, dw] = function_waveguide_dispersion(n1, n2, nu);

dm = function_material_dispersion();

d = dw + dm;

figure
plot(lambda, d,'k'); grid
xlabel('\lambda (\mum)')
ylabel('Total Dispersion [ps/(nm km)]')
title('Fused silica, 20 °C')

hold on
plot(lambda, dw,'k--');
hold on
plot(lambda, dm,'k--');
ylim([-500 500])