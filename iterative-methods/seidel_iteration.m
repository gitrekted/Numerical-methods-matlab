%seidel iteration
A = [12 3 -5; 1 5 3; 3 7 13];  % Coefficient matrix
b = [1; 28; 76];               % Right-hand side vector
x = [1; 0; 1];   
tol = 1e-6;        
max_iter = 100;    
n = length(b);    
fprintf('Iteration   x1         x2         x3\n');
fprintf('-----------------------------------\n');

for iter = 1:max_iter
    x_old = x; 
    for i = 1:n
        sigma = 0;
        for j = 1:n
            if j ~= i
                sigma = sigma + A(i, j) * x(j);
            end
        end
                x(i) = (b(i) - sigma) / A(i, i);
    end
    fprintf('%4d    %10.6f  %10.6f  %10.6f\n', iter, x(1), x(2), x(3));
    if norm(x - x_old, inf) < tol
        break;
    end
end
fprintf('\nSolution after %d iterations:\n', iter);
disp(x);
