% Draw Bland-Altman plot
clear all;
clc;
close all;

ytrue = [0,0.058,0.052,0.112,0.156,0.179,0.209,0.247,0.277,0.318,0.395,0.413,0.493]';
%AVD
% ypred = [0,0.029,0.04,0.065,0.067,0.068,0.072,0.075,0.081,0.112,0.143,0.146,0.17]';
%flatness
ypred = [0,0.02,0.024,0.035,0.045,0.059,0.06,0.065,0.14,0.184,0.221,0.342,0.47]';

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

print LHCC-1-flatness.tif -dtiff2 -r300 %print用于输出图片，文件名.tif -dtiff2 -r300,最后一个为输出的DPI

