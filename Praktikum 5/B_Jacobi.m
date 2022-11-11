% M0521009 Alfiki Diastama Afan Firdaus

name = ['p'; 'q'; 'r'; 's'; "t"];
A = [6, -1, -1, 0, 0; -1, 5, -1, -1, 0; -1, -1, 4, -1, -1; 0, 0, 1, 4, -1; 0, 1, -1, 1, 4];
B = [-1; 2; 6; 2; -1];
tol = 0.0001;
x_exact = [0.2661; 0.8188; 1.7780; 0.0498; -0.0227];
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