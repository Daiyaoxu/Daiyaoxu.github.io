% Functions
function dir = randomDirection()
    phi = 2*pi*rand();
    cosTheta = 2*rand() - 1; % -1 to 1
    sinTheta = sqrt(1 - cosTheta^2);
    dir = [sinTheta*cos(phi), sinTheta*sin(phi), cosTheta];
end