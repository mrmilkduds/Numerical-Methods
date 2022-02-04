function y = gaussSeidel(C,M,imax,es,lambda)
n = length(C);
y = zeros(n,1);

%makes pivot coefficients 1
for i = 1:n
    dummy = C(i,i);
    for j= 1:n
        C(i,j) = C(i,j)/dummy;
    end
    M(i) = M(i)/dummy;
end

%Initial guess
for i = 1:n
    sum = M(i);
    for j = 1:n
        if i ~= j
            sum = sum - C(i,j)*y(j);
        end
    end
    y(i) = sum;
end

%Iterations
iter = 1;
while 1
    sentinel = 1;
    for i = 1:n
        old = y(i);
        sum = M(i);
        for j = 1:n
            if i ~= j
                sum = sum - C(i,j)*y(j);
            end
        end
        y(i) = lambda*sum + (1.-lambda)*old;
        if (sentinel == 1) && (y(i) ~= 0)
            ea = abs((y(i) - old)/y(i))*100;
            if ea > es
                sentinel = 0;
            end
        end
    end
    iter = iter + 1;
    if (sentinel == 1) || (iter >= imax) %Loop break
        break
    end
end
disp('Iterations:');
disp(iter);
%disp(y);
end
                