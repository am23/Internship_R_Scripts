%This is used to predict the airpassengers using ARMAX in matlab

load('C:/Users/aanchal.maheshwari/Desktop/wrkk/Share-Aanchal/Matlab/Data/abc.txt');

%convert to iddata format
data=iddata(abc,[],1);

%intialising fiiting parameters
na= 1;
nc=1;

%fitting the armax model from 1 to 50
sys = armax(data(1:50),[na nc]);
K=1;

%predicting for K=1 and from 50 to 144
p = predict(sys,data,K);

%plot 
plot(data(1:144),p(50:144),'c-+');

%fitting the armax model from 1 to 70
sys = armax(data(1:70),[na nc]);
K=1;

%predicting for K=1 and from 70 to 144
p = predict(sys,data,K); 


hold on

%plotting
plot(p(70:144),'ro-');

%predicting from 130 to 144
sys = armax(data(1:130),[na nc]);
p = predict(sys,data,K);

%plotting
hold on;
plot(p(130:144),'k+-');
hold off;