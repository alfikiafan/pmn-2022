% M0521009 - Alfiki Diastama Afan Firdaus

f_eksak = @(x) sqrt(-x+4);
f = @(x,y) -1 / (2*y); 

y0 = 2;
a = 0;
b = 2;
N = 10;
h = (b-a)/N;

fprintf('Hasil perhitungan Metode Heun:\ni\t\txn\t\t\tk1\t\t\tk2\t\t\tyn\n')
x = a;
y = y0;
k = [];
fprintf('%d\t%f\t\t-\t\t\t-\t\t%f\n', 0, x, y);

for i = 1:N
    k(1) = f(x(i), y(i));
    k(2) = f(x(i) + h, y(i) + k(1)*h);
    y(i+1) = y(i) + h/2 * (k(1) + k(2));
    x(i+1) = x(i) + h;
    fprintf('%d\t%f\t%f\t%f\t%f\n', i, x(i+1), k(1), k(2), y(i+1));
end

ansHeun = y(end);
ansExact = f_eksak(2);

fprintf("\nHasil Eksak: %.10f\n", ansExact)
fprintf("Hasil Heun : %.10f\n", ansHeun)
fprintf("Galat Heun : %.10f\n\n", abs(ansExact - ansHeun))