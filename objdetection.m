clc
clear all
% im=imread('Untitled.png');
% [n,m]=size(img)
n=300;
m=200;
seed=round(n*m/2);
rnd1=rand(seed,4);
rnd2=rand(seed,4);
rnd3=rand(seed,4);
rnd4=rand(seed,4);
rnd5=rand(seed,4);

pozFolder = 'D:\Objrec2\101_ObjectCategories\bonsai\';
negFolder = 'D:\Objrec2\101_ObjectCategories\other\';
X1=[];
X2=[];
X3=[];
X4=[];
X5=[];
nr_poz=100;
nr_neg=200;
% N_new=[15,20,5]
% M_new=[10,5,20]
%%
% haar
for i=1:nr_poz
    image='image_';
    k=num2str(i,'%04.f');
    imadr=[pozFolder,image,k '.jpg'];
    im=imread(imadr);
    img=rgb2gray(im);
    img=imresize(img,[n,m]);
    II=integralImage(img);
    X=haar_1(n,m,II,rnd1);
    X1=[X1;X];
    X=haar_2(n,m,II,rnd2);
    X2=[X2;X];
    X=haar_3(n,m,II,rnd3);
    X3=[X3;X];
    X=haar_4(n,m,II,rnd4);
    X4=[X4;X];
    X=haar_5(n,m,II,rnd5);
    X5=[X5;X];

end
% negative
for i=1:nr_neg
    image='image_';
    k=num2str(i,'%04.f');
    imadr=[negFolder,image,k '.jpg'];
    im=imread(imadr);
    img=rgb2gray(im);
    img=imresize(img,[n,m]);
    II=integralImage(img);
    X=haar_1(n,m,II,rnd1);
    X1=[X1;X];
    X=haar_2(n,m,II,rnd2);
    X2=[X2;X];
    X=haar_3(n,m,II,rnd3);
    X3=[X3;X];
    X=haar_4(n,m,II,rnd4);
    X4=[X4;X];
    X=haar_5(n,m,II,rnd5);
    X5=[X5;X];

end
% X2=[X2(1,:) X2(2,:) X2(3,:)]
%% haar1
W1=zeros(1,length(X1));
mediepoz=mean(X1(1:nr_poz,1));
medieneg=mean(X1(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;

for j=1:length(X1)
    for i=1:nr_poz
        if X1(i,j)>medie
            W1(j)=W1(j)-1;
        else if X1(i,j)< medie
                W1(j)=W1(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X1(i,j)>medie
            W1(j)=W1(j)+1;
        else if X1(i,j)< medie
                W1(j)=W1(j)-1;
            end
        end
    end
end
%% haar2
W2=zeros(1,length(X1));
mediepoz=mean(X2(1:nr_poz,1));
medieneg=mean(X2(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;

for j=1:length(X1)
    for i=1:nr_poz
        if X2(i,j)>medie
            W2(j)=W2(j)-1;
        else if X2(i,j)< medie
                W2(j)=W2(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X2(i,j)>medie
            W2(j)=W2(j)+1;
        else if X2(i,j)< medie
                W2(j)=W2(j)-1;
            end
        end
    end
end
%% haar3
W3=zeros(1,length(X1));
mediepoz=mean(X3(1:nr_poz,1));
medieneg=mean(X3(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;

for j=1:length(X1)
    for i=1:nr_poz
        if X3(i,j)>medie
            W3(j)=W3(j)-1;
        else if X3(i,j)< medie
                W3(j)=W3(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X3(i,j)>medie
            W3(j)=W3(j)+1;
        else if X3(i,j)< medie
                W3(j)=W3(j)-1;
            end
        end
    end
end
%% haar4
W4=zeros(1,length(X4));
mediepoz=mean(X4(1:nr_poz,1));
medieneg=mean(X4(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;

for j=1:length(X4)
    for i=1:nr_poz
        if X4(i,j)>medie
            W4(j)=W4(j)-1;
        else if X4(i,j)< medie
                W4(j)=W4(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X4(i,j)>medie
            W4(j)=W4(j)+1;
        else if X4(i,j)< medie
                W4(j)=W4(j)-1;
            end
        end
    end
end
%% haar5
W5=zeros(1,length(X5));
mediepoz=mean(X5(1:nr_poz,1));
medieneg=mean(X5(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;

for j=1:length(X5)
    for i=1:nr_poz
        if X5(i,j)>medie
            W5(j)=W5(j)-1;
        else if X5(i,j)< medie
                W5(j)=W5(j)+1;
            end
        end
    end
    for i=nr_poz+1:nr_poz+nr_neg
        if X5(i,j)>medie
            W5(j)=W5(j)+1;
        else if X5(i,j)< medie
                W5(j)=W5(j)-1;
            end
        end
    end
end
%%
% minime
for i=1:nr_poz
    min1(i)=min(X1(1:nr_poz,i));
end
for i=1:nr_poz
    min2(i)=min(X2(1:nr_poz,i));
end
for i=1:nr_poz
    min3(i)=min(X3(1:nr_poz,i));
end
for i=1:nr_poz
    min4(i)=min(X4(1:nr_poz,i));
end
for i=1:nr_poz
    min5(i)=min(X5(1:nr_poz,i));
end
%%
% maxime
for i=1:nr_poz
    max1(i)=max(X1(1:nr_poz,i));
end
for i=1:nr_poz
    max2(i)=max(X2(1:nr_poz,i));
end
for i=1:nr_poz
    max3(i)=max(X3(1:nr_poz,i));
end
for i=1:nr_poz
    max4(i)=max(X4(1:nr_poz,i));
end
for i=1:nr_poz
    max5(i)=max(X5(1:nr_poz,i));
end
%%
% exportfile=[W1;W2;W3;W4;W5];
% exportfile=[exportfile;zeros(length(rnd),length(exportfile))];
% exportfile(6:length(exportfile),1:2)=rnd(:,1:2);
% exportfile(6:length(exportfile),2)=rnd(:,2);
% N=histogram(X1(1:nr_poz,1),30, 'Facecolor', [1 0 1])
% hold on
% N=histogram(X1(nr_poz+1:nr_poz+nr_neg,1),30, 'Facecolor', [0 1 0])
% X3=haar_3(n,m,II,rnd);
save fisier_bonsai1