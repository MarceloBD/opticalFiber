clear all;
close all;
clc;
%%
lambda0 = 1.55e-6;          % [m] operating wavelength
n1 = 1.48;               % core
delta = 0.005;
n2 = n1*(1 - delta);     % cladding
a = 1.6e-6;                 % [m] core radius
nu = 1;

na = sqrt(n1^2 - n2^2);
v = 2 * pi * a * na/lambda0;
fprintf('Normalized frequency: %f \n', v)
fprintf('Quantity of modes propagating: %f \n %f \n', v^2/2)

%% neff
k0 = 2 * pi/lambda0;
neff = function_calc_neff(nu, k0, n1, n2, a);
fprintf('Quantity of modes propagating: %d \n', length(neff))
fprintf('Effective refractive index: %f \n', neff)
b = (neff.^2 - n2^2)/(n1^2 - n2^2);
fprintf('Normalized propagation constant: %f \n', b)
%%
