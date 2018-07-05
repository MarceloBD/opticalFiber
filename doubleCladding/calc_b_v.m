close all;
clear all;
clc;
%%
m = 0;
r = -0.01;
s = 1.5;
Quant_v = 200;
%%
if(r>=0)
    bc = r/(1+r);
    fprintf('bc: %f \n',bc)
    v = linspace(0,3,Quant_v);
    b1 = zeros(size(v));
    b2 = zeros(size(v));
  for i=1:length(v)
     b_aux1 = function_calc_b_c1(v(i), m, r, s);
     b1(i) = b_aux1(1);
     b_aux2 = function_calc_b_c2(v(i), m, r, s);
     b2(i) = b_aux2(1);
     fprintf('-> v: %f \n',v(i))
     fprintf('b1: %f \n',b1(i))
     fprintf('b2: %f \n',b2(i))
  end
  for i=1:length(v)
   if(b2(i)~=0)
       vt = v(i);
       break;
   else
       vt = v(end);
   end
  end
fprintf('v_transicao: %f \n',vt)
b = b1.*(v<vt)+b2.*(v>=vt);
else
   vc = function_calc_vc_r_neg (m, r, s);
   fprintf('V_c: %f \n',vc)
   v = linspace(vc,3,Quant_v);
   b = zeros(size(v));
   for i=1:length(v)
        b_aux = function_calc_b_c2(v(i), m, r, s);
        b(i) = b_aux(1);
        fprintf('-> v: %f \n',v(i))
        fprintf('b: %f \n',b(i))
   end 
end

%%
figure
plot(v,b,'k');grid
xlabel('v')
ylabel('b')
title(['S: ', num2str(s),'    R: ', num2str(r)])
%%
P = polyfit(v, b, 9);
Pb = polyval(P, v);
syms V
B(V) = (P(1)*V.^9)+(P(2)*V.^8)+(P(3)*V.^7)+(P(4)*V.^6)+(P(5)*V.^5)+...
       (P(6)*V.^4)+(P(7)*V.^3)+(P(8)*V.^2)+(P(9)*V.^1)+(P(10)*V.^0);
fB = matlabFunction(B);   

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

