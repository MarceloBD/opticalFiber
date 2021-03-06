function b = function_calc_b_c1 (V, m, r, s)
syms bx
u(bx) = V*sqrt(1-bx);
u1(bx) = V*s*sqrt(r/(1+r)-bx);
v1(bx) = V*s*sqrt(bx-r/(1+r));
v(bx) = V*s*sqrt(bx);

c = 1/s;
C1(bx) = besselj(m,u)./(u.*besselj(m+1,u)); % J^m(u)  
C2(bx) = bessely(m,u1*c)./(u1*c.*bessely(m+1,u1*c)); % Y^m(u1*c)
C3(bx) = besselj(m,u1*c)./(u1*c.*besselj(m+1,u1*c)); % J^m(u1*c)
C4(bx) = besselk(m,v)./(v.*besselk(m+1,v)); % K^m(v)
C5(bx) = besselj(m,u1)./(u1.*besselj(m+1,u1)); % J^m(u1)
C6(bx) = bessely(m,u1)./(u1.*bessely(m+1,u1)); % Y^m(u1)

C7(bx) = ((C1-C2)/(C1-C3))*((C4-C5)/(C4-C6));
C8(bx) = besselj(m+1,u1*c).*bessely(m+1,u1)./(besselj(m+1,u1).*bessely(m+1,u1*c));
    
C(bx) = C7 - C8;
fC = matlabFunction(C);

if(r>0)
b_A = linspace(0,r/(1+r), 5001);
else
b_A = linspace(0, 1, 5001);    
end
    i = 0;
    j = 0;
    b(1) = 0;
    while i < length(b_A) - 1
        i = i + 1;
        if((sign(fC(b_A(i))) ~= sign(fC(b_A(i + 1)))) && (abs(fC(b_A(i))) < 1e10) && (abs(fC(b_A(i+1))) < 1e10))
            j = j + 1;
            b(j) = b_A(i) -  fC(b_A(i)) * (b_A(i + 1) - b_A(i)) / (fC(b_A(i + 1)) - fC(b_A(i))); 
        end
    end
    b = flip(b);
    
    %figure
    %plot(b_A,fC(b_A),'k');grid
    
end