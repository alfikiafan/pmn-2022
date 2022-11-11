% Alfiki Diastama Afan Firdaus (M0521009)
% Nomor 1 - Galat

tol = 0.01;
t = 0: 0.01: 4;
h_exact = wave_exact(3, t, 20, 5, 10);
h_25 = wave_approach(3, t, 20, 5, 10, 25);
h_26 = wave_approach(3, t, 20, 5, 10, 26);
h_27 = wave_approach(3, t, 20, 5, 10, 27);

plot(t, h_25, t, h_26, t, h_27, t, h_exact);
xlabel = ("Waktu");
ylabel = ("Tinggi Gelombang");

error_h25 = (h_exact - h_25)/h_exact;
error_h26 = (h_exact - h_26)/h_exact;
error_h27 = (h_exact - h_27)/h_exact;
error_mean = (error_h25 + error_h26 + error_h26)/3;

fprintf("\nDaftar galat:");
fprintf("\n25 iterasi: %f", error_h25);
fprintf("\n26 iterasi: %f", error_h26);
fprintf("\n27 iterasi: %f\n", error_h27);
fprintf("\nRata-rata : %f", error_mean);
fprintf("\nToleransi : %f\n", tol);

if (error_mean < tol)
    fprintf("\nPendekatan layak digunakan\n");
else
    fprintf("\nPendekatan tidak layak digunakan\n");
end

function h_exact = wave_exact(~, t, v, lambda, x)
    h_exact = 3*(cos(t*v/lambda) + exp(x));
end

function h_approach = wave_approach(~, t, v, lambda, x, n)
    cos_approach = 0;
    e_approach = 0;
    for i = 0:(n-1)
        cos_approach = cos_approach + power(-1, i)*power((t*v/lambda), 2*i) / factorial(2*i);
    end
    for i = 0:(n-1)
        e_approach = e_approach + power(x, i) / factorial(i);
    end
    h_approach = 3*(cos_approach + e_approach);
end