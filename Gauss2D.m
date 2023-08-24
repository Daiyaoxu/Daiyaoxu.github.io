function Z=Gauss2D(X,Y,sigma,a,b)
%XY是网格坐标
%sigma是高斯分布的宽度
%ab是中心点坐标
    Z=0.5*exp(-((X-a).^2+(Y-b).^2)./sigma.^2);
end