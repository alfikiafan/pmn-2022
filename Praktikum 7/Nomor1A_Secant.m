% M0521009 - Alfiki Diastama Afan Firdaus

f = @(x) (x-sqrt(5));
a = 1.5;
b = 2;
n = 20;
tol = 10^-5;
fprintf('I\t\ta\t\t\tb\t\t\tfa\t\t\tfb\t\t\tc\t\t\tfc\n');

tic
for i = 1:n
    fa = f(a);
    fb = f(b);
    if fb == fa
        toc
        error("Pembagian dengan 0.")
    end
    c = b-(fb*(b-a))/(fb-fa);
    fc = f(c);
    fprintf ('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', i, a, b, fa, fb, c, fc);
    if abs(c-b) <= tol || fc == 0
        toc
        fprintf('\nNilai akar adalah: %f\n', c);
        break;
    else
        a = b;
        b = c;
    end
end
toc

if (abs(c-b) > tol && fc ~= 0)
    fprintf('\nFungsi tidak konvergen\n');
else
    fprintf('Fungsi konvergen\n');
end