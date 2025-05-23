%Cubic Spline
% Define the data points
x = [1 2 3 4];
fx = [1 5 11 8];

% Define the end conditions
ypp0 = 0; % y''(1)
yppn = 0; % y''(4)

% Number of data points
n = length(x);

% Compute the differences
h = diff(x);

% Compute the system of equations
A = zeros(n);
b = zeros(n, 1);

% Natural spline boundary conditions
A(1, 1) = 1;
A(n, n) = 1;
b(1) = ypp0;
b(n) = yppn;

% Fill the A matrix and b vector
for i = 2:n-1
    A(i, i-1) = h(i-1);
    A(i, i) = 2 * (h(i-1) + h(i));
    A(i, i+1) = h(i);
    b(i) = 3 * ((fx(i+1) - fx(i)) / h(i) - (fx(i) - fx(i-1)) / h(i-1));
end

% Solve for the second derivatives
M = A \ b;

% Evaluate the spline at x = 1.2
xi = 1.2;
for i = 1:n-1
    if xi >= x(i) && xi <= x(i+1)
        hi = x(i+1) - x(i);
        ai = fx(i);
        bi = (fx(i+1) - fx(i)) / hi - hi / 3 * (2 * M(i) + M(i+1));
        ci = M(i) / 2;
        di = (M(i+1) - M(i)) / (3 * hi);
        y1_2 = ai + bi * (xi - x(i)) + ci * (xi - x(i))^2 + di * (xi - x(i))^3;
        break;
    end
end

% Evaluate the derivative of the spline at x = 3
xi = 3;
for i = 1:n-1
    if xi >= x(i) && xi <= x(i+1)
        hi = x(i+1) - x(i);
        bi = (fx(i+1) - fx(i)) / hi - hi / 3 * (2 * M(i) + M(i+1));
        ci = M(i) / 2;
        di = (M(i+1) - M(i)) / (3 * hi);
        dy3 = bi + 2 * ci * (xi - x(i)) + 3 * di * (xi - x(i))^2;
        break;
    end
end

% Display the results
fprintf('y(1.2) = %.4f\n', y1_2);
fprintf('y''(3) = %.4f\n', dy3);

%OUTPUT
% >>cubic_spline
% y(1.2) = 1.5824
% y'(3) = -1.3333
