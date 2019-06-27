/* author: Ricardo Pasquini, 
rpasquini@austral.edu.ar
rpasquini@utdt.edu
*/

/* EXAMPLE 1: Simple confounder bias example

X<-Z->Y

We assume we want to identify the effect of X on Y when in reality doesn't exist

*/

clear all
range obs 1 1000 1000

* 

generate Z=int((100+1)*runiform())

generate X=int((100+1)*runiform())-2*Z 

generate Y=int((100+1)*runiform())+3*Z



summarize 


twoway (scatter Y X) 


regress Y X

regress Y X Z


*predict Yhat if e(sample)
*twoway (scatter trueY X, c(l) sort) (scatter Y X) (scatter Yhat X, c(l) sort)
avplot X
