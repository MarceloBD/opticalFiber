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
    v = sqrt(b^2 - k0^2 * n2^2);
    nu = 0;
    
    
    
    matrix = zeros(4,4);
    
    matrix(1,3) = 0;
    

end

% Functions for finding j and k from bessel function
% @nu constant of periodicity of wave 
% @u inside core
% @w outside core
% @a radius of core
function jnu = jnu(nu, u, a)

end

function knu = knu(nu, w, a)

end

function djnu = djnu(nu, u, a)

end

function dknu = dknu(nu, w, a)

end


