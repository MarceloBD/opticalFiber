% Find the power in the core
% @nu periodic parameter of optical fiber
% @neff effective refractive index
% @k0 propagation constant in free space
% @n1 refractive index of core
% @n2 refractive index of cladding
% @a radius of core
function pcore = function_calc_pcore (nu, neff, k0, n1, n2, a)
    u = k0 * sqrt(n1^2 - neff.^2);
    na = sqrt(n1^2 - n2^2);
    v = k0 * a * na;
    pcore = (1 - ((u)/(v)) .^2) .* (1 - (besselj(nu, u * a) .^2) ./ ...
        (besselj(nu + 1, u * a) .* besselj(nu - 1, u * a)));
end