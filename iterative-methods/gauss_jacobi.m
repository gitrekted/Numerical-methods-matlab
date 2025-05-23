%gauss jacobi
A = [12, 3, -5; 1, 5, 3; 3, 7, 13];
b = [1; 28; 76];
x0 = [1; 0; 1];
TOL = 1e-6;
N = 100;
n = length(b);
x = x0;
x_new = zeros(n, 1);
for k = 1:N
    for i = 1:n
        sum = 0;
        for j = 1:n
            if j ~= i
                sum = sum + A(i, j) * x(j);
            end
        end
        x_new(i) = (b(i) - sum) / A(i, i);
    end
    if norm(x_new - x, inf) < TOL
        fprintf('Converged in %d iterations.\n', k);
        fprintf('Solution: x1 = %.6f, x2 = %.6f, x3 = %.6f\n', x_new);
        return;
    end
    x = x_new;
end
fprintf('Did not converge within %d iterations.\n', N);
fprintf('Approximate solution: x1 = %.6f, x2 = %.6f, x3 = %.6f\n', x_new);