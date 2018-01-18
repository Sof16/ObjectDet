clear all
clc

path = cd;
cd ..\..;
addpath(genpath('ObjectDet'));
cd(path);

load ../fisier_test
imag = imread('d:\DSUsers\uidg6179\01_Miscellaneous\10_Matlab\objrec\test_bonsai.jpg');
%imag=imread('00001_930831_fa_a.ppm');
%imag=imread('ReadandDisplayImageExample_01.png');
img=rgb2gray(imag);
img=imresize(img,[n,m]);

imshow(img);
%[n, m]=size(img);
II=integralImage(img);
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
incredere = 0;


for j=1:length(XX1)
    if XX1(j) >= min1(j) && XX1(j) <= max1(j)
        if W1(j) > 0
            incredere = incredere + W1(j);
            x = 1;
        else
            incredere = incredere - W1(j);
            x = 0;
        end
    end
    if XX2(j) >= min2(j) && XX2(j) <= max2(j)
        if W2(j) > 0
            incredere = incredere + W2(j);
        else
            incredere = incredere - W2(j);
        end
    end
    if XX3(j) >= min3(j) && XX3(j) <= max3(j)
        if W3(j) > 0
            incredere = incredere + W3(j);
        else
            incredere = incredere - W3(j);
        end
    end
    if XX4(j) >= min4(j) && XX4(j) <= max4(j)
        if W4(j) > 0
            incredere = incredere + W4(j);
        else
            incredere = incredere - W4(j);
        end
    end
    if XX5(j) >= min5(j) && XX5(j) <= max5(j)
        if W5(j) > 0
            incredere = incredere + W5(j);
        else
            incredere = incredere - W5(j);
        end
    end
end

s_test = sum(abs(W1))+ sum(abs(W2)) + sum(abs(W3)) + sum(abs(W4)) + sum(abs(W5));

incredere
incredere_perc = 100* incredere/s_test