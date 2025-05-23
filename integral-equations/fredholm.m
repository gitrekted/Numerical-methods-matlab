%fredholm
ker = @(x,t) x+t;
phi = @(x) 1.5*x -5/6;
a=0; b=1;
n=10;
h=(b-a)/n;
t = zeros(1,n+1);
t(1) = a;
for i = 2:n+1
    t(i) = t(i-1) + h;
end
A = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        if j == 1 || j == n+1
            A(i,j) = h/2 * ker(t(i),t(j));
        else
            A(i,j) = h * ker(t(i),t(j));
        end
    end
end
f = phi(t)';
phi_num = (eye(n+1) - A) \ f;
disp(phi_num);