%steepest descent
x=[0;0;0];
tol=1e-6;
max_iter=100;
const =(10*pi -3)/3;
for k=1:max_iter
    x1=x(1);
    x2=x(2);
    x3=x(3);
    f1=3*x1-cos(x2*x3) - 0.5;
    f2 =x1^2 - 81*(x2 + 0.1)^2 + sin(x3) + 1.06;
    f3 =exp(-x1*x2) + 20*x3 + const;
    J = [3, x3*sin(x2*x3), x2*sin(x2*x3) ; 2*x1,-162*(x2+0.1),cos(x3); -x2*exp(-x1*x2),-x1*exp(-x1*x2), 20];
    F=[f1; f2; f3];
    grad_g = 2*J'*F;
    numerator = grad_g'*grad_g;
    H = 2*(J'*J);
    denominator = grad_g'*H*grad_g;
    alpha = numerator./denominator;
    x_new = x - alpha*grad_g;
    if norm(x_new - x)<tol
        break;
    end
    x=x_new;
end
fprintf('converged in %d iteration .\n',k);
fprintf('x1 = %.6f\n x2= %.6f\n x3 =%.6f\n',x(1),x(2),x(3));
fprintf('correct upto 6 decimal places');