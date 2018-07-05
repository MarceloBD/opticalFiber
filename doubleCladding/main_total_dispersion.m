close all;
clear all;
clc;
%%
load('data_bv_s_2_0_r_neg_0_5.mat');

P = polyfit(v, b, 6);
Pb = polyval(P, v);
%%
syms V
%B(V) = (P(1)*V.^10)+(P(2)*V.^9)+(P(3)*V.^8)+(P(4)*V.^7)+(P(5)*V.^6)+...
%       (P(6)*V.^5)+(P(7)*V.^4)+(P(8)*V.^3)+(P(9)*V.^2)+(P(10)*V.^1)+(P(11)*V.^0);

B(V) = (P(1)*V.^6)+(P(2)*V.^5)+(P(3)*V.^4)+(P(4)*V.^3)+(P(5)*V.^2)+...
       (P(6)*V.^1)+(P(7)*V.^0);   
fB = matlabFunction(B);   
   
figure
plot(v,b,'k');grid
hold on
plot(v,fB(v),'r-.')
xlabel('v')
ylabel('b')
title(['S: ', num2str(s),'    R: ', num2str(r)])
      
%%   
D1n(V) = diff(V.*B,V);
D2n(V) = V.*diff(V.*B,V,2);
fD1 = matlabFunction(D1n);   
fD2 = matlabFunction(D2n);   

figure
plot(v,fD1(v),'k');grid
xlabel('v')
ylabel('D1')
title(['S: ', num2str(s),'    R: ', num2str(r)])

figure
plot(v,fD2(v),'k');grid
xlabel('v')
ylabel('D2')
title(['S: ', num2str(s),'    R: ', num2str(r)])

%%
mat = 1;
% 1 - fused silica
% 2 - germania
% 3 - titania
% 4 - (C5H8O2)n 
% 5 -  LASF9
% 6 - FK51A
% 7 - BK7
syms lambda
Lambda = linspace(1.2,1.8,400); % [um]
[n,M] = function_material_dispersion(mat);
fn = matlabFunction(n,'vars', lambda);
fM = matlabFunction(M,'vars', lambda);
N = n - lambda.*diff(n,lambda);
fN = matlabFunction(N,'vars', lambda);

figure
plot(Lambda,fn(Lambda),'k');grid
xlabel('\lambda (\mum)')
ylabel('n')
xlim([Lambda(1) Lambda(end)])

figure
plot(Lambda,fN(Lambda),'k');grid
xlabel('\lambda (\mum)')
ylabel('N')
xlim([Lambda(1) Lambda(end)])

figure
plot(Lambda,fM(Lambda),'k');grid
xlabel('\lambda (\mum)')
ylabel('M')
xlim([Lambda(1) Lambda(end)])

%%
deltan = 12.6e-3;
deltan1 = deltan*r;

delta(lambda) = (deltan+deltan1)/n;
p(lambda) = (lambda./delta).*diff(delta,lambda); 
fdelta = matlabFunction(delta,'vars', lambda);
fp = matlabFunction(p,'vars', lambda);

%%
%a = 0.5*6.275; % [um]

%a = 0.5*6.475; % [um]

%a = 4/s;
a = 0.5*6.5;

VV(lambda) = (2*pi/lambda)*a*sqrt(2*fn(lambda)*(deltan+deltan1));
fVV = matlabFunction(VV,'vars', lambda);
vv = fVV(Lambda);

lambda1 = 1.55;
v1 = fVV(lambda1);
b1 = fB(fVV(lambda1));
fprintf('v(1): %f \n',vv(1))
fprintf('v(end): %f \n',vv(end))
fprintf('v(1.55 um): %f \n',v1)
fprintf('b(1.55 um): %f \n',b1)
fprintf('P_core/P (1.55 um): %f \n',function_calc_pcore(1,v1,b1))

%%

D1(lambda) = D1n((2*pi/lambda)*a*sqrt(2*n*(deltan+deltan1)));
D2(lambda) = D2n((2*pi/lambda)*a*sqrt(2*n*(deltan+deltan1)));

Dmat(lambda) = M*(1+delta*D1); 
Dwg(lambda) = -(1e12/(lambda*Const.c0))*N*delta*(D2-p*D1);
Dt(lambda) = Dmat+Dwg;
S(lambda) = diff(Dt,lambda)*1e-3;
fDmat = matlabFunction(Dmat,'vars', lambda);
fDwg = matlabFunction(Dwg,'vars', lambda);
fDt = matlabFunction(Dt,'vars', lambda);
fS = matlabFunction(S,'vars', lambda);

fprintf('D(1.55 um): %f [ps/nm/km]\n',fDt(1.55))
fprintf('S(1.55 um): %f [ps/nm^2/km]\n',fS(1.55))

%%
figure
plot(Lambda,fDmat(Lambda),'r','LineWidth',1.5);grid
hold on
plot(Lambda,fDwg(Lambda),'g','LineWidth',1.5)
hold on
plot(Lambda,fDt(Lambda),'k','LineWidth',1.5)
xlabel('\lambda (\mum)')
ylabel('d\tau / d\lambda [ ps / (nm km) ]')   
legend('Material','Waveguide','Total','Location','Northwest')
title(['b / a : ', num2str(s),'    a: ', num2str(a),'\mum   \Deltan: ',num2str(deltan*1e3),' x10^{-3}  \Deltan1: ',num2str(deltan1*1e3),' x10^{-3}'])
xlim([Lambda(1) Lambda(end)])

figure
plot(Lambda,fS(Lambda),'k','LineWidth',1.5);grid
xlabel('\lambda (\mum)')
ylabel('S [ ps / (nm^2 km) ]')
title(['b / a : ', num2str(s),'    a: ', num2str(a),'\mum   \Deltan: ',num2str(deltan*1e3),' x10^{-3}  \Deltan1: ',num2str(deltan1*1e3),' x10^{-3}'])
xlim([Lambda(1) Lambda(end)])

 %%  
