% Given data
x = [0.10, 0.15, 0.20, 0.25, 0.30];
y = [0.1003, 0.1511, 0.2027, 0.2553, 0.3093];

% Target x value
X = 0.26;

% Number of data points
n = length(x);

% Compute the backward difference table
bacDIF = zeros(n, n);
bacDIF(:,1) = y';

for j = 2:n
    for i = 1:(n-j+1)
        bacDIF(i,j) = bacDIF(i+1,j-1) - bacDIF(i,j-1);
    end
end

% Display the backward difference table
disp('Backward Difference Table:');
disp(bacDIF);

% Newton's backward difference formula
h = x(2) - x(1);
u = (X - x(end)) / h;
Y = y(end);

% Compute the interpolated value using backward differences
p = 1;
for k = 1:n-1
    p = p * (u + k - 1) / k;
    Y = Y + p * bacDIF(n-k,k+1);
end

% Display the result
fprintf('The interpolated value of tan(%.2f) using Newton''s backward difference formula is %.5f\n', X, Y);
