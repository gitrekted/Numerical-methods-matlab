%voltera
ker = @(x,t) cos(x-t);
phi = @(x) exp(x);
lambda = 2;
a = 0; b = 0.4;
h = 0.1;
x = [a:h:b];
n = length(x);
t = x;
w = h * ones(1,n);
w(1) = h/2;
w(n) = h/2;
f = phi(x)';
A = zeros(n,n);
for i = 1:n
    for j = 1:i
        A(i,j) = lambda * w(j) * ker(x(i),t(j));
    end
end
phi_num = (eye(n) - A) \ f;
disp(phi_num);
