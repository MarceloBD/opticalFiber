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
    nu = 0;
    
    
    matrix = zeros(4,4);
    
    matrix(1,3) = 0;
    

end


