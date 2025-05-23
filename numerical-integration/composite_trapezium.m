% TO SOLVE THE PROBLEM BY COMPOSITE TRAPEZOIDAL RULE
f = @(x) 4./(x + log10(7*x.^2 + 2*x + 7));
a = 2.1;
b = 2.2;
n = 100;
h = (b - a) / n;
i = 1:n-1; % Create an array of indices from 1 to n-1
x = a + i.*h; % Compute the x values at these indices
s = f(x); % Evaluate the function at these x values
out = (h/2) * (f(a) + 2*sum(s) + f(b)); % Apply the composite trapezoidal rule
fprintf('The value of integration is: %.7f (correct up to seven decimal places)\n', out);
