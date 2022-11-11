% M0521009 - Alfiki Diastama Afan Firdaus

f = @(x) (x.^2+sin(x)-10);
g2 = @(x) ((-sin(x)/x+10/x));
a = 2;
n = 20;
tol = 10^-5;
syms x;
g_diff = matlabFunction(diff(sym(g2),'x'));
c_score = abs(g_diff(a));
fprintf('Nilai konvergensi: %f\n', c_score);
if c_score < 0 || c_score > 1
    error("Fungsi tidak bisa digunakan.")
end
fprintf('\nI\t\ta\t\t\tb\t\t\tgb\n');

tic
for i = 1:n
    b = g2(a);
    gb = g2(b);
    fprintf ('%d\t%f\t%f\t%f\n', i, a, b, gb);
    if abs(b-a) <= tol || gb == 0
        toc
        fprintf('\nNilai akar adalah: %f\n', b);
        break;
    else
        a = b;
    end
end
toc

if (abs(b-a) > tol && gb ~= 0)
    fprintf('\nFungsi tidak konvergen\n');
    fprintf('Terjadi root jumping\n');
end