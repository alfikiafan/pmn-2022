% M0521009 Alfiki Diastama Afan Firdaus
A = [2, -1, 10, 0; 0, 3, -1, 8; 10, -1, 2, 0; -1, 11, -1, 3];
B = [-11; -11; 6; 25];

tic
[RowSize,~] = size(A);
L=zeros(RowSize);
for i=1:RowSize-1
    % mencari elemen terbesar suatu kolom
    [~, indexPivot] = max(abs(A(i:RowSize, i)));
    if indexPivot ~= 1
        tempA = A(i,:);
        tempB = B(i,:);
        tempL = L(i,:);
        A(i,:) = A(i+indexPivot-1,:);
        B(i,:) = B(i+indexPivot-1,:);
        L(i,:) = L(i+indexPivot-1,:);
        A(i+indexPivot-1,:) = tempA;
        B(i+indexPivot-1,:) = tempB;
        L(i+indexPivot-1,:) = tempL;
    end
    for j=i+1:RowSize
        m = A(j,i)/A(i,i);
        A(j,:)= A(j,:) - m*A(i,:);
        L(j,i)=m;
    end
end
L=L+eye(RowSize);
U=A;
[RowSize, ColumnSize] = size(A);
z=zeros(RowSize,1);
x=zeros(RowSize,1);
z(1)= B(1)/L(1,1);
for i=2:RowSize
    z(i) = (B(i)- L(i,1:RowSize-1)*z(1:RowSize-1))/L(i,i);
end
x(RowSize) = z(RowSize)/U(RowSize,RowSize);
for i=RowSize-1:-1:1
    x(i) = (z(i)- U(i,i+1:RowSize)*x(i+1:RowSize))/U(i,i);
end
toc
fprintf("\nHasil Dekomposisi LU:\n");
disp(x);