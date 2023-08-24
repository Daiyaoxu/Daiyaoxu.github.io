function isIn = isInCylinder(photon_pos, diameter, cylinder_length)
    r = sqrt(photon_pos(1,1)^2 + photon_pos(1,2)^2);
    z = photon_pos(3);
    isIn = (r >= diameter/2) & (r <= photon_pos*5) & (z >= 0) & (z <= cylinder_length*5);
end