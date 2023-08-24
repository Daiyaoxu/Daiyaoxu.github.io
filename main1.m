clc
clear all
%% 初始化参数
diameter = 1.8;          % 光纤直径
cylinder_length = 7;     % 光纤长度
mu_a = 0.19;                % 吸收系数，单位1/mm
mu_s = 43.2 ;               % 约化散射系数，单位1/mm
g = 0.99;                   % 各向异性参数

mu_s_prime = mu_s * (1 - g);
mfp = 1 / (mu_a + mu_s_prime); % mean free path
delta_s = min(0.25, mfp / 1); % step size
Nphoton = 1e5;

%% 初始化组织网格
x = -diameter*5:0.25:diameter*5;
y = -diameter*5:0.25:diameter*5;
z = 0:0.25:cylinder_length*5;



%% Monte_Carlo光子分布计算

absorbed_photons=Monte_Carlo(Nphoton, diameter, cylinder_length, mu_a, mu_s, mu_s_prime, delta_s, mfp, g);



%% 温度测算
%%






%% 绘图
X = absorbed_photons(:,1);
Y = absorbed_photons(:,2);
Z = absorbed_photons(:,3);

scatter3(X,Y,Z,5,'filled')
grid on;

xlabel('位置 x/mm ')
ylabel('位置 y/mm')
zlabel('位置 z/mm')
title('蒙特卡洛计算光子在在材料中分布')

