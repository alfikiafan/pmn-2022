% Alfiki Diastama Afan Firdaus (M052109)
fprintf("Program untuk mencari pendekatan nilai akar 2\n");

% Menghitung nilai eksak
eksak = sqrt(2);

% Menghitung nilai pendekatan
x = 1;
n = input("Masukkan nilai n: ");
for i = 1:n
    y = x;
    x = (y+2/y)/2;
end
error = abs(eksak-x);
relatif = error/x;

% Mencetak hasil
fprintf("Eksak\t\t= %f\n", eksak);
fprintf("Pendekatan\t= %f\n", x);
fprintf("Error\t\t= %f\n", error);
fprintf("Relatif\t\t= %f\n", relatif);