classdef Const
    properties (Constant)
      e0 = 8.8541878176 e-12;           %[F/m] permissivity in free space 
      u0 = 4*pi * 1e-7;                 %[H/m] permeability in free space
      c0 = 1/sqrt(Const.e0 * Const.u0); %[m/s] light speed in free space
      eta0 = sqrt(Const.u0/Const.e0);   %[Ohm] caracteristic impedance in free space  
    end
end
