function [T_slide_t] = FDM_2D(Q_slide_t,Vb,diameter,cylinder_length,voxel_dim_r,voxel_dim_z,voxel_t,r_length,z_length,t_length,lamda,density,c)
% 2D中温度场空间与时间分布矩阵
T_slide_t= zeros(t_length,r_length*2,z_length);
%T_slide_t_test= zeros(t_length,r_length*2,z_length);
% 体温
T_slide_t(:,:,:) = 36;
%T_slide_t_test(:,:,:)= 36;

r_left=r_length-(diameter/2)/voxel_dim_r;
r_right=r_length+(diameter/2)/voxel_dim_r;
z_min=cylinder_length/voxel_dim_z*0;
z_max=cylinder_length/voxel_dim_z*3;

for ii=2:t_length-1
    for jj=2:r_length*2-1
        for kk=2:z_length-1

% 定义热量带走的速率
                        
  if (jj>r_left)&& (jj<r_right)&& (kk>z_min)&& (kk<z_max)
        Q_water=-(T_slide_t(ii,jj,kk)-18);
  else
      Q_water=0;
  end        
            
            % 书本的方法
%                         lamda0=4.19*(0.133+1.36*W)*1e-3;
%                         lamda=4.19*(0.133+1.36*W*(1+1.78*1e-3*(T_slide_t(ii-1,jj,kk)-20)))*1e-3;
%                         lamda_positive_deltaz=4.19*(0.133+1.36*W*(1+1.78*1e-3*(T_slide_t(ii-1,jj,kk+1)-20)))*1e-3;
%                         lamda_negative_deltaz=4.19*(0.133+1.36*W*(1+1.78*1e-3*(T_slide_t(ii-1,jj,kk-1)-20)))*1e-3;
%                         lamda_positive_deltar=4.19*(0.133+1.36*W*(1+1.78*1e-3*(T_slide_t(ii-1,jj+1,kk)-20)))*1e-3;
%                         lamda_negative_deltar=4.19*(0.133+1.36*W*(1+1.78*1e-3*(T_slide_t(ii-1,jj-1,kk)-20)))*1e-3;
%             
%                         lamda_positive_half_deltaz=(lamda_positive_deltaz+lamda)/2;
%                         lamda_negative_half_deltaz=(lamda_negative_deltaz+lamda)/2;
%                         lamda_positive_half_deltar=(lamda_positive_deltar+lamda)/2;
%                         lamda_negative_half_deltar=(lamda_negative_deltar+lamda)/2;
%             
%                         lamda_r_1=(lamda_positive_half_deltar-lamda_negative_half_deltar)/voxel_dim_r; %lamda 关于r的一阶导数
%                         lamda_z_1=(lamda_positive_half_deltaz-lamda_negative_half_deltaz)/voxel_dim_z; %lamda 关于z的一阶导数
%             
%             
%                         T_r_1=(T_slide_t(ii,jj+1,kk)-T_slide_t(ii,jj-1,kk))/(voxel_dim_r*2);  % T关于r的一阶导数
%                         T_z_1=(T_slide_t(ii,jj,kk+1)-T_slide_t(ii,jj,kk-1))/(voxel_dim_z*2); % T关于z的一阶导数
%                         T_r_2=(T_slide_t(ii,jj+1,kk)+T_slide_t(ii,jj-1,kk)-2*T_slide_t(ii,jj,kk))/voxel_dim_r^2;  % T关于r的二阶导数
%                         T_z_2=(T_slide_t(ii,jj,kk+1)+T_slide_t(ii,jj,kk-1)-2*T_slide_t(ii,jj,kk))/voxel_dim_z^2; % T关于z的二阶导数
%             
% 
%                             T_slide_t(ii+1,jj,kk) = (1/(density*c))*(lamda_r_1*T_r_1+lamda_z_1*T_z_1+lamda*((1/(abs(jj-r_length-0.5)*voxel_dim_r))*T_r_1+T_r_2+T_z_2))*voxel_t+T_slide_t(ii,jj,kk)+(1/(density*c))*Q_slide_t(ii,jj,kk)*voxel_t;

% 简易模型        
        
            T_slide_t(ii+1,jj,kk) = (lamda/(density*c))*voxel_t*(T_slide_t(ii,jj+1,kk)+T_slide_t(ii,jj-1,kk)-2*T_slide_t(ii,jj,kk))/voxel_dim_r^2 + ...
                (lamda/(density*c))*voxel_t*(T_slide_t(ii,jj,kk+1)+T_slide_t(ii,jj,kk-1)-2*T_slide_t(ii,jj,kk))/voxel_dim_z^2 + ...
                T_slide_t(ii,jj,kk)+...
                (1/(density*c))*Q_slide_t(ii,jj,kk)*1*voxel_t+Q_water*density*Vb;%这里×10了
       

        end
    end
    % disp([num2str(ii/(t_length-2)*100), '%']);
end

end
