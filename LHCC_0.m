% Draw Bland-Altman plot
clear all;
clc;
close all;

ytrue = [0,0.03,0.062,0.086,0.1011,0.116,0.149,0.179,0.196,0.258,0.298,0.352,0.468]';
%AVD
% ypred = [0,0.007,0.008,0.018,0.024,0.03,0.036,0.043,0.047,0.047,0.065,0.089,0.11]';
%flatness
ypred = [0,0.00114,0.01648,0.03379,0.04344,0.04426,0.04806,0.05546,0.10121,0.13088,0.14431,0.15595,0.18309]';

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

print LHCC-0-flatness.tif -dtiff2 -r300 %print用于输出图片，文件名.tif -dtiff2 -r300,最后一个为输出的DPI

