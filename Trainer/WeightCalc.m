%calculates all the weights of the features from each feature vector
global nr_im_total;

W1=wHaar(X1);
W2=wHaar(X2);
W3=wHaar(X3);
W4=wHaar(X4);
W5=wHaar(X5);
%normalizing weights
W1 = W1./nr_im_total;
W2 = W2./nr_im_total;
W3 = W3./nr_im_total;
W4 = W4./nr_im_total;
W5 = W5./nr_im_total;