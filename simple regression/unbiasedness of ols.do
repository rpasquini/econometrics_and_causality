/* In this example I produce a Monte Carlo Simulation in order to assess if the OLS estimates are unbiassed
We assume that the true model is

Y=10+5*X+u

We will generate random samples of this model and perform the parameter estimations using OLS

We use normal error ui~iid N(0,1)
In the first part of this code we show a graph including the real model, and OLS estimation
*/

clear all
*I need to define a range since I do not start without any dataset
range obs 1 1000 1000

* We will produce random numbers for X using a uniform distribution
generate X=int((100+1)*runiform()) in 1/30
generate trueY=2+5*X

*now add some noise to generate the real observations
generate u=rnormal(0,40) in 1/30
* Check u
summarize u, detail

generate Y=2+5*X+u
twoway (scatter Y X) (scatter trueY X, c(l) sort)


regress Y X
predict Yhat if e(sample)
twoway (scatter trueY X, c(l) sort) (scatter Y X) (scatter Yhat X, c(l) sort)

