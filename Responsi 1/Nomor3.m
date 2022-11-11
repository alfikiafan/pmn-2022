% Alfiki Diastama Afan Firdaus (M0521009)
% Nomor 3 - Bentuk Sistem Persamaan Linear

f = @(h) h.^3 - 15*h.^2 + (900/pi);
x = linspace(0, 10);
y = f(x);
plot(x, y, "r");
line([-1, 11], [0, 0]);
line([0, 0], [min(y), max(y)]);
fprintf("\nAkar pertama");
h1 = RegulaFalsi(f, 4, 6, 10, 10.^-5);
fprintf("\nAkar kedua");
h2 = RegulaFalsi(f, 12, 14, 10, 10.^-5);

function c = RegulaFalsi(f, a, b, n, tol)
    fa = f(a);
    fb = f(b);
    if fa * fb > 0
        error("Warning: tanda sama");
    end
    fprintf("\nI\t\ta\t\t\tb\t\t\tfa\t\t\tfb\t\t\tc\t\t\tfc\n");
    for i = 1:n
        c = (a*fb-b*fa)/(fb-fa);
        fc = f(c);
        fprintf ('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', i, a, b, fa, fb, c, fc);
        if abs(c-a) <= tol || abs(c-b) <= tol
            fprintf('\nNilai akar adalah: %f\n', c);
            break;
        end
        if fa*fc == 0
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
end