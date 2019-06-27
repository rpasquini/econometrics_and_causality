* Example: We want to show that TSS=ESS+RSS

 clear all
 sysuse auto
 
 regress price weight
 
 *Calculating TSS
 sum price
 egen ybar=mean(price)
 gen yresidualsquare=(price-ybar)^2
 egen tss=sum(yresidualsquare)
 tab tss
 sum tss
 
 *Drawing the average value of y
 *graph twoway (scatter price weight)  ///
 *(scatter ybar weight) 

 regress price weight
 predict yhat
 
 *Calculating Explained Sum Squares (ESS)
 gen yhatresidualsquare=(yhat-ybar)^2
 egen ess=sum(yhatresidualsquare)
 
 *Calculating Residual Sum Squares (RSS)
gen e=price-yhat
gen esquare=e^2
egen rss=sum(esquare)

sum tss ess rss 
 
gen R2=ess/tss

sum R2
 *in the future we will use mata for this calculation
 
