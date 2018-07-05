close all;
clear all;
clc;
%%
load('data_bv_s_2_0_r_neg_0_5.mat');
figure
plot(v,b,'k','LineWidth',1.5);grid
hold on
load('data_bv_s_2_0_r_neg_0_25.mat');
plot(v,b,'r','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_neg_0_1.mat');
plot(v,b,'c','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_0_25.mat');
plot(v,b,'b','LineWidth',1.5)
hold on
load('data_bv_s_2_0_r_0_5.mat');
plot(v,b,'g','LineWidth',1.5)
xlabel('V')
ylabel('B')
title(['S = b / a : ', num2str(2)])
legend('R = -0.50','R = -0.25','R = -0.10','R = 0.25','R = 0.50')
%%


