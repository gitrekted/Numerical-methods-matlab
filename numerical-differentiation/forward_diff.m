%Forward difference
% Given data
x = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6];
y = [2.718324, 3.004251, 3.320159, 3.669365, 4.055237, 4.481755, 4.953056];

% Target x value
X = 1.01;

% Number of data points
n = length(x);

% Compute the forward difference table
FDT = zeros(n, n);
FDT(:,1) = y';

for j = 2:n
    for i = 1:(n-j+1)
        FDT(i,j) = FDT(i+1,j-1) - FDT(i,j-1);
    end
end

% Display the forward difference table
disp('Forward Difference Table:');
disp(FDT);

% Newton's forward difference formula
h = x(2) - x(1);
u = (X - x(1)) / h;
Y = y(1);

% Compute the interpolated value using forward differences
p = 1;
for k = 1:n-1
    p = p * (u - (k-1)) / k;
    Y = Y + p * FDT(1, k+1);
end

% Display the result
fprintf('The interpolated value of f(%.2f) using Newton''s forward difference formula is %.5f\n', X, Y);
