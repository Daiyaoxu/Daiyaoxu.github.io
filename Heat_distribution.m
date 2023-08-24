function Sum_Q_slide=Heat_distribution(r_length,theta_length,z_length,voxel_dim_r,voxel_dim_theta,voxel_dim_z,X,Y,Z,diameter,absorbed_photons_r)
Q_space=zeros(r_length,theta_length,z_length);

for i5=1:length(X)

    % 定义立方体区域
    half_voxel_r=voxel_dim_r/2;
    half_voxel_theta=voxel_dim_theta/2;
    half_voxel_z=voxel_dim_z/2;


    % 找出落在这个区域内的粒子
    r10=(diameter/2+0.1);
    r_test=sqrt(X(i5)^2 + Y(i5)^2);
    if (r_test < r10)


    else

        r_partical=absorbed_photons_r(i5, 1) ;

        r_partical_test=0;
        n1=1;

        while (r_partical_test<(abs((r_partical-half_voxel_r)/voxel_dim_r)))
            r_partical_test=r_partical_test+voxel_dim_r*n1;
            n1=n1+1;
        end


        theta_partical=absorbed_photons_r(i5, 2) ;
        theta_partical_test=0;
        n2=1;

        while ( theta_partical_test<( abs((theta_partical-half_voxel_theta)/voxel_dim_theta)))
            theta_partical_test= theta_partical_test+voxel_dim_theta*n2;
            n2=n2+1;
        end

        z_partical=absorbed_photons_r(i5, 3);
        z_partical_test=0;
        n3=1;

        while (z_partical_test<(abs((z_partical-half_voxel_z)/voxel_dim_z)))
            z_partical_test=z_partical_test+voxel_dim_z*n3;
            n3=n3+1;
        end

        Q_space(n1,n2,n3)=Q_space(n1,n2,n3)+1;
    end

end


Sum_Q_slide=zeros(r_length,z_length);

for i6=1:theta_length
    Q_slide=squeeze(Q_space(:,i6,:));
    Sum_Q_slide=Sum_Q_slide+Q_slide;
end
end
