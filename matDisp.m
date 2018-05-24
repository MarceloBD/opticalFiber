% Finds the material dispersion of a optical fiber 
% @lambda wavelengths for the refractive index
% @n refractive index for the lambda
% @lambda0 wavelength of the wave being analized 
function matDisp(lambda, n, lambda0)
    c = 299*10^6;
    step = 1/10;
    
    lambdaq = lambda(1):...
            (lambda(numel(n)-lambda(1)))/numel(n)*step:...
            lambda(numel(n));
    nq = interp1(lambda, n, lambdaq,'spline');
    dif2 = diff(nq,2)./(lambdaq(2)-lambdaq(1)).^2;
    dif2 = interp1(dif2, lambdaq(1:numel(lambdaq)-2) ,  'spline', 'extrap');
    d = -lambda0/c * dif2((lambda0-lambda(1))*1/step + 1)
end 