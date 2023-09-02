function [Sum_Q_slide_sym,total_sum_Q,Sum_Q_slide]=Heat_distribution(Nphoton,absorbed_photons_r,voxel_dim_r,voxel_dim_z, r_length,theta_length,z_length,Q_space)


% 初始化计数矩阵
for i5=1:Nphoton

    % 找出落在这个区域内的粒子


    r_partical=absorbed_photons_r(i5, 1)/voxel_dim_r;     % r 的索引
    n1=1;

    theta_partical=absorbed_photons_r(i5, 2)*(100/(2*pi)); % theta 的索引
    n2=1;

    z_partical=absorbed_photons_r(i5, 3)/ voxel_dim_z;     % z 的索引
    n3=1;

    if (r_partical > r_length) || (theta_partical > theta_length) || (z_partical > z_length)|| (r_partical <0)|| (theta_partical <0)|| (z_partical < 0)

        continue

    end

    while n1<r_partical
        n1=n1+1;
    end

    while  n2<theta_partical
        n2=n2+1;
    end

    while n3<z_partical
        n3=n3+1;
    end

    Q_space(n1,n2,n3)=Q_space(n1,n2,n3)+1;


end




Sum_Q_slide=zeros(r_length,z_length);

for i6=1:theta_length
    Q_slide=squeeze(Q_space(:,i6,:));
    Sum_Q_slide=Sum_Q_slide+Q_slide;
    Sum_Q_slide(1,1)=0;
end

% 对称绘图
Sum_Q_slide_sym=sym_packing(Sum_Q_slide);
total_sum_Q = sum(Sum_Q_slide_sym);
total_sum_Q = sum(total_sum_Q);
end
