clear all;
close all;
clc;
%%
Lambda = linspace(1.2e-6,1.6e-6,200);
delta = 0.005;
a = 4e-6;

mat = 1;
% 1 - fused silica
% 2 - germania
% 3 - titania
% 4 - (C5H8O2)n 
% 5 -  LASF9

%%

% material dispersion
syms lambda 
[n,Dmat] = function_material_dispersion(mat);
fn = matlabFunction(n);
fDmat = matlabFunction(Dmat);

dmat = fDmat(Lambda*1e6);
n1 = fn(Lambda*1e6);
n2 = n1*(1 - delta); % cladding
na = sqrt(n1.^2 - n2.^2);
vv = 2 * pi * a .* na./Lambda;
fprintf('Normalized frequency (first value): %f \n', vv(end))
fprintf('Normalized frequency (end value): %f \n', vv(1))

% waveguide dispersion
load('data_v_b_Dwn.mat'); % variables: v, b, Dwn 
P = polyfit(v, Dwn0, 8);
Dwn_p = polyval(P, v);
dw = - (n2.*delta/Const.c0).*(1./Lambda).*polyval(P, vv)*1e6;

% total dispersion
dt = dmat + dw;

function_bragg_dispersion(dt, Lambda*1e6, 1);
