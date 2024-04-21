% Spring 2024 AER E 344 Lab 12 Analysis Script
% Section 3 Group 3
clear; clc; close all;

%% Constants
data_file = "./AERE344Lab12Data.xlsx";
figure_dir = "../Figures/";

%% Import Data
data = readtable(data_file);
alpha = data.AoA; % [°]
c_l = data.cl; % []
c_d = data.cd; % []
c_m = data.cm; % []
c_l_iced = data.cl_1; % []
c_d_iced = data.cd_1; % []
c_m_iced = data.cm_1; % []

%% Calculations
c_lbyc_d = c_l ./ c_d; % []
c_lbyc_d_iced = c_l_iced ./ c_d_iced; % []

%% Plot
figure;
plot(alpha,c_l,"LineWidth",2);
hold on;
plot(alpha,c_l_iced,"LineWidth",2);
hold off;
fontname("Times New Roman");
fontsize(12,"points");
title_str = "Coefficient of Lift vs. Angle of Attack";
title(title_str);
xlabel("Angle of Attack (\alpha) [°]");
ylabel("Coefficient of Lift (c_l) [ ]");
legend("Clean","Iced","Location","southeast");
grid on;
saveas(gcf,figure_dir + title_str + ".svg");

figure;
plot(alpha,c_d,"LineWidth",2);
hold on;
plot(alpha,c_d_iced,"LineWidth",2);
hold off;
fontname("Times New Roman");
fontsize(12,"points");
title_str = "Coefficient of Drag vs. Angle of Attack";
title(title_str);
xlabel("Angle of Attack (\alpha) [°]");
ylabel("Coefficient of Drag (c_d) [ ]");
legend("Clean","Iced","Location","southeast");
grid on;
saveas(gcf,figure_dir + title_str + ".svg");

figure;
plot(alpha,c_m,"LineWidth",2);
hold on;
plot(alpha,c_m_iced,"LineWidth",2);
hold off;
fontname("Times New Roman");
fontsize(12,"points");
title_str = "Coefficient of Moment vs. Angle of Attack";
title(title_str);
xlabel("Angle of Attack (\alpha) [°]");
ylabel("Coefficient of Moment (c_m) [ ]");
legend("Clean","Iced","Location","southeast");
grid on;
saveas(gcf,figure_dir + title_str + ".svg");

figure;
plot(alpha,c_lbyc_d,"LineWidth",2);
hold on;
plot(alpha,c_lbyc_d_iced,"LineWidth",2);
hold off;
fontname("Times New Roman");
fontsize(12,"points");
title_str = "Lift to Drag Ratio vs. Angle of Attack";
title(title_str);
xlabel("Angle of Attack (\alpha) [°]");
ylabel("Lift to Drag Ratio (c_l / c_d) [ ]");
legend("Clean","Iced","Location","southeast");
grid on;
saveas(gcf,figure_dir + title_str + ".svg");

%% Output Tables
clean_table = table;
clean_table.alpha = alpha;
clean_table.c_l = c_l;
clean_table.c_d = c_d;
clean_table.c_m = c_m;
clean_table.c_lbyc_d = c_lbyc_d;
path = convertStringsToChars(figure_dir + "Clean Data.tex");
table2latex(clean_table,path, { ...
    '$\alpha$ [\unit{\degree}]', ...
    '$c_l$', ...
    '$c_d$', ...
    '$c_m$', ...
    '$\frac{c_l}{c_d}$' ...
    },[2,3,3,3,3],[]);

iced_table = table;
iced_table.alpha = alpha;
iced_table.c_l = c_l_iced;
iced_table.c_d = c_d_iced;
iced_table.c_m = c_m_iced;
iced_table.c_lbyc_d = c_lbyc_d_iced;
path = convertStringsToChars(figure_dir + "Iced Data.tex");
table2latex(iced_table,path, { ...
    '$\alpha$ [\unit{\degree}]', ...
    '$c_l$', ...
    '$c_d$', ...
    '$c_m$', ...
    '$\frac{c_l}{c_d}$' ...
    },[2,3,3,3,3],[]);