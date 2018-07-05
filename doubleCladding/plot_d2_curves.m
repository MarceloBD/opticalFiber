close all;
clear all;
clc;
%%
figure
load('data_bv_s_2_0_r_neg_0_5.mat');
P = polyfit(v, b, 6);
syms V
B(V) = (P(1)*V.^6)+(P(2)*V.^5)+(P(3)*V.^4)+(P(4)*V.^3)+(P(5)*V.^2)+...
       (P(6)*V.^1)+(P(7)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n);
plot(v,fD2(v),'k','LineWidth',1.5);grid
hold on
load('data_bv_s_2_0_r_neg_0_25.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'r','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_neg_0_1.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'c','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_0_25.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'b','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_0_5.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'g','LineWidth',1.5)
xlim([0 2.2])
xlabel('V')
ylabel('V ( d^2(VB) / dV^2 )')
title(['S = b / a : ', num2str(2)])
legend('R = -0.50','R = -0.25','R = -0.1','R = 0.25','R = 0.5')
%%
figure
load('data_bv_s_1_5_r_neg_0_75.mat');
P = polyfit(v, b, 6);
syms V
B(V) = (P(1)*V.^6)+(P(2)*V.^5)+(P(3)*V.^4)+(P(4)*V.^3)+(P(5)*V.^2)+...
       (P(6)*V.^1)+(P(7)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n);
plot(v,fD2(v),'k','LineWidth',1.5);grid
hold on
load('data_bv_s_1_5_r_neg_0_5.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n);
D2v = 0.*(v<v(35))+(fD2(v)).*(v>v(35)); 
plot(v,D2v,'r','LineWidth',1.5)
hold on
load('data_bv_s_1_5_r_neg_0_25.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'c','LineWidth',1.5)
hold on
load('data_bv_s_1_5_r_neg_0_1.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'b','LineWidth',1.5)
hold on
load('data_bv_s_1_5_r_neg_0_01.mat');
P = polyfit(v, b, 8);
syms V
B(V) = (P(1)*V.^8)+(P(2)*V.^7)+(P(3)*V.^6)+(P(4)*V.^5)+(P(5)*V.^4)+...
       (P(6)*V.^3)+(P(7)*V.^2)+(P(8)*V.^1)+(P(9)*V.^0);   
fB = matlabFunction(B);
D2n(V) = V.*diff(V.*B,V,2);  
fD2 = matlabFunction(D2n); 
plot(v,fD2(v),'g','LineWidth',1.5)
xlim([0 2.2])
xlabel('V')
ylabel('V ( d^2(VB) / dV^2 )')
title(['S = b / a : ', num2str(1.5)])
legend('R = -0.75','R = -0.50','R = -0.25','R = -0.10','R = -0.01')
%%