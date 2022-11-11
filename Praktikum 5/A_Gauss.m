% M0521009 Alfiki Diastama Afan Firdaus

A = [2, -1, 10, 0; 0, 3, -1, 8; 10, -1, 2, 0; -1, 11, -1, 3];
B = [-11; -11; 6; 25];

tic
[SizeRow,SizeColumn] = size(A);
for i=1:SizeRow-1
    % mencari elemen terbesar suatu kolom
    [pivot, indexPivot] = max(abs(A(i:SizeRow, i)));
    if indexPivot ~= 1
        tempA = A(i,:);
        tempB = B(i,:);
    
        A(i,:) = A(i+indexPivot-1,:);
        B(i,:) = B(i+indexPivot-1,:);
    
        A(i+indexPivot-1,:) = tempA;
        B(i+indexPivot-1,:) = tempB;
    end
    for j=i+1:SizeRow
        m = A(j,i)/A(i,i);
    
        A(j,:)= A(j,:) - m*A(i,:);
        B(j,:)= B(j,:) - m*B(i,:);
    end
end
x(SizeRow,:) = B(SizeRow,:)/A(SizeRow, SizeColumn);
for k = SizeRow-1:-1:1
    x(k,:) = (B(k,:)- A(k,k+1:SizeRow)*x(k+1:SizeRow,:))/A(k,k);
end
toc
fprintf("\nHasil Eliminasi Gauss:\n");
disp(x);