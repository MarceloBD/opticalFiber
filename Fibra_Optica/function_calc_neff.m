function neff = function_calc_neff (nu,k0,n1,n2,a)
syms x
k1 = k0*n1;
k2 = k0*n2;

u(x) = k0*sqrt(n1^2-x.^2);
w(x) = k0*sqrt(x.^2-n2^2);

C1(x) = ((k0*x*nu/a).*((1./(u.^2))+(1./(w.^2)))).^2;

C2(x) = (0.5*(besselj(nu-1,u*a)-besselj(nu+1,u*a))./besselj(nu,u*a)).^2;

C3(x) = (0.5*(-besselk(nu-1,w*a)-besselk(nu+1,w*a))./besselk(nu,w*a)).^2;

C4(x) = 0.5*(besselj(nu-1,u*a)-besselj(nu+1,u*a))*0.5.*(-besselk(nu-1,w*a)-besselk(nu+1,w*a))./...
        (besselj(nu,u*a).*besselk(nu,w*a));

C(x) = C1 - ((k1^2)./u).*((C2./u)+(C4./w)) - ((k2^2)./w).*((C3./w)+(C4./u));

fC = matlabFunction(C);

xx = linspace(n2+n2*1e-4,n1-n1*1e-4,5001);

i=0;
j=0;
neff(1) = n2;
  while i<length(xx)-1
     i=i+1;
     if((sign(fC(xx(i)))~=sign(fC(xx(i+1))))&&(abs(fC(xx(i)))<100))
         j = j+1;
         neff(j) = xx(i)-(xx(i+1)-xx(i))*fC(xx(i))/(fC(xx(i+1))-fC(xx(i))); 
     end
  end
neff = flip(neff);
% figure
% plot(xx,fC(xx),'k');grid
% xlabel('n')
% ylabel('f (n)')

end
