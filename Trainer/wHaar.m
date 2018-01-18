function W=wHaar(X)
%wHaar1(X1)
%X - vector of features for each image
%W - vector of weights for each feature
global nr_poz;
global nr_neg;

W=zeros(1,length(X));
mediepoz=mean(X(1:nr_poz,:));
medieneg=mean(X(nr_poz+1:nr_poz+nr_neg,:));
medie=(mediepoz+medieneg)/2;

for j=1:length(X)
    for i=1:nr_poz
        if X(i,j)>medie(j)
            W(j)=W(j)-1;
        else if X(i,j)< medie(j)
                W(j)=W(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X(i,j)>medie(j)
            W(j)=W(j)+1;
        else if X(i,j)< medie(j)
                W(j)=W(j)-1;
            end
        end
    end
end