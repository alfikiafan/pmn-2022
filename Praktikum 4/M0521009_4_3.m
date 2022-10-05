% Alfiki Diastama Afan Firdaus (M0521009)
fprintf("Program untuk menghitung nilai cos (pi) dengan deret Taylor\n");

% Menghitung nilai eksak
eksak = cos(pi);

% Menghitung nilai pendekatan dengan deret Taylor
n = input("Masukkan nilai n: ");
taylor = 0;
for k = 0:n
    taylor = taylor + power(-1, k) * power(pi,2*k)/factorial(2*k);
end
error = abs(eksak-taylor);
relatif = error/taylor;

% Mencetak hasil
fprintf("Eksak\t\t\t\t= %f\n", eksak);
fprintf("Dengan deret Taylor\t= %f\n", taylor);
fprintf("Error\t\t\t\t= %f\n", error);
fprintf("Relatif\t\t\t\t= %f\n", relatif);