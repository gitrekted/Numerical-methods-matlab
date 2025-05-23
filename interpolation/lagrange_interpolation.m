%Lagrange Interpolation

% Given data
x = [2.30, 2.35, 2.41, 2.49, 2.52];
f = [-0.666276, -0.702713, -0.744111, -0.795119, -0.812952];

% Target x value
x_val = 2.46;

% Number of data points
n = length(x);

% Initialize interpolated value
y = 0;

% Lagrange interpolation
for i = 1:n
    % Calculate the Lagrange basis polynomial L_i(x)
    L_i = 1;
    for j = 1:n
        if j ~= i
            L_i = L_i * (x_val - x(j)) / (x(i) - x(j));
        end
    end
    
    % Add the contribution of each term to the interpolated value
    y = y + f(i) * L_i;
end

% Display the result
fprintf('The interpolated value of f(%.2f) using Lagrange''s interpolation formula is %.5f\n', x_val, y);
