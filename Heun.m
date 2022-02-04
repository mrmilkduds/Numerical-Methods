function yStored = heun(t0,tf,h,y0)

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
     
    % Predictor
    k1 = Deriv(t,y);
    ym = y + k1*h;
    
    % Corrector
    k2 = Deriv(t+h,ym);
    y = y + ((k1+k2)*(h/2));
    t = t + h;
    
    % Store to vector
    yStored(i) = y;
    xstored(i) = t;
end
    disp(yStored);
    plot(xstored,yStored,'--r');
    grid on;
    hold on;
end