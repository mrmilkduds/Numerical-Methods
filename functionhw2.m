function f = funct(x,eta,D,rho,V,mu)
reyn = (rho*V*D)/mu;
f = (1/sqrt(x))+(2*(log10(((eta/D)/3.7)+(2.51/(reyn*sqrt(x))))));
end
