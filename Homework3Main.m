function f = Homework3Main
%"Note, your programs for
%the 3 assigned methods should be able to solve a set of linear equations
%for any number of unknowns (not just 5), and I will test your programs
%with different sizes of matrices."

%I assumed this meant the main file doesn't have to work for matrices of
%different sizes, just the method files.

%Get constants
choice = input('Would you like to use the default mass and spring constants? [y/n]: ','s');
if choice == 'n'
    k = input('Please input the spring constant 1 through 5 as a vector ([k1;k2;k3;...kn]: ');
    m = input('Please input the masses 1 through 5 as a vector ([m1;m2;m3;...mn]: '); 
else
    k = [40;60;50;40;60];
    m = [5;20;10;16;8];
end

%Make {b}
g = 9.81;  %gravity
M = m*g;
F = 5; %added force F
M(1) = M(1) + F;

%Make [a]
pd1 = [-2*k(2);-1*k(3);-2*k(4);-1*k(5)]; %From Solving problem, changes depending on problem.
pd0 = [1*k(1);2*k(2);1*k(3);2*k(4);1*k(5)];
p1 = diag(pd1,1);
p0 = diag(pd0);
C = p1+p0;

%Method Selection
useMethod = input(['Which method would you like to use to solve for the displacements?',...
                  '\nGauss with Pivot(1)',...
                  '\nGauss-Seidel(2)',...
                  '\nThomas Algorithm(3)',...
                  '\n']);
if useMethod == 1
    Y = GaussPivot(C,M);
end
if useMethod == 2
    imax = 100;
    es = 0.000001; %0.0001%
    lambda = 1;
    Y = GaussSeidel(C,M,imax,es,lambda);
end
if useMethod == 3
    Y = ThomasAlgorithm(C,M);
end

disp(Y);
