*example changing measurement units

 clear all
 sysuse auto
 regress price weight
 graph twoway (scatter price weight)  ///
 (lfit  price weight) 
egen xbar=mean(weight)
gen demeanweight=weight-xbar

regress price weight
regress price demeanweight

graph twoway (scatter price demeanweight) ///
             (lfit price demeanweight)
