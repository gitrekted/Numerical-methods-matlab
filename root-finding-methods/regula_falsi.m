%Regula Falsi

% Function definition
f = @(x) log10(x) - 2*x^2 + 8;

% Initial guesses
a = 0.1; % ensure this is + val
b = 2.0; % Adjust the initial guess to ensure f(a) and f(b) have opposite signs

% Tolerance
tol = 1e-8;
max_iter = 1000;

% Regula-Falsi Method
for i = 1:max_iter
    % Calculate the value of c
    fa = f(a);
    fb = f(b);
    c = b - fb * (b - a) / (fb - fa);
    fc = f(c);
    
    % Check for convergence
    if abs(fc) < tol
        fprintf('The root is %.8f\n', c);
        return;
    end
    
    % Update the interval
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
end

% If the method did not converge within the maximum number of iterations
fprintf('The method did not converge within %d iterations\n', max_iter);
