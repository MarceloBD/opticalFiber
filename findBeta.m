% Find beta for the transcendental equation in a optical fiber
% @lambda wavelength in free space
% @n1 refractive index of core
% @n2 refractive index of cladding
% @a radius of core
function findBeta(lambda, n1, n2, a)
    syms b;

    u0 =  4*pi * 10^(-7);
    e0 = 8.8541878176 * 10^(-12);
    c = 1/sqrt(u0*e0);
    
    k0 = 2*pi/lambda; 
    u = sqrt(k0^2 * n1^2 - b^2);
    w = sqrt(b^2 - k0^2 * n2^2);
    nu = 1;
    
    jnu = besselj(nu,u*a);
    knu = besselk(nu,w*a);
    djnu = (besselj(nu-1,u*a) - besselj(nu+1,u*a))/2;
    dknu = (besselk(nu-1,w*a) + besselk(nu+1,w*a))/2;
        
    omega = 2*pi*c/lambda;
    epsilon1 = n1^2/u0;
    matrix = zeros(4,4,'sym');
    matrix(1,1) = vpa(jnu);
    matrix(1,2) = -knu;
    matrix(2,3) = jnu;
    matrix(2,4) = -knu;
    matrix(3,1) = b * nu/(u^2 * a) * jnu;
    matrix(3,2) = b * nu/(omega^2 * a) * knu;
    matrix(3,3) = j * omega * u0/u * jnu;
    matrix(3,4) = j * omega * u0/u * dknu;
    matrix(4,1) = j * omega * epsilon1/u * djnu;
    matrix(4,2) = j * omega * epsilon1/u * dknu;
    matrix(4,3) = b * nu/(u^2 * a) * jnu; 
    matrix(4,4) = b * nu/(w^2 * a) * knu;
    
    solve(det(matrix)==0, b)
    

end


