
%initialize variables
init;

%compute features from dataset
%pozitive
message = 'pozitive'
[X1_poz,X2_poz,X3_poz,X4_poz,X5_poz] = featureCalc(n,m,imgSetVectorPoz);
%negative
message = 'negative'
[X1_neg,X2_neg,X3_neg,X4_neg,X5_neg] = featureCalc(n,m,imgSetVectorNeg);

X1 = [X1_poz;X1_neg];
X2 = [X2_poz;X2_neg];
X3 = [X3_poz;X3_neg];
X4 = [X4_poz;X4_neg];
X5 = [X5_poz;X5_neg];
%calculating the feature weights
WeightCalc;

%calculating ranges of feature values
%minimums
s_minimum;

%maximums
s_maximum;

message_training = 'finished training';
message_training

save fisier_test