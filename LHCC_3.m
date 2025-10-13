% Draw Bland-Altman plot
clear all;
clc;
close all;

ytrue = [0,0.09636,0.09746,0.15601,0.23661,0.25421,0.28213,0.29556,0.352,0.38029,0.47694]';
%AVD
% ypred = [0,0.023,0.029,0.071,0.089,0.103,0.11,0.145,0.202,0.245,0.307]';
%flatness
ypred = [0,0.02093,0.03683,0.05123,0.05253,0.05523,0.08341,0.14062,0.19107,0.28997,0.45607]';

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

print LHCC-3-flatness.tif -dtiff2 -r300 %print用于输出图片，文件名.tif -dtiff2 -r300,最后一个为输出的DPI

