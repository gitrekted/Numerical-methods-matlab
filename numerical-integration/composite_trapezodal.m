%Composite Trapezodal

% Define the function
f = @(x) 4 ./ (x + log10(7*x.^2 + 2*x + 7));

% Define the interval
a = 2.1;
b = 2.2;
n = 100; % Number of intervals

% Composite trapezoidal rule
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);
composite_trapezoidal_result = (h/2) * (y(1) + 2*sum(y(2:end-1)) + y(end));

% Display the result
fprintf('Composite trapezoidal rule result: %.7f\n', composite_trapezoidal_result);
