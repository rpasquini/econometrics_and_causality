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

*Obtenemos los coeficientes de MCO
regress u_s_m2 fot


* predicciones a mano
gen usm2hat1=327.45*fot+795.05

* predicciones
predict usm2hat2

*residuos
predict erroreshat, residuals

*histograma de residuos
hist erroreshat
