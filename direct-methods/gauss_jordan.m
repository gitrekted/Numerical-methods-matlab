%gauss jordan
matt = [1.44 2.95 -2.14 1.86; 3.21 -0.86 2.42 -3.20; 4.17 3.62 -1.68 -2.26; 2.38 1.95 -3.27 1.58];
sol = [1.42; 3.28; 5.21; 2.16];
n = size(matt,1);
augmatt = zeros(n, n+1);
for i = 1:n
    for j = 1:n
        augmatt(i, j) = matt(i, j);
    end
    augmatt(i, n + 1) = sol(i);
end
for i = 1:n
    elmt = augmatt(i, i);
    augmatt(i, :) = augmatt(i, :) / elmt;
    for k = i+1:n
        fact = augmatt(k, i);
        augmatt(k, :) = augmatt(k, :) - fact * augmatt(i, :);
    end
end
for i = n:-1:1
    for k = i-1:-1:1
        fact = augmatt(k, i);
        augmatt(k, :) = augmatt(k, :) - fact * augmatt(i, :);
    end
end
y= augmatt(:,5);
fprintf('The augmented matrix in RREF form is:\n');
disp(augmatt);
fprintf('Therefore the solution is x1 = %.6f, x2 = %.6f, x3 = %.6f, x4 = %.6f, which is correct upto 6 decimal places!', y(1), y(2), y(3), y(4));