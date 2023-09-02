function [absorbed_photons_r] = coordinate_conversion(absorbed_photons)
A=absorbed_photons(:,1);
n=length(A);
absorbed_photons_r = zeros(n, 3);
for i = 1:n
    x = absorbed_photons(i, 1);
    y = absorbed_photons(i, 2);
    z = absorbed_photons(i, 3);

    R = sqrt(x^2 + y^2);
    theta = atan2(y, x);
    theta_pi=theta+pi;
    Z = z;

    absorbed_photons_r(i, :) = [R, theta_pi, Z];
end
end