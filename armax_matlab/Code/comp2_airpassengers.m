% The file is for predicting value in airpassengers data
% loading the text file 

load('C:/Users/aanchal.maheshwari/Desktop/wrkk/Share-Aanchal/Matlab/Data/abc.txt');

% converting the matrix to iddata object
% iddata is Time- or frequency-domain data
% data = iddata(y,[],Ts) creates an iddata object for time-series data,
% containing a time-domain output signal y and an empty input signal [],
% respectively.Ts specifies the sampling interval of the experimental data.

data=iddata(abc,[],1);

% sys = armax(data,ORDERS)
% [na nb nc nk] define the polynomial orders of an ARMAX model
% ORDERS should be an integer matrix of the form [na nb nc nk], 
% where nb and nk are row vectors of lengths equal to
% the number of inputs, and na and nc are scalars. 
% For time series case, use ORDERS = [na nc]

na=1;
nc=1;
sys = armax(data(1:120),[na nc]);

% K-step ahead prediction
% yp = predict(sys,data,K) predicts the output of an identified model,
% predicting from 120 to 144
% sys, K steps ahead using input-output data history from data.
K=1;
p = predict(sys,data,K);
plot(data(1:120),p(100:120))

