%Trapezodal rule

% Define the function
f = @(x) 4 ./ (x + log10(7*x.^2 + 2*x + 7));

% Define the interval
a = 2.1;
b = 2.2;

% Apply Trapezoidal rule
h = b - a;
trapezoidal_result = (h/2) * (f(a) + f(b));

% Display the result
fprintf('Trapezoidal rule result: %.7f\n', trapezoidal_result);
