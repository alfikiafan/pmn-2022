% M0521009 - Alfiki Diastama Afan Firdaus

f = @(x) (x-sqrt(5));
a = 2;
b = 2.5;
n = 20;
tol = 10^-5;
fa = f(a);
fb = f(b);
if fa*fb > 0
    error('Warning: memiliki tanda yang sama.')
end
fprintf('I\t\ta\t\t\tb\t\t\tfa\t\t\tfb\t\t\tc\t\t\tfc\n');

tic
for i = 1:n
    c = (a*fb-b*fa)/(fb-fa);
    fc = f(c);
    fprintf ('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', i, a, b, fa, fb, c, fc);
    if abs(c-a) <= tol || abs(c-b) <= tol
        toc
        fprintf('\nNilai akar adalah: %f\n', c);
        break;
    end
    if fa*fc == 0
        toc
        fprintf('\nNilai akar adalah: %f\n', c);
        break;
    elseif fa*fc < 0
        b = c;
        fb = f(b);
    else
        a = c;
        fa = f(a);
    end
end
toc

if (abs(c-a) > tol && abs(c-b) > tol) && fa*fc ~= 0
    fprintf('\nFungsi tidak konvergen\n');
else
    fprintf('Fungsi konvergen\n');
end