% Newton's Method 
f = @(x, y) [x + 3 * log10(x) - y^2;
             2 * x^2 - x * y - 5 * x + 1];
J = @(x, y) [1 + 3 / (x * log(10)), -2 * y;
             4 * x - y - 5,        -x];
// Initial guess
x = 3.4;
y = 2.2;
tol = 0.5e-8;    % 8 significant figures
max_iter = 100;
fprintf('Iter\t\tx\t\t\ty\n');
for k = 1:max_iter
    F = f(x, y);
    J_inv = inv(J(x, y));           % Inverse of Jacobian
    delta = J_inv * F;              % Solve J * delta = F
    x_new = x - delta(1);
    y_new = y - delta(2);
    fprintf('%d\t\t%.10f\t%.10f\n', k, x_new, y_new);
    if norm([x_new - x; y_new - y], inf) < tol
        fprintf('\nConverged in %d iterations.\n', k);
        break;
    end
    x = x_new;
    y = y_new;
end
fprintf('\nFinal solution (8 significant figures):\n');
disp(vpa([x; y], 8));