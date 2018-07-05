function pot_core = function_calc_pcore (nu,v,b)
ua = v*sqrt(1-b);
pot_core = (1-((ua)/(v)).^2).*(1-(besselj(nu,ua).^2)./(besselj(nu+1,ua).*besselj(nu-1,ua)));
pot_core = abs(pot_core);
end