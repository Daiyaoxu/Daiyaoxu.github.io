function [Q_slide_t] = heat_with_t(Q_slide,t_length,r_length,z_length,t_shut_down)

Q_slide_t=zeros(t_length,r_length*2,z_length);

for i = 1:t_length-t_shut_down
    Q_slide_t(i,:,:) = Q_slide;
end

end