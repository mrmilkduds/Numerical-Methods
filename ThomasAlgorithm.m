function y = thomasAlgorithm(C,M)
%Makes C diagonal matrices b,d,a
d = diag(C);
a = diag(C,1);
b = diag(C,-1);
L = length(M);
y = zeros(L,1);
b = [0;b] %fixes indexing

%forward elim
aN= a;
dN(1) = d(1);
rN(1) = M(1);
for j= 2:L
    dN(j) = d(j) - ((b(j)*aN(j-1))/dN(j-1));
    rN(j) = M(j) - ((b(j)*rN(j-1))/dN(j-1));
end

%Back sub
y(L) = rN(L)/dN(L);
for j = L-1:-1:1
    y(j) = ((rN(j) - (aN(j)*y(j+1)))/dN(j));
end

%disp(y);
end


