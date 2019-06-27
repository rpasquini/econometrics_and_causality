* Econometria MEU UTDT
* Profesor Ricardo Pasquini
* *****************************

* Puedo hacer comentarios en el do-file siempre que empiece la linea con un asterisco *

* Comienzo por limpiar la base y limpiar la pantalla de resultados
clear all
cls 

* Cargo la data. En este caso la levanto de un CSV. 
import delimited "C:\Users\Richard\Dropbox\MEU Econometria\stata codes and datasets\DATA  Terrenos Deptos etc\precio-de-terrenos-2017-rar\precio-de-terrenos-2017.csv", delimiter(";") clear

* transformamos las variables fot y usm2 a numericas. Especificamos la opcion dpcomma para que reconozca que el decimal en este caso es la coma
destring fot, replace dpcomma
destring u_s_m2, replace dpcomma

* Eliminamos de la data todas las observaciones que tienen fot =0
drop if fot==0

* Analizamos las distribuciones de las dos variables por separado mirando sus histogramas 
* con la opcion name le voy a dar un nombre al grafico
hist u_s_m2 , name("valorm2")
hist fot, name("fot")

*Graficamos la relacion en un scatter
scatter u_s_m2 fot


*Obtenemos los coeficientes de MCO
regress u_s_m2 fot

*Computamos la prediccion a mano
gen predusm2=795.0564 +327.4506*fot


*Graficamos la relacion nuevamente y agregamos la prediccion superponiendo dos graficos con twoway 
twoway (scatter u_s_m2 fot) (lfit predusm2 fot) , name("scatterypred")

*Computo los residuos automaticamente con el comando predict y opcion residuals
predict residuos, residuals

*Ahora veo su distribucion
hist residuos

 