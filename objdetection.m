clc
clear all
% im=imread('Untitled.png');
% [n,m]=size(img)
n=300;
m=200;
seed=round(n*m/4);
rng('default');
rnd=rand(seed,2);
pozFolder = 'D:\Objrec2\101_ObjectCategories\airplanes\';
negFolder = 'D:\Objrec2\101_ObjectCategories\hedgehog\';
X1=[];
nr_poz=100;
nr_neg=50;
for i=1:nr_poz
    image='image_';
    k=num2str(i,'%04.f');
    imadr=[pozFolder,image,k '.jpg'];
    im=imread(imadr);
    img=rgb2gray(im);
    img=imresize(img,[n,m]);
    II=integralImage(img);
    X=haar_3(n,m,II,rnd);
    X1=[X1;X];
end
%% negative
for i=1:nr_neg
    image='image_';
    k=num2str(i,'%04.f');
    imadr=[negFolder,image,k '.jpg'];
    im=imread(imadr);
    img=rgb2gray(im);
    img=imresize(img,[n,m]);
    II=integralImage(img);
    X=haar_1(n,m,II,rnd);
    X1=[X1;X];
end
%%
val=0;
mediepoz=mean(X1(1:nr_poz,1));
medieneg=mean(X1(nr_poz+1:nr_poz+nr_neg,1));
medie=(mediepoz+medieneg)/2;
for i=1:nr_poz
    if X1(i,1)>medie
       val=val-1;
    else if X1(i,1)< medie
          val=val+1;
        end
    end
end
for i=nr_poz+1:nr_poz+nr_neg
    if X1(i,1)>medie
       val=val+1;
    else if X1(i,1)< medie
          val=val-1;
        end
    end
end
%%
% N=histogram(X1(1:nr_poz,1),30, 'Facecolor', [1 0 1])
% hold on
% N=histogram(X1(nr_poz+1:nr_poz+nr_neg,1),30, 'Facecolor', [0 1 0])
% X3=haar_3(n,m,II,rnd);