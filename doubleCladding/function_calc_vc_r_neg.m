function vc = function_calc_vc_r_neg (m, r, s)
syms v
v2(v) = v*s*sqrt(abs(r)/(1+r)); 
c = 1/s;

C1(v) = besselj(m,v)./(v.*besselj(m+1,v)); % J^m(v)  
C2(v) = besselk(m,v2*c)./(v2*c.*besselk(m+1,v2*c)); % K^m(v2c)  
C3(v) = besseli(m,v2*c)./(v2*c.*besseli(m+1,v2*c)); % I^m(v2c)  

C4(v) = (C1-C2)/(C1+C3);
C5(v) = besseli(m+1,v2*c)*besselk(m-1,v2)/(besselk(m+1,v2*c)*besseli(m-1,v2));

C(v) = C4 - C5;
fC = matlabFunction(C);

v_A = linspace(1e-3,3, 5001);

    i = 0;
    j = 0;
    vc(1) = 0;
    while i < length(v_A) - 1
        i = i + 1;  %
        if((sign(fC(v_A(i))) ~= sign(fC(v_A(i + 1))))&& (abs(fC(v_A(i))) < 1e3) && (abs(fC(v_A(i+1))) < 1e3))
            j = j + 1;
            vc(j) = v_A(i) -  fC(v_A(i)) * (v_A(i + 1) - v_A(i)) / (fC(v_A(i + 1)) - fC(v_A(i))); 
        end
    end
end