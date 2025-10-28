% Draw Bland-Altman plot
clear all;
clc;
close all;

ytrue = [0,0.01,0.025,0.02,0.074,0.08,0.085,0.111,0.126,0.152,0.224,0.316,0.424]';
% AVD
% ypred = [0,0.012,0.015,0.016,0.018,0.019,0.021,0.022,0.023,0.035,0.052,0.075,0.088]';
%flatness
ypred = [0,2.51E-4,0.00144,0.00981,0.01392,0.01621,0.02667,0.04126,0.05434,0.07577,0.10694,0.12567,0.14774]';

x = (ytrue + ypred)/2;
ydiff = ypred - ytrue;  % Changed to ypred - ytrue for consistency
ydiffmean = mean(ydiff);
ydiffstd = std(ydiff);
up95 = ydiffmean + 1.96*ydiffstd;
down95 = ydiffmean - 1.96*ydiffstd;

figure
scatter(x, ydiff, 'filled', 'r')
% 设置坐标轴刻度字体和字号
set(gca, 'FontName', 'Times', 'FontSize', 12)

hold on 
yline(up95, '-r', 'Upper 95% LoA', 'LineWidth', 2,'Fontname', 'Times', 'FontSize', 18)
hold on 
yline(down95, '-r', 'Lower 95% LoA', 'LineWidth', 2,'Fontname', 'Times', 'FontSize', 18)
hold on 
yline(ydiffmean, '--b', 'Mean difference', 'LineWidth', 2,'Fontname', 'Times', 'FontSize', 18)

% Add axis labels in English
xlabel('Average of Methods', 'FontSize', 18, 'Fontname', 'Times')
ylabel('Difference', 'FontSize', 18,'Fontname', 'Times')



% Optional: Set consistent y-axis limits for better visualization
ylim([down95-0.05, up95+0.05])

print OPCC-0-flatness.tif -dtiff2 -r300 %print用于输出图片，文件名.tif -dtiff2 -r300,最后一个为输出的DPI