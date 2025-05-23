%gauss elimination
mat = [1.44 2.95 -2.14 1.86; 3.21 -0.86 2.42 -3.20; 4.17 3.62 -1.68 -2.26; 2.38 1.95 -3.27 1.58];
sol = [1.42; 3.28; 5.21; 2.16];
n = size(mat,1);
augmat = zeros(n,n+1);
for i=1:n
    for j=1:n
        augmat(i,j)=mat(i,j);
    end
    augmat(i,n+1)=sol(i);
end
for i=1:n
    element = augmat(i,i);
    augmat(i,:)=augmat(i,:)/element;
    for k = i+1:n
        factor = augmat(k,i);
        augmat(k,:) = augmat(k,:)-factor*augmat(i,:);
    end
end
for i=1:n
    if augmat(i,i)==0
        augmat([i i+1],:) = augmat([i+1 i],:);
    end
end
xa = zeros(n,1);
for i = n:-1:1
    xa(i) = augmat(i,n+1);

    for j = i+1:n
        xa(i)=xa(i)-augmat(i,j)*xa(j);
    end
end
fprintf('The given matrix is: \n');
disp(mat);
fprintf('The solution matyrix is: \n');
disp(vpa(xa,6));