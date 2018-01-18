function [X1,X2,X3,X4,X5] = featureCalc(n,m,imgSetVector)
%n - vertical resolution of image
%m - vertical resolution of image
%imgSetVector - image set vector returned by imageSet function
global rnd1 rnd2 rnd3 rnd4 rnd5;

X1_local=[];
X2_local=[];
X3_local=[];
X4_local=[];
X5_local=[];

for i=1:length(imgSetVector)
    
    %Print percentage of dataset complete
    percentage_load = 100 * i/length(imgSetVector)
    imgVectorLocation = imgSetVector(i).ImageLocation;
    
    parfor j = 1:imgSetVector(i).Count
        im = imread(char(imgVectorLocation(j)));
        im = rgb2gray(im);
        %workaround for error
        %[n,m] = size(im);
        img=imresize(im,[n,m]);
        %
        %Compute integral Image
        II=integralImage(img);
        %Compute values from Haar Features
        X=haar_1(n,m,II,rnd1);
        X1_local=[X1_local;X];
        X=haar_2(n,m,II,rnd2);
        X2_local=[X2_local;X];
        X=haar_3(n,m,II,rnd3);
        X3_local=[X3_local;X];
        X=haar_4(n,m,II,rnd4);
        X4_local=[X4_local;X];
        X=haar_5(n,m,II,rnd5);
        X5_local=[X5_local;X];
    end
end

X1 = X1_local;
X2 = X2_local;
X3 = X3_local;
X4 = X4_local;
X5 = X5_local;