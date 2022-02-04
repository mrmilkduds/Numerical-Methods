function yStored = euler349(t0,tf,h,y0)

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
    
    
    slope = Deriv(t,y);
    
    y = y + slope*h;
    t = t+h;
    
    % Store to vector
    yStored(i) = y;
    xstored(i) = t;
end
   disp(yStored);
   plot(xstored,yStored, '--b');
   grid on;
   hold on;
end

