function Homework2Main

%Given Variables or Custom
useVariables = input('Would you like to use the preset variables? (y/n)' ,'s');
if useVariables == 'y'
    rho = 1.23;
    V = 40;
    mu = 1.79e-5;
    D = 0.005;
    L = 0.2;
    eta = 1.5e-6;
    es = 0.1;
else
    %use suggested units at own discretion
    rho = input('Please input the value for density in kg/m^3');
    V = input('Please input the value for flow velocity in m/s');
    mu = input('Please input the value for flow dynamic viscosity in N*s/m^2');
    D = input('Please input the value for pipe diameter in m');
    L = input('Please input the value for pipe length in m');
    eta = input('Please input the value for pipe surface roughness in m');
    es = input('Please input the value for the apperoximation error criterion');
end

%Root Finding Guesses
xL = 0;
xU = 1;
xi = rand; %Rand cause secant and newtraph tends to diverge
xold = rand; %Rand cause secant tends to diverge
delta = 0.001

%Method Selection
useMethod = input(['Which method would you like to use to acqure the friction factor?',...
                  '\nBisection(1)',...
                  '\nFalse Position(2)',...
                  '\nModified Secant Method(3)',...
                  '\nNewton Raphson Method(4)',...
                  '\n']);
              
if useMethod == 1
    f = Bisection(xL,xU,es,eta,D,rho,V,mu);
elseif useMethod == 2
    f = RegulaFalsi(xL,xU,es,eta,D,rho,V,mu); 
elseif useMethod == 3
    f = Secant(xi,delta,es,eta,D,rho,V,mu);
else
    f= NewtonRaphson(xi,es,eta,D,rho,V,mu);
end

format long;

%Pressure Loss
pLoss =f *((L*rho*V*V)/(2*D));
fprintf('The friction factor is %d and the pressure loss is %d',f, pLoss);
end
