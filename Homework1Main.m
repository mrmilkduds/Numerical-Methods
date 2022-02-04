function HOMEWORK;

%Get values
t0 = input('Initial t value: ');
tf = input('Final t value: ');
h = input('Step size: ');
y0 = input('Initial y value: ');
    
%Analytic Solution-------------------------------------
    % Initialize variables
    t = t0;
    y = y0;
    points = t0:h:tf;

    % Initialize Value Vectors
    analyzeStored = zeros(1,numel(points));
    xStored = zeros(1,numel(points));


    analyzeStored(1) = y;
    xStored(1) = t;

    for i = ((1+1):numel(points))
        
        t = t+h;
        y = exp((t^2/2)-3*t);

        analyzeStored(i) = y;
        xStored(i) = t;
    end
        disp(analyzeStored);
        plot(xStored,analyzeStored,'-k');
        grid on;
        grid minor;
        hold on;
%xlswrite('eulererror.xls',analyzeStored, 'Sheet3' ,'A35');  commented out
%write to excel

%---------------------------------------------------

%Initializing Error Matrices
eulerError = zeros(1,numel(points));
heunError = zeros(1,numel(points));
RK2Error = zeros(1,numel(points));
RK4Error = zeros(1,numel(points));
%--------------------------------------------------

%Getting solution Matrices
eulerStored = Euler(t0,tf,h,y0);
heunStored = Heun(t0,tf,h,y0);
RK2Stored = RungeKutta2(t0,tf,h,y0);
RK4Stored = RungeKutta4(t0,tf,h,y0);

%Populating Error Matrices
for i = (1:numel(points))
    eulerError(i) = ((analyzeStored(i)-eulerStored(i))*100)/analyzeStored(i) ;
    heunError(i) = ((analyzeStored(i)-heunStored(i))*100)/analyzeStored(i) ;
    RK2Error(i) = ((analyzeStored(i)-RK2Stored(i))*100)/analyzeStored(i) ;
    RK4Error(i) = ((analyzeStored(i)-RK4Stored(i))*100)/analyzeStored(i) ;
end
    
end
