%Composite_simpson

f = @(x) 4./(x + log10(7*x^2 + 2*x + 7));
a = 2.1;
b = 2.2;
n = 10000;
h = (b - a) / n;
sum = 0;

for i = 0:n
    if i == 0 || i == n
        sum = sum + f(a + i*h);
    elseif rem(i, 2) == 1
        sum = sum + 4*f(a + i*h);
    else
        sum = sum + 2*f(a + i*h);
    end
end

result = (h / 3) * sum;
fprintf('The value of the given integration is %0.7f\n', result);
