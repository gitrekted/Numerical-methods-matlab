%Bisection Method
% Function definition
f = @(x) x^2 - 5*log10(5*x^2 + 2*x + 3);

% Define the interval [a, b] where the root lies
a = 1;   % Lower bound
b = 6;   % Upper bound

% Tolerance for convergence (six significant figures)
tol = 1e-7;

% Initialize variables
iter = 0;
max_iter = 100;  % Maximum number of iterations

% Check if the initial guesses bracket the root
if sign(f(a)) == sign(f(b))
    error('Initial interval [a, b] does not bracket the root.');
end

% Bisection method iteration
while (b - a) / 2 > tol && iter < max_iter
    c = (a + b) / 2;  % Midpoint
    
    % Check if c is the root or lies within the tolerance
    if abs(f(c)) < tol
        break;
    end
    
    % Update the interval [a, b]
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
    
    % Increment iteration count
    iter = iter + 1;
end

% Approximate the root
root = (a + b) / 2;

% Display the result
fprintf('The approximate root of the equation x^2 - 5*log10(5*x^2 + 2*x + 3) = 0\n');
fprintf('using the Bisection method, correct to 6 significant figures, is %.6f\n', root);
