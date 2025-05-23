%Newton Raphson

% Function definition and its derivative
f = @(x) 2*x^2 + 5 - exp(x);
df = @(x) 4*x - exp(x);

% Initial guess and tolerance
x0 = 3.5;  % Initial guess within [3, 4]
tol = 1e-7;  % Tolerance for convergence

% Maximum number of iterations
max_iter = 100;

% Initialize variables
x = x0;
iter = 0;

% Newton-Raphson iteration
while iter < max_iter
    % Calculate the next iteration
    x_next = x - f(x) / df(x);
    
    % Check convergence
    if abs(x_next - x) < tol
        break;
    end
    
    % Update x and iteration count
    x = x_next;
    iter = iter + 1;
end

% Display the result
fprintf('The root of the equation 2x^2 + 5 = e^x in the interval [3, 4] is %.6f\n', x);
