function fric = RegulaFalsi(xl,xu,es,eta,D,rho,V,mu)
iter = 0;
bool = 1;
xr = .5;

xl = 1e-5; %using x1 = 0 caused errors
fl = functionhw2(xl,eta,D,rho,V,mu);
fu = functionhw2(xu,eta,D,rho,V,mu);

while bool == 1;
    iter = iter + 1 ;
    %Find Xr
    xrold = xr;
    xr = xu - (fu * ((xl-xu)/(fl-fu)));
    fr = functionhw2(xr,eta,D,rho,V,mu);
  
    %approximation error (not in %)
    ea = abs((xr - xrold) / xr)*100;

    %Secant Test
    test = fl*fr;
    if test < 0 
        xu = xr;
        fu = fr;
    elseif test > 0
        xl = xr;
        fl = fr;
    else
        ea = 0;
    end
    
    %End Loop Condition
    if ea < es
        bool = 0;
    end

end
disp(iter);
fric = xr;
end