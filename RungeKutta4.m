function yStored = RK4(t0,tf,h,y0)
   
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
    %k1
    k1 = Deriv(t,y);
    ym = y + k1*(h/2);
    %k2
    k2 = Deriv(t+(h/2),ym);
    ym = y + k2*(h/2);
    %k3
    k3 = Deriv(t+(h/2),ym);
    ye = y + k3*h;
    %k4
    k4 = Deriv(t+h, ye);
    
    %Next Value
    m = (k1 + 2*k2 + 2*k3 + k4)*(1/6);
    y = y + m*h;
    t = t+h;
    
    %Store to Vector
    yStored(i) = y;
    xstored(i) = t;
end
    disp(yStored);
    plot(xstored,yStored,'--g');
    grid on;
    hold on;
end
    