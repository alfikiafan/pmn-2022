% Alfiki Diastama Afan Firdaus (M0521009)

% Looping for kondisi 1
for i = 1:8
   if (mod(i,2) == 0)
     disp(i)
   end
end
fprintf('Selesai looping kondisi 1\n')

% Looping for kondisi 2
for j = 3:3:14
  q = j;
  disp(q)
end

% Looping while
i = 10;
while(i < 14)
   fprintf('Nilai i: %d\n', i);
   i = i + 1;
end