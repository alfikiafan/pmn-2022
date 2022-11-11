% M0521009 - Alfiki Diastama Afan Firdaus

f_eksak = @(x) sqrt(-x+4);
f = @(x,y) -1 / (2*y); 

y0 = 2;
a = 0;
b = 2;
N = 10;
h = (b-a)/N;

x = a;
y = y0;
fprintf('Hasil perhitungan Metode Euler:\ni\t\txn\t\t\tyn\n');
for i = 1:N
    y(i+1) = y(i) + h * f(x(i), y(i));
    x(i+1) = x(i) + h;
    fprintf('%d\t%f\t%f\n', i, x(i+1), y(i+1));
end

ansEuler = y(end);
ansExact = f_eksak(2);

fprintf("\nHasil Eksak: %.10f\n", ansExact)
fprintf("Hasil Euler: %.10f\n", ansEuler)
fprintf("Galat Euler: %.10f\n\n", abs(ansExact - ansEuler))