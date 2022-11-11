% M0521009 Alfiki Diastama Afan Firdaus

name = ["A"; "B"; "C"; "D"];
A = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, 0; 0, 3, -1, 8];
B = [6; 25; -11; -11];
tol = 0.0001;
x_exact = [1.1039; 2.9965; -1.0211; -2.6263];
max_iter = 2;
while (max_iter <= 8)
    fprintf("\nIterasi maksimal: %d\n", max_iter);
    tic
    [RowSize, ~] = size(A);
    for i=1:RowSize
        if (i==1)
            x(i) = B(i)/A(i,i);
        else
            x(i) = 0;
        end
    end
    x = x';
    C=-A;
    for j=1:RowSize
        C(j,j) = 0.0;
        C(j,:) = C(j,:)/A(j,j);
        d(j,1) = B(j)/A(j,j);
    end
    
    k=1;
    while (k<=max_iter)
        x_lama=x;
        for j=1:RowSize
            x(j)=C(j,:)*x+d(j);
        end
        galat = abs(x_lama-x);
        if (galat <= tol)
            fprintf("Gauss Seidel Method konverge\n");
            toc
            break
        end
        fprintf('%g', k);
        disp(x');
        k = k + 1;
    end
    if (galat(RowSize) > tol)
        fprintf("Gauss Seidel Method not konverge\n\n");
        toc
    end
    for j= 1:RowSize
        for k = 1:1
            error(j,k)=abs(x_exact(j,k)-x(j,k));
            fprintf('Eror nilai %s adalah : %.15f\n', name(j,k),error(j,k));
        end
    end
    max_iter = max_iter * 2;
    clear C D error galat i j k l m x RowSize xlama;
end