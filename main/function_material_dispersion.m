function [n,D] = function_material_dispersion(mat)
    syms lambda
    if(mat==1) % fused silica
    n(lambda) = sqrt((0.6961663*lambda^2)/(lambda^2-0.0684043^2)+...
                (0.4079426*lambda^2)/(lambda^2-0.1162414^2)+...
                (0.8974794*lambda^2)/(lambda^2-9.896161^2)+1);
    
    elseif(mat==2) % germania
    n(lambda) = sqrt((0.80686642*lambda^2)/(lambda^2-0.068972606^2)+...
                (0.71815848*lambda^2)/(lambda^2-0.15396605^2)+...
                (0.85416831*lambda^2)/(lambda^2-11.841931^2)+1);
    
    elseif(mat==3) % titania
    n(lambda) = sqrt(5.913 + 0.2441/(lambda^2-0.0803));    
    
    elseif(mat==4) % (C5H8O2)n (Poly(methyl methacrylate), PMMA)   
    n(lambda) = sqrt(1.1819*lambda^2/(lambda^2-0.011313^2)+1);
    
    elseif(mat==5) % LASF9
    n(lambda) = sqrt((2.00029547*lambda^2)/(lambda^2-0.0121426017)+...
                (0.298926886*lambda^2)/(lambda^2-0.0538736236)+...
                (1.80691843*lambda^2)/(lambda^2-156.530829)+1);
    
    end  
                    
    D(lambda) = -(lambda/Const.c0) .* diff(n, lambda, 2);        
    D(lambda) = D(lambda) * (1e12);
end