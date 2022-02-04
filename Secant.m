function fric = secant(xi,delta,es,eta,D,rho,V,mu)
iter = 0;
bool = 1;
%fold = functionhw2(xold,eta,D,rho,V,mu);
while bool == 1;
    iter = iter + 1 ;
    %Xnew calculations
    fdelta = functionhw2((xi+delta),eta,D,rho,V,mu); %
 
    fxi = functionhw2(xi,eta,D,rho,V,mu); 
    xnew = xi - ((fxi*delta)/(fdelta-fxi)); %
   
    
    ea = abs( (xi - xnew)/xi )*100;
    

    
    
    % Function causes error for x < 0 , so generate random initial guesses
    % until something works.
    if xi < 0 | xnew <0
       xi = rand;
       xold = rand;
       iter = 0;
    else
        xold = xi;
        xi = xnew;
    end
    
    disp(iter);
    disp(xi);
    disp(ea);
   
    %End Loop Condition
    if ea < es
        bool = 0;
    end
end
disp(iter);
fric = xnew;
end