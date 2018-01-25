clear all
clc

path = cd;
cd ..\..;
addpath(genpath('ObjectDet'));
cd(path);

% load ../fisier_test
mypool = gcp('nocreate'); % If no pool, do not create new one.
if isempty(mypool)
    mypool = parpool();
end
load features.mat
% imag = imread('d:\DSUsers\uidg6179\01_Miscellaneous\10_Matlab\objrec\test_bonsai.jpg');
imag=imread('D:\Objrec\Test_img\a3.jpg');
%imag=imread('00001_930831_fa_a.ppm');
%imag=imread('ReadandDisplayImageExample_01.png');

img=rgb2gray(imag);
% [n, m]=size(img);
n=320;
m=240;
img=imresize(img,[n,m]);

imshow(img);
% [n, m]=size(img);
II=integralImage(img);
% XX1=[];
% XX2=[];
% XX3=[];
% XX4=[];
% XX5=[];
% XX1=haar_1(n,m,II,rnd1);
% XX2=haar_2(n,m,II,rnd2);
% XX3=haar_3(n,m,II,rnd3);
% XX4=haar_4(n,m,II,rnd4);
% XX5=haar_5(n,m,II,rnd5);
% incredere = 0;
XX=[];
parfor i=1:length(featureStrong)
    if featureStrong(i).haarFeature.type == 'X1'
        XX(i)=haar_11(n,m,II,featureStrong(i).haarFeature.value);
    end
    if featureStrong(i).haarFeature.type == 'X2'
        XX(i)=haar_21(n,m,II,featureStrong(i).haarFeature.value);
    end
    if featureStrong(i).haarFeature.type == 'X3'
        XX(i)=haar_31(n,m,II,featureStrong(i).haarFeature.value);
    end
    if featureStrong(i).haarFeature.type == 'X4'
        XX(i)=haar_41(n,m,II,featureStrong(i).haarFeature.value);
    end
    if featureStrong(i).haarFeature.type == 'X5'
        XX(i)=haar_51(n,m,II,featureStrong(i).haarFeature.value);
    end
    
end
s_alfah=0;
s_alfa=0;
parfor i=1:length(XX)
    if XX(i)<featureStrong(i).threshold
        s_alfah=s_alfah+featureStrong(i).weight;
    end
    s_alfa=featureStrong(i).weight+s_alfa;
end

if s_alfah > 0.5*s_alfa
    fprintf('Evrika!\n');
end

s_alfah
s_alfa/2
% s_test = sum(abs(W1))+ sum(abs(W2)) + sum(abs(W3)) + sum(abs(W4)) + sum(abs(W5));
% 
% incredere
% incredere_perc = 100* incredere/s_test
