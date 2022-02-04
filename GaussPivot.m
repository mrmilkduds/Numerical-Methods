function Y = gaussPivot(C,M)

%variables
L = length(C);
i=1;
j=1;

%concatenating C,M
A =[C M];

%scaling
Cabs = abs(C);
S = max(Cabs,[],2);
disp(S);
A= A./S;
disp(A);
disp(L);



%Partial Pivoting
for k= 1:L-1
    p = k;
    big = abs(A(k,k));
    for ii = k+1:L
        if abs(A(ii,k)) > big
            big = abs(A(ii,k));
            p = ii;
        end
    end
    if p ~= k
        for jj = k:L+1
            dum = A(p,jj);
            A(p,jj) = A(k,jj);
            A(k,jj) = dum;
        end
    end
    
    %forward elim
    for i = k+1:L
        factor = A(i,k)/A(k,k);
        for j = k:L+1
            A(i,j) = A(i,j) - factor*A(k,j);
        end
    end
end

%back sub
Y(L) = A(L,L+1)/A(L,L);
for i = L-1:-1:1
    SUM = A(i,L+1);
    for j = i+1:L
        SUM = SUM - A(i,j)*Y(j);
    end
    Y(i) = SUM /A(i,i);
end
Y = Y'

%disp(Y);
end