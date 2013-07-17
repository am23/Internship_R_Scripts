#neuralnet.R 
#this code uses the neuralnet function to train values for 'infert' dataset


#load the library neural net
library('neuralnet')


#calling the function neural net for dataset 'infert' and hidden nodes=2, output value will be case 
#input values are age,parity,induced,spontaneous.
nn <- neuralnet( case~age+parity+induced+spontaneous,data=infert, hidden=2, err.fct="ce",linear.output=FALSE)


#plot the neural network
plot(nn)
