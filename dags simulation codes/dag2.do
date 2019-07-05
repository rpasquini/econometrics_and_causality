/* author: Ricardo Pasquini, 
rpasquini@austral.edu.ar
rpasquini@utdt.edu
*/

/* EXAMPLE 2.A: Confounder plus collider example

X<-B->Y  
B->A
X->A
  
We assume we want to identify the effect of X on Y when in reality doesn't exist

*/


clear all
range obs 1 1000 1000

* 

generate B=int((100+1)*runiform())

generate X=int((100+1)*runiform()) 

generate Y=int((100+1)*runiform())+3*B

generate A=int((100+1)*runiform())+4*X-2*B
 

summarize 


twoway (scatter Y X) 

regress Y X

regress Y X B

*Controlling for A opens a new channel, net effect changes.
regress Y X A


regress Y X A B


/* EXAMPLE 2.B: Confounder plus collider example. I remove the effect of B on X

The objetive here is to see that you don't need to do anything. 

If the collider is controlled for, it opens a new channel, and an effect appears.


B->Y  
B->A
X->A
  

*/


clear all
range obs 1 1000 1000

* 

generate B=int((100+1)*runiform())

generate X=int((100+1)*runiform())

generate Y=int((100+1)*runiform())+3*B

generate A=int((100+1)*runiform())+4*X-2*B
 

summarize 


twoway (scatter Y X) 

regress Y X

regress Y X B

*Controlling for A opens a new channel that previousl.

regress Y X A



