% M0521009 - Alfiki Diastama Afan Firdaus

f = @(x) (((log(4*sin(2*x)+5))/3)-2*x/3);
a = 0.7;
n = 20;
tol = 10^-5;
syms x;
f_sym = sym(f);
f_diff = diff(f_sym);
fprintf('I\t\ta\t\tf(a)\t\tf_diff(b)\t\tb\t\tfb\n');

tic
for i = 1:n
    fa = f(a);
    f_diff_a = double(subs(f_diff, a));
    if f_diff_a == 0
        toc
        error("Pembagian dengan 0.")
    end
    b = a-fa/f_diff_a;
    fb = f(b);
    fprintf ('%d\t%f\t%f\t%f\t%f\t%f\n', i, a, fa, f_diff_a, b, fb);
    if abs(b-a) <= tol || fb == 0
        toc
        fprintf('\nNilai akar adalah: %f\n', b);
        break;
    else
        a = b;
    end
end
toc

if abs(b-a) > tol && fb ~= 0
    fprintf('\nFungsi tidak konvergen\n');
else
    fprintf('Fungsi konvergen\n');
end