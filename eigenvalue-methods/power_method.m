%power method
A = [4 1 0; 1 3 1; 0 1 2];
n = size(A, 1);
x = rand(n, 1);
x = x / norm(x);
max_iter = 100;
tol = 1e-6;
lambda_old = 0;
for k = 1:max_iter
    y = A * x;
    lambda = dot(y, x);
    x = y / norm(y);
    if abs(lambda - lambda_old) < tol
        fprintf('Converged in %d iterations\n', k);
        break;
    end
    lambda_old = lambda;
end
fprintf('Largest Eigenvalue: %.6f\n', lambda);
disp('Corresponding Eigenvector:');
disp(x);