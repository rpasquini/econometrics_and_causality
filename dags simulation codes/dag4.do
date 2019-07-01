/* author: Ricardo Pasquini, 
rpasquini@austral.edu.ar
rpasquini@utdt.edu
*/

/* DAG 4: M BIAS

X<-A->B
B->C
B<-D->E
E->Y

  We assume that there is no effect of X on E
  We assume we want to identify the effect of X on Y when in reality doesn't exist


*/


clear all
range obs 1 1000 1000

* 


generate A=int((100+1)*runiform())

generate D=int((100+1)*runiform())

generate B=int((100+1)*runiform())-2*A+D

generate X=int((100+1)*runiform())+3*A

generate E=int((100+1)*runiform())+2*D

generate C=int((100+1)*runiform())-3*B
 
generate Y=int((100+1)*runiform())+4*E

 

summarize 

*No effect of X on Y
twoway (scatter Y X) 

regress Y X

*Controlling for B opens a channel, bias appears:
regress Y X B

*Closing the backdoor path back by including A as control
regress Y X B A


