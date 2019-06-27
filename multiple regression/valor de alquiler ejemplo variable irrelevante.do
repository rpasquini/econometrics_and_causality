*ejemplo de inclusion de variable irrelavante en la data de calidad
use "C:\Users\Ricardo Pasquini\Dropbox\MEU 2015\stata codes and datasets\calidad.dta", clear
* Voy a estimar un modelo del valor de alquiler donde incluyo a las dummys de barrio como variables explicativas
*genero las variables
tab barrio, gen(barrio)
* Voy a dejar a palermo afuera
regress valalq barrio1 barrio2 barrio4 barrio5 barrio6 

*Que pasa ahora si incluyo una variable irrelevante?
* Es la edad un variable que explica el valor de alquiler?
* Voy aque está relacionada con las variables dummy pero no explica el valor de alquiler?
regress valalq barrio1 barrio2 barrio4 barrio5 barrio6 edad
*La inclusion de edad no genera tiene un efecto sobre el alquiler, pero su estimacion "ensucia" los otros efectos. 
* Podemos ver que todas las variables aumentaron sus errores estándares

