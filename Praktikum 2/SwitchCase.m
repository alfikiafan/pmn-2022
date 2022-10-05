% Alfiki Diastama Afan Firdaus
% M0521009

x = input("Masukkan nilai suhu dalam Celsius: ");
y = input("\nTentukan konversi suhu tujuan\n" + ...
    "1 = Fahrenheit\n" + ...
    "2 = Reaumur\n" + ...
    "3 = Kelvin\n" + ...
    "Masukkan pilihan Anda: ");
switch (y)
    case 1
        z = 1.8*x+32;
        fprintf("\n%g °C = %g °F\n", x, z);
    case 2
        z = 0.8*x;
        fprintf("\n%g °C = %g °R\n", x, z);
    case 3
        z = x + 273;
        fprintf("\n%g °C = %g K\n", x, z);
    otherwise
        fprintf("Pilihan Anda tidak didukung program.");
end