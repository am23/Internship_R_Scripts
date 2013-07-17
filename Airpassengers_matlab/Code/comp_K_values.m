clear all;

%this code shows the varying predictions on changing the K values. 
% Method is the K-step ahead prediction method.

load('C:/Users/aanchal.maheshwari/Desktop/wrkk/Share-Aanchal/Matlab/Data/abc.txt');

%converting to iddata
data=iddata(abc,[],1);


na= 1;
nc=1;

%fiiting the model and predicting for K=2
sys = armax(data(1:70),[na nc]);
K=2;
p = predict(sys,data,K);
plot(data(1:144),p(70:144),'c-+');
hold on

%fiiting the model and predicting for K=4
K=4;
p = predict(sys,data,K); 
hold on
plot(p(70:144),'ro-');

%fiiting the model and predicting for K=6
K=6;
p = predict(sys,data,K);
hold on;
plot(p(70:144),'k+-');
hold on


%fiiting the model and predicting for K=12
K=12;
plot(p(70:144),'y+-');
hold off;