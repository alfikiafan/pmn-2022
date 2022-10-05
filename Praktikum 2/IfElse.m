% Alfiki Diastama Afan Firdaus
% M0521009

x = input("Masukkan nilai Indeks Prestasi Anda: ");
if (x >= 85)
    fprintf("Nilai Anda adalah A.\n");
elseif(x >= 80 && x < 85)
    fprintf("Nilai Anda adalah A-.\n");
elseif(x >= 75 && x < 80)
    fprintf("Nilai Anda adalah B+.\n");
elseif(x >= 70 && x < 75)
    fprintf("Nilai Anda adalah B.\n");
elseif(x >= 65 && x < 70)
    fprintf("Nilai Anda adalah C+.\n");
elseif(x >= 60 && x < 65)
    fprintf("Nilai Anda adalah C.\n");
elseif(x >= 55 && x < 60)
    fprintf("Nilai Anda adalah D.\n");
else
    fprintf("Nilai Anda adalah D.\n");
end