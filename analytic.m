function analyzeStored = analytic(t0,tf,h,y0)
% Initialize variables
t = t0;
y = y0;
points = t0:h:tf;

% Initialize Value Vectors
analyzeStored = zeros(1,numel(points));
xstored = zeros(1,numel(points));

analyzeStored(1) = y;
xstored(1) = t;

for i = ((1+1):numel(points))
    
    t = t+h;
    y = exp((t^2/2)-3*t);
    
    analyzeStored(i) = y;
    xstored(i) = t;
end
    disp(analyzeStored);
    plot(xstored,analyzeStored,-k);
    hold on;
end