
%LU decomposition
A = [ 1  1 -1; 1 -2  3; 2  3  1];
b = [4; -6; 7];
n = size(A,1);
L = eye(n);
U = A;
P = eye(n);
for k = 1:n-1
    // Finding the pivot row index
    [~, idx] = max(abs(U(k:n, k)));
    idx = idx + k - 1;
    if idx ~= k
        U([k, idx], :) = U([idx, k], :);
        P([k, idx], :) = P([idx, k], :);
        if k > 1
            L([k, idx], 1:k-1) = L([idx, k], 1:k-1);
        end
    end // performing Gaussian elimination
    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k);
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
    end
end //Solving Ly = Pb using forward substitution
y = zeros(n, 1);
y(1) = P(1,:) * b;
for i = 2:n
    y(i) = P(i,:) * b - L(i, 1:i-1) * y(1:i-1);
end //Solving Ux = y using backward substitution
x = zeros(n, 1);
x(n) = y(n) / U(n, n);
for i = n-1:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end
disp('The values of x1, x2 and x3 are:');
disp(vpa(x,6));