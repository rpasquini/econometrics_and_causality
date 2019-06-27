/* author: Ricardo Pasquini, 
rpasquini@austral.edu.ar
rpasquini@utdt.edu
*/

/* EXAMPLE 2.A: Confounder plus collider example

X<-A->B
B<-C->Y
  
We assume we want to identify the effect of X on Y when in reality doesn't exist

*/


clear all
range obs 1 1000 1000

* 

generate A=int((100+1)*runiform())

generate C=int((100+1)*runiform())

generate X=int((100+1)*runiform())-2*A
 
generate Y=int((100+1)*runiform())+3*C

generate B=int((100+1)*runiform())+4*A-2*C
 

summarize 

*No effect of X on Y
twoway (scatter Y X) 

regress Y X

*Controlling for A opens a new channel, net effect changes.
regress Y X B



