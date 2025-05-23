%Composite Simpson 1/3
% Define the function
f = @(x) 4 ./ (x + log10(7*x.^2 + 2*x + 7));

% Define the interval
a = 2.1;
b = 2.2;
n = 1000; % Number of intervals (must be even)

% Ensure n is even
if mod(n, 2) ~= 0
    n = n + 1;
end

% Composite Simpson's one-third rule
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);
composite_simpson_result = h/3 * (y(1) + 2*sum(y(3:2:n-1)) + 4*sum(y(2:2:n)) + y(n+1));

% Display the result
fprintf('Composite Simpsons one-third rule result: %.7f\n', composite_simpson_result);
