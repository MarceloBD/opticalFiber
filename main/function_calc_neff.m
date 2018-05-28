% Find the effective refractive index
% @nu periodic parameter of optical fiber
% @k0 propagation constant in free space
% @n1 refractive index of core
% @n2 refractive index of cladding
% @a radius of core
function neff = function_calc_neff (nu, k0, n1, n2, a)
    syms n
    k1 = k0 * n1;
    k2 = k0 * n2;

    u(n) = k0 * sqrt(n1^2 - n.^2);
    w(n) = k0 * sqrt(n.^2 - n2^2);

    C1(n) = ((k0 * n * nu/a) .* ((1./(u.^2)) + (1./(w.^2)))) .^2;
    C2(n) = 0.5 * (besselj(nu - 1, u * a) - besselj( nu + 1, u * a)) ./ (besselj(nu, u * a) * u);
    C3(n) = 0.5 * (-besselk(nu - 1, w * a) - besselk(nu + 1, w * a)) ./ (besselk(nu, w * a) * w);
    C(n) = C1 - (C2 + C3) * (k1^2 .* C2 + k2^2 .* C3);
    
    fC = matlabFunction(C);

    n_A = linspace(n2 + n2 * 1e-4, n1 - n1 * 1e-4, 5001);

    i = 0;
    j = 0;
    neff(1) = n2;
    while i < length(n_A) - 1
        i = i + 1;
        if((sign(fC(n_A(i))) ~= sign(fC(n_A(i + 1)))) && (abs(fC(n_A(i))) < 100))
            j = j + 1;
            neff(j) = n_A(i) -  fC(n_A(i)) * (n_A(i + 1) - n_A(i)) / (fC(n_A(i + 1)) - fC(n_A(i))); 
        end
    end
    neff = flip(neff);
end