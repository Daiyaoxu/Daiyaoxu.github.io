function absorbed_photons=Monte_Carlo(Nphoton,diameter,cylinder_length,mu_a,mu_s,mu_s_prime,delta_s,mfp,g)

absorbed_photons = zeros(Nphoton,3);
        for i3 = 1:Nphoton
            ri1 = rand()*360;
            zi1 = rand()*cylinder_length;
         
            photon_pos = [sin(ri1)*(diameter/2), cos(ri1)*(diameter/2), zi1+cylinder_length*2]; % 光子初始位置
            photon_dir = InitialDirection(photon_pos); % 光子初始方向

            
            %while isInCylinder(photon_pos, diameter, cylinder_length)
            for i4=1:100
                xi1 = rand();
                Pscattering = 1 - exp(-mu_s_prime * delta_s);
                Pabsorption = 1 - exp(-mu_a * delta_s);
%                 photon_pos(1,1)
%                 photon_pos(1,2)
                r = sqrt(photon_pos(1,1)^2 + photon_pos(1,2)^2);
                z = photon_pos(3);

                if  xi1 < Pabsorption
                    % 吸收事件
                    absorbed_photons(i3, 1) = photon_pos(1);
                    absorbed_photons(i3, 2) = photon_pos(2);
                    absorbed_photons(i3, 3) = photon_pos(3);
                    break; % 结束该光子的循环

                elseif (Pabsorption<=xi1)&&(xi1 <= (Pscattering + Pabsorption))
                    % 散射事件
                    photon_dir = scatterDirection(photon_dir, g);

                end
                
                % 移动光子
                photon_pos_next = photon_pos + photon_dir * photon_path_length(delta_s);
                
                r = sqrt(photon_pos_next(1,1)^2 + photon_pos_next(1,2)^2);
                z = photon_pos_next(3);
                if (r < diameter/2)
                    absorbed_photons(i3, 1) = photon_pos(1);
                    absorbed_photons(i3, 2) = photon_pos(2);
                    absorbed_photons(i3, 3) = photon_pos(3);
                    break; % 结束该光子的循环
                else
                     photon_pos = photon_pos_next;
                end

            end
              % disp([num2str(i3/Nphoton*100), '%']);
        end
        










end