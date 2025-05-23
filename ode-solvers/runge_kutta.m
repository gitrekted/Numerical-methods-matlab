% Runge-Kutta method
f = @(x,y) x^2 + y^2;
h = 0.1;
x0 = 1.0;
y0 = 0.0;
x_end = 1.3;

x = x0;
y = y0;

while x < x_end
    if x + h > x_end
        h = x_end - x;
    end
    
    k1 = h * f(x, y);
    k2 = h * f(x + (h/2), y + (k1/2));
    k3 = h * f(x + (h/2), y + (k2/2));
    k4 = h * f(x + h, y + k3);
    
    y = y + (k1 + 2*k2 + 2*k3 + k4) / 6;
    x = x + h;
end

fprintf('The value of y(1.3) = %.6f\n', y);
