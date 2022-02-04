function fric = Newtraph(xi,es,eta,D,rho,V,mu)
iter = 0;
bool = 1;
%Derivative calculated from online calculator
a = 0.00018;
b = 0.00023;
c = 0.00008;

df = @(x) ((-a/sqrt(x))- b)/((2*x.^(3/2))*((a/sqrt(x))+c));

while bool == 1;
    iter = iter + 1 ;
    %xnew Calculation
    fxi = functionhw2(xi,eta,D,rho,V,mu);
    dfxi = df(xi);
    xnew = xi - (fxi/dfxi);
    
    ea = abs((xi - xnew)/xi)*100;
    
    xi = xnew;
    
        %Resets initial guess when  divide by 0 causes error
    if dfxi == 0
        xi = rand;
        iter = 0;
    end
     
    disp(iter);
    disp(xi);
    disp(ea);
   
    if ea < es
        bool = 0;
    end

    
end
disp(iter);
fric = xi;
end

    