 /* Example 1: Increasing the variability in the noise of the theoretical model leads 
to increase in the variability of the measured coefficient 
 */
 
 clear all
 sysuse auto
 gen u1=rnormal()*10
 *error con media 0 y desvio 1
 gen u2=rnormal()*200
 
 sum u1
 sum u2
 
 gen teoric_var1=10+0.25*weight+u1
 * We construct a variable that is linearly related with slope 0.25
 gen teoric_var2=10+0.25*weight+u2
 * 2nd case with same slope 0.25 but greater variability
 graph twoway scatter teoric_var1 weight
 graph twoway scatter teoric_var2 weight
 
 regress teoric_var1 weight
 regress teoric_var2 weight

/* Example B: If there is low variability in the explanatory variable X
 */
 
 *First generate a variable with a uniform distribution
  *uniforme 1-100
  gen X1=runiform()*100-50
  gen X2=runiform()*10-5
  sum X1
  sum X2
  
  gen teoric_var1b=10+0.25*X1+u1
  gen teoric_var2b=10+0.25*X2+u1
  
 graph twoway scatter teoric_var1b X1
 graph twoway scatter teoric_var2b X2
 
 regress teoric_var1b X1
 regress teoric_var2b X2
  
