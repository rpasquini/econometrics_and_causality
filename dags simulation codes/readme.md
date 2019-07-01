# Dag-based Regression Simulations

In these Stata do-files, I numerically simulate a number of causal-relationships, as graphically represented in the respective DAGs (Directed Acyclical Graphs).  The aim of these simulations is to show how biases arise when not properly de-confounding the effects, in a regression specification. These games have been extracted from [Pearl and Mackenzie (2018)](https://www.amazon.com/Book-Why-Science-Cause-Effect/dp/046509760X). 
I simulate non-zero linear effects in all causal relationships in the graph, with the exception of the causal effect of interest X->Y which is always assumed to not exist (to be zero). In other words, if de-confounding is not implemented approapiately, the estimated coefficient will most likely show non-zero effects. 

Pearl, J., & Mackenzie, D. (2018). The book of why: the new science of cause and effect. Basic Books.