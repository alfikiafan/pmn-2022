% Alfiki Diastama Afan Firdaus (M0521009)
% Nomor 2 - Bentuk Sistem Persamaan Linear

mass = [5, 0.25, 2.5, 0.5; 7, 0.5, 1.5, 0.9; 3.5, 2.5, 2, 0.45; 10, 0.75, 1.5, 0.25];
price = [144375; 185500; 164000; 187875];
goods = ["beras"; "telur"; "jeruk"; "nuget"];

fprintf("\nBentuk sistem persamaan linear: \n\n");
fprintf("beras\ttelur\tjeruk\tnuget\ttotal\n");

for i = 1:4
    fprintf("%.2f\t", mass(i, 1: end));
    fprintf("Rp%i.00\n", price(i));
end

price = Gauss (mass, price);
fprintf("\n");
for i = 1:4
    fprintf("Harga %s per kilogram adalah: Rp%.2f\n", goods{i}, price(i));
end

function result = Gauss(A, K)
    [row,col] = size(A);
    for i = 1 : row-1
        [~,k] = max(abs(A(i:row, i)));
        if (k ~= 1)
            temp1 = A(i, :);
            temp2 = K(i, :);
            A(i,:) = A(i+k-1,:);
            K(i,:) = K(i+k-1,:);
            A(i+k-1,:) = temp1;
            K(i+k-1,:) = temp2;
        end
        for h = i+1 : row
            m = A(h,i)/A(i,i);
            A(h,:) = A(h,:) - m*A(i,:);
            K(h,:) = K(h,:) - m*K(i,:);
        end
    end
    x(row,:) = K(row,:) / A(row,col);
    for i = row-1:-1:1
        x(i,:) = (K(i,:)-A(i,i+1:row)*x(i+1:row,:)) / A(i,i);
    end
    result = x;
end