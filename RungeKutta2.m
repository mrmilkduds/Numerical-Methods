function yStored = RK2(t0,tf,h,y0)

% Initialize variables
t = t0;
y = y0;
points = t0:h:tf;

% Initialize Value Vectors
yStored = zeros(1,numel(points));
xstored = zeros(1,numel(points));


yStored(1) = y;
xstored(1) = t;

for i = ((1+1):numel(points))
    
    %k1 value
    k1 = Deriv(t,y);
    ym = y + (3/4)*k1*h;
    
    %k2 value
    k2 = Deriv(t+(3/4)*h, ym); 

    %Next Value
    y = y + (1/3)*(k1 + 2*k2)*h;
    t = t+h;
    
    %Store to Vector
    yStored(i) = y;
    xstored(i) = t;
end
    disp(yStored);
    plot(xstored,yStored,'--m');
    grid on;
    hold on;
end