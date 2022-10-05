% Alfiki Diastama Afan Firdaus (M0521009)
fprintf("Program untuk mencari pendekatan nilai akar 1 + ... + akar 100\n");

% Menghitung nilai eksak
eksak = 0;
for i = 1:100
    eksak = eksak + sqrt(i);
end

% Menghitung hasil dengan pembulatan masing-masing akar
hasil_bulat = 0;
for i = 1:100
    hasil_bulat = hasil_bulat + round(sqrt(i));
end
error1 = abs(eksak-hasil_bulat);
relatif1 = error1/hasil_bulat;

% Menghitung tanpa looping
hasil_nonloop = sum(sqrt(1:100));
error2 = abs(eksak-hasil_nonloop);
relatif2 = error2/hasil_nonloop;

% Mencetak hasil
fprintf("Eksak\t\t\t\t\t= %f\n", eksak);
fprintf("Dengan pembulatan\t\t= %d\n", hasil_bulat);
fprintf("Tanpa looping\t\t\t= %f\n", hasil_nonloop);
fprintf("Error pembulatan\t\t= %f\n", error1);
fprintf("Relatif pembulatan\t\t= %f\n", relatif1);
fprintf("Error tanpa looping\t\t= %f\n", error2);
fprintf("Relatif tanpa looping\t= %f\n", relatif2);