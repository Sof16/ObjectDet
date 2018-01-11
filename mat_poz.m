function A=mat_poz(B)
[n m]=size (B);
for i=1:n
    for j=1:m
        if B(i,j)< 0
            B(i,j)=(-1)*B(i,j);
        end
    end
end
A=B;
end