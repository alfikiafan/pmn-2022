% M0521009 - Alfiki Diastama Afan Firdaus

f_eksak = @(x) sqrt(-x+4);
f = @(x,y) -1 / (2*y); 

y0 = 2;
a = 0;
b = 2;
N = 10;
h = (b-a)/N;

fprintf(['\nHasil perhitungan Metode Runge-Katta Orde 4\n' ...
    'i\t\txn\t\t\tk1\t\t\tk2\t\t\tk3\t\t\tk4\t\t\tyn\n'])
x = a;
y = y0;
k = [];
fprintf('%d\t%f\t\t-\t\t\t-\t\t\t-\t\t\t-\t\t%f\n',0, x, y);

for i = 1:N
    k(1) = f(x(i), y(i));
    k(2) = f(x(i) + h/2, y(i) + k(1)*h/2);
    k(3) = f(x(i) + h/2, y(i) + k(2)*h/2);
    k(4) = f(x(i) + h, y(i) + k(3)*h);
    y(i+1) = y(i) + h/6*(k(1) + 2*k(2) + 2*k(3) + k(4));
    x(i+1) = x(i) + h;
    fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', i, x(i+1), k(1), k(2), k(3), k(4), y(i+1));
end

ansRungeKutta4 = y(end);
ansExact = f_eksak(2);

fprintf("\nHasil Eksak\t\t\t\t: %.10f\n", ansExact)
fprintf("Hasil Runge-Kutta Orde 4: %.10f\n", ansRungeKutta4)
fprintf("Galat Runge-Kutta Orde 4: %.10f\n\n", abs(ansExact - ansRungeKutta4))