function new_dir = scatterDirection(old_dir, g)
    % Henyey-Greenstein相位函数
    xi2 = rand();
    cosThetaRel = (1 + g^2 - ((1 - g^2) / (1 + g - 2*g*xi2))^2) / (2*g);
    cosThetaRel = min(max(cosThetaRel, -1), 1); 
    sinThetaRel = sqrt(1 - cosThetaRel^2);
    phiRel = 2 * pi * rand();

    
    
    [perp1, perp2] = findPerpendicularVectors(old_dir);

    % 计算散射后的方向
    scattered_dir = sinThetaRel * (cos(phiRel) * perp1 + sin(phiRel) * perp2) + cosThetaRel * old_dir;
    new_dir = scattered_dir / norm(scattered_dir); % Normalize to make sure it's a unit vector
end
