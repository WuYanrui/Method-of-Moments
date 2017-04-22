n = input('Input the number of delta C');
e = 2.7183;          %自然对数
gamma = 1.78107;     %欧拉常数
rho = 1;             %柱体半径
eta = 120*pi         %真空中的波阻抗
lambda = 1           %波长
k = 2*pi / lambda    %波数
%散射截面sigma定义为宽度（三维中为面积）与散射电场强度与入射电场强度比值平方的乘积
%每个lmn表示由在（xn，yn）点的站看函数fn，在（xm，ym）点产生的场E
%lmn可以利用（3-24）计算
%当m点远离n点时，可以用（3-12）代替（3-24）而不太影响精确度
%同时还有伽略金方法
%尝试只使用中点来解决分域基问题

%待解决的问题：基函数的写法、边界的分块

%定义点选配坐标点,y轴为长轴，2*lambda，x轴为短轴，lambda/2
a = 2*lambda;
b = lambda/2;
pos = zeros(n+1,2);
pos(:,1) = b*cos(0:2*pi/n:2*pi);
pos(:,2) = a*sin(0:2*pi/n:2*pi);

for index_i = 1:n
    for index_j = 1:n
        if index_i == index_j
            lmn(index_i,index_j) = eta/4*k*(1 - j*2/pi*log(gamma*k*delta_C(index_i)/(4*e)))