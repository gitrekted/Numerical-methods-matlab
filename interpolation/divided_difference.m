%Divided Difference
% Given data
x = [1.18, 1.22, 1.23, 1.28, 1.30];
f = [0.3072787, 0.2952302, 0.2922926, 0.2780373, 0.2725318];

% Target x value
x_val = 1.24;

% Number of data points
n = length(x);

% Compute the divided difference table
DD = zeros(n, n);
DD(:,1) = f';

for j = 2:n
    for i = 1:(n-j+1)
        DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Display the divided difference table (optional)
disp('Divided Difference Table:');
disp(DD);

% Initialize the result with f(x0)
y = f(1);

% Compute the interpolated value using divided differences
for k = 2:n
    term = 1;
    for j = 1:k-1
        term = term * (x_val - x(j));
    end
    y = y + DD(1, k) * term;
end

% Display the result
fprintf('The interpolated value of f(%.2f) using Newton''s divided difference formula is %.6f\n', x_val, y);
