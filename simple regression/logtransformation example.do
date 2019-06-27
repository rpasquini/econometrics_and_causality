cd "C:\Users\Ricardo Pasquini\Dropbox\MEU 2015\stata codes and datasets\"

use calidad.dta, clear

/*Genero una variable dependiente que va a tener una relación no lineal, para la aplicacion de un modelo log-lineal*/

keep if chabviv<=10
gen uno=0.5*chabviv+5 
gen noise=rnormal(0,0.4)
gen dos=uno+noise
gen tres=exp(dos)
gen alquiler=round(tres)
drop if alquiler>10000
*drop if alquiler<300

graph twoway (scatter alquiler chabviv)

drop valalq propalq uno dos tres noise
save calidad_log_example.dta, replace


/*Analisis*/

* Primero estimo el modelo y chequeo residuos

regress alquiler chabviv
graph twoway (scatter alquiler chabviv) (lfit alquiler chabviv)

predict residuos, resid

/*Chequeando normalidad*/
capture graph drop histograma caja simetrico normprob
histogram residuos, normal name(histograma) 
graph box residuos,  name(caja) 
symplot residuos ,  name(simetrico)
pnorm residuos,  name(normprob)
graph drop histograma caja simetrico normprob
ladder alquiler

* para arreglarlo tendría que tomar logaritmo:
gen logdelalquiler=ln(alquiler)
regress logdelalquiler chabviv


*Uso el mismo modelo para presentar un ajuste al cuadrado
gen chabvivcuad=chabviv*chabviv
regress alquiler chabviv chabvivcuad
