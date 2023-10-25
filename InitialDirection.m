function new_dir = InitialDirection(old_dir)
    x=old_dir(:,1);
    y=old_dir(:,2);
    
    % Henyey-Greenstein相位函数
    xi2 = rand();
    cosThetaRel = xi2;
    cosThetaRel = min(max(cosThetaRel, -1), 1); 
    sinThetaRel = sqrt(1 - cosThetaRel^2);
    phiRel = 2 * pi * rand();


    [perp1, perp2] = findPerpendicularVectors([x,y,0]);

    % 散射后的方向
    scattered_dir = sinThetaRel * (cos(phiRel) * perp1 + sin(phiRel) * perp2) + cosThetaRel * [x,y,0];
    new_dir = scattered_dir / norm(scattered_dir);
end
