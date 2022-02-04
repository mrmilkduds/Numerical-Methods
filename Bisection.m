function fric = bisection(xl,xu,es,eta,D,rho,V,mu)
iter = 0;
bool = 1;
xr = 1;
fl = functionhw2(xl,eta,D,rho,V,mu);
while bool == 1
    iter = iter + 1 ;
   %Find Xr
    xrold = xr;
    xr = (xl+xu)/2;
    fr = functionhw2(xr,eta,D,rho,V,mu);
    
   %Error (not abs percent)
    ea = abs((xr - xrold) / xr)*100;

    
  % Bisection Test
    test = fl*fr;
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
        fl = fr;
    else
        ea = 0;
    end
    disp(iter);
    disp(xr);
    disp(ea);
 %End Loop Condition
    if ea < es
       bool = 0;
    end

end
disp(iter);
fric = xr;
end