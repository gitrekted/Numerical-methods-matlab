%Euler Method
% Define the differential equation
f = @(x, y) x + sqrt(y);

% Initial conditions
x0 = 0.5;
y0 = 0.7240;
h = 0.1;
x_end = 1.5;

% Number of steps
n = (x_end - x0) / h;

% Initialize arrays to store the values of x and y
x = x0;
y = y0;

% Euler's method
for i = 1:n
    y = y + h * f(x, y);
    x = x + h;
end

% Display the result
fprintf('The value of y(%.1f) using Eulers method is %.7f\n', x_end, y);
