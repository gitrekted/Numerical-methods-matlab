%jordan inverse
mat = [0.89 4.32 -0.47 0.95; 1.13 -0.89 0.61 5.63; 6.32 -0.73 -0.65 1.06; 0.74 1.01 5.28 -0.88];
n = 4; 
augmat = zeros(n, 2*n);
for i = 1:n
    for j = 1:n
        augmat(i, j) = mat(i, j);
    end
    augmat(i, n + i) = 1;
end
for i = 1:n
    elmt = augmat(i, i);
    augmat(i, :) = augmat(i, :) / elmt;
    for k = i+1:n
        fact = augmat(k, i);
        augmat(k, :) = augmat(k, :) - fact * augmat(i, :);
    end
end
for i = n:-1:1
    for k = i-1:-1:1
        fact = augmat(k, i);
        augmat(k, :) = augmat(k, :) - fact * augmat(i, :);
    end
end
disp(vpa(augmat, 6));
fprintf('The inverse matrix is: \n');
disp(vpa(augmat(1:4,5:8), 6));
