% M0521009 Alfiki Diastama Afan Firdaus

name = ['A'; 'B'; 'C'; 'D'];
A = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, 0; 0, 3, -1, 8];
B = [6; 25; -11; -11];
tol = 0.0001;
x_exact = [1.1039; 2.9965; -1.0211; -2.6263];
max_iter = 2;
while (max_iter <= 8)
    fprintf('\nMaksimal iterasi : %d\n', max_iter);
    tic;
    [RowSize,m] = size(A);
    for i = 1:RowSize
        xlama(i) = B(i)/A(i,i);
    end
    xlama = xlama';
    C = -A;
    for i = 1:RowSize
        C(i,i) = 0.0;
        C(i,:) = C(i,:)/A(i,i);
        D(i,1) = xlama(i);
    end
    i = 1;
    while (i <= max_iter)
        xbaru = C*xlama + D;
        galat = abs(xbaru - xlama);
        if (galat <= tol)
            x = xbaru;
            disp ('Iterasi Jacobi konvergen');
            toc;
            break;
        else
            xlama = xbaru;
        end
        fprintf('%g', i);
        disp(xbaru');
        i = i + 1;
    end
    if(galat(RowSize) > tol)
        fprintf('Iterasi Jacobi tidak konvergen\n\n');
        toc;
    end
    for j= 1:RowSize
        for k = 1:1
            error(j,k)=abs(x_exact(j,k)-xbaru(j,k));
            fprintf('Eror nilai %s adalah : %.15f\n', name(j,k),error(j,k));
        end
    end
    max_iter = max_iter * 2;
    clear C d error galat i j k m RowSize xbaru xlama;
end