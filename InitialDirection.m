function new_dir = InitialDirection(old_dir)
    x=old_dir(:,1);
    y=old_dir(:,2);
    
    % 使用Henyey-Greenstein相位函数来确定散射后的方向
    xi2 = rand();
    cosThetaRel = xi2;
    cosThetaRel = min(max(cosThetaRel, -1), 1); 
    sinThetaRel = sqrt(1 - cosThetaRel^2);
    phiRel = 2 * pi * rand();

    % 构造一个坐标系，其中old_dir是z轴
    [perp1, perp2] = findPerpendicularVectors([x,y,0]);

    % 计算散射后的方向
    scattered_dir = sinThetaRel * (cos(phiRel) * perp1 + sin(phiRel) * perp2) + cosThetaRel * [x,y,0];
    new_dir = scattered_dir / norm(scattered_dir);
end
