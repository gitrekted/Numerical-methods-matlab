% jacobi's eigenvalue
A = [1 2^(1/2) 2; 2^(1/2) 3 2^(1/2); 2 2^(1/2) 1];
[m,n] = size(A);
b = A;
v = eye(n);
k = 1;
while true
    max_off_diag = 0;
    p = 0;
    q = 0;
    for i = 1:n-1
        for j = i+1:n
            if abs(b(i,j)) > max_off_diag
                max_off_diag = abs(b(i,j));
                p = i;
                q = j;
            end
        end
    end
    if max_off_diag < 1e-10
        break;
    end
    if b(p,p) == b(q,q)
        theta = pi/4;
    else
        theta = 0.5 * atan(2 * b(p,q) / (b(q,q) - b(p,p)));
    end
    R = eye(n);
    R(p,p) = cos(theta);
    R(q,q) = cos(theta);
    R(p,q) = -sin(theta);
    R(q,p) = sin(theta);
    for i = 1:n
        temp = R(i,p) * b(p,p) + R(i,q) * b(p,q);
        b(i,p) = temp;
        b(p,i) = temp;
        temp = R(i,p) * b(p,q) + R(i,q) * b(q,q);
        b(i,q) = temp;
        b(q,i) = temp;
    end
    v = v * R;
    k = k + 1;
end
eigenvalues = diag(b);
eigenvectors = v;
disp(eigenvalues);
disp(eigenvectors);
