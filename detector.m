clear all
clc

load fisier_bonsai1
imag=imread('b4.jpg');
img=rgb2gray(imag);
% img=img(:,147:710);
figure()
[n m]=size(img);
II=integralImage(img);
nr_features=30000;
XX1=[];
XX2=[];
XX3=[];
XX4=[];
XX5=[];
XX1=haar_1(n,m,II,rnd1);
XX2=haar_2(n,m,II,rnd2);
XX3=haar_3(n,m,II,rnd3);
XX4=haar_4(n,m,II,rnd4);
XX5=haar_5(n,m,II,rnd5);
incredere1=zeros(1,length(XX1));
incredere2=zeros(1,length(XX2));
incredere3=zeros(1,length(XX3));
incredere4=zeros(1,length(XX4));
incredere5=zeros(1,length(XX5));
for i=1:length(min1)
    for j=1:length(XX1)
        if XX1(j)>= min1(i) && XX1(j)<=max1(i)
            incredere1(j)=incredere1(j)+abs(W1(j));
        end
        if XX2(j)>= min2(i) && XX2(j)<=max2(i)
            incredere2(j)=incredere2(j)+abs(W2(j));
        end
        if XX3(j)>= min3(i) && XX3(j)<=max3(i)
            incredere3(j)=incredere3(j)+abs(W3(j));
        end
        if XX4(j)>= min4(i) && XX4(j)<=max4(i)
            incredere4(j)=incredere4(j)+abs(W4(j));
        end
        if XX5(j)>= min5(i) && XX5(j)<=max5(i)
            incredere5(j)=incredere5(j)+abs(W5(j));
        end
    end
end


incredere=[ incredere1 incredere2 incredere3 incredere4 incredere5];
% qwq=incredere
sinc=sum(incredere);
W11=mat_poz(W1);
W21=mat_poz(W2);
W31=mat_poz(W3);
W41=mat_poz(W4);
W51=mat_poz(W5);
WW=W11+W21+W31+W41+W51;
incredereX=100*sinc/(length(min1)*sum(WW));
incredere=incredere/incredereX;
% max(incredere2)
% max(incredere3)
% max(incredere4)
% max(incredere5)
% pause

%%



maxi=max(incredere);
% pozitie=find (incredere == maxi);
C=[];
pozitie=find (incredere >=maxi-0.01*maxi);
for i=1:length(pozitie)
    if fix(pozitie (i)/nr_features) == 0 
        Ci=rnd1(pozitie(i),:);
        C=[C;Ci];
    end
    if fix(pozitie (i)/nr_features) == 1
        Ci=rnd2(pozitie(i)-nr_features,:);
        C=[C;Ci];
    end
    if fix(pozitie (i)/nr_features) == 2 
        Ci=rnd3(pozitie(i)-2*nr_features,:);
        C=[C;Ci];
    end
    if fix(pozitie (i)/nr_features) == 3
        Ci=rnd4(pozitie(i)-3*nr_features,:);
        C=[C;Ci];
    end
    if fix(pozitie (i)/nr_features) == 4
        Ci=rnd5(pozitie(i)-4*nr_features,:);
        C=[C;Ci];
    end
end
cx=C(:,1)*0.745+0.11;
cy=C(:,2)*0.775+0.175;
p1=30/n;
p2=20/m;
f=figure;
hold on
imshow(imag)
for i=1:size(C,1)
    if cy(i)+p2 < 1 & cx(i)+p1 <1
%     annotation(f,'rectangle',[cy(i)+p2,cx(i), cy(i), cx(i)+p1])
      annotation(f,'rectangle',[cx(i), cy(i),0.1,0.1])
    
    end
end
    