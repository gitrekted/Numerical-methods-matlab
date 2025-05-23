%Simpson 1/3 rule

% Define the function
f = @(x) 4 ./ (x + log10(7*x.^2 + 2*x + 7));

% Define the interval
a = 2.1;
b = 2.2;

% Apply Simpson's one-third rule
h = (b - a) / 2;
mid = (a + b) / 2;
simpson_result = (h/3) * (f(a) + 4*f(mid) + f(b));

% Display the result
fprintf('Simpsons one-third rule result: %.7f\n', simpson_result);
