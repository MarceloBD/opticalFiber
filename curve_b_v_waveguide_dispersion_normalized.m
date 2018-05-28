clear all;
close all;
clc;
%%
lambda = 1.55e-6;       % [m] operating wavelength
n2 = 1.475;             % cladding
n1 = 1.5;               % core
a = linspace(0.8e-6,3.8e-6,100);
nu = 2;

na = sqrt(n1^2-n2^2);
v = 2 * pi .* a * na/lambda;
%%
k0 = 2 * pi/lambda;
for i = 1:length(a)
    fprintf('Normalized frequency: %f \n', v(i))
    neff = function_calc_neff(nu, k0, n1, n2, a(i));
    neff1 = neff(1);
    b(i) = (neff1.^2 - n2^2)/(n1^2 - n2^2);
    fprintf('Normalized propagation constant: %f \n', b(i))
end
%%
P = polyfit(v, b, 8);
b_p = polyval(P, v);

figure
plot(v, b, 'k'); grid
hold on
plot(v, b_p, 'r-.')
xlabel('V')
ylabel('b')

%%
syms vv
bb(vv) = P(1)*vv^8+P(2)*vv^7+P(3)*vv^6+P(4)*vv^5+P(5)*vv^4+P(6)*vv^3+...
         P(7)*vv^2+P(8)*vv+P(9);

Dwn(vv) = vv.*diff(diff(vv.*bb,vv),vv);      
fDwn = matlabFunction(Dwn);     
     
figure
plot(v, fDwn(v), 'k'); grid
xlabel('V')
ylabel('D_{wn}')