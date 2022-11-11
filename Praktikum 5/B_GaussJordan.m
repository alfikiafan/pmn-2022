% M0521009 Alfiki Diastama Afan Firdaus

A = [6, -1, -1, 0, 0; -1, 5, -1, -1, 0; -1, -1, 4, -1, -1; 0, 0, 1, 4, -1; 0, 1, -1, 1, 4];
B = [-1; 2; 6; 2; -1];
tic
[SizeRow,~] = size(A);
for i=1:SizeRow-1
    % mencari elemen terbesar suatu kolom
    [~, indexPivot] = max(abs(A(i:SizeRow, i)));
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
    
    for k=SizeRow:-1:1
        for j=k-1:-1:1
           m = A(j,k)/A(k,k);
        
           A(j,:)= A(j,:) - m*A(k,:);
           B(j,:)= B(j,:) - m*B(k,:);
        end
    end
    
    for k = 1:SizeRow
        x(k,:) = B(k,:)/A(k,k);
    end
end
toc
fprintf("\nHasil Eliminasi Gauss Jordan:\n");
disp(x);
