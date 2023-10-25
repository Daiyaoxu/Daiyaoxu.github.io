function [perp1, perp2] = findPerpendicularVectors(vec)
    % 为给定的向量找到两个正交的单位向量
    if vec(1) == 0 && vec(2) == 0
        if vec(3) == 0
           
            
            perp1 = [1,0,0];
            perp2 = [0,1,0];
            return;
        end
        perp1 = [1,0,0];
        perp2 = [0,1,0];
    else
        perp1 = cross(vec, [0,0,1]);
        perp2 = cross(vec, perp1);
    end
    perp1 = perp1 / norm(perp1);
    perp2 = perp2 / norm(perp2);
end
