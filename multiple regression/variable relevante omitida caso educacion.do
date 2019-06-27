/*Ejemplo Variable Omitida
***************************** 
Ejemplo: Educación
Ricardo Pasquini
*/

import delimited "C:\Users\Ricardo Pasquini\Dropbox\MEU 2015\stata codes and datasets\establecimientos educativos\estadistica-educativa.csv", clear 

*generamos las dummys
tabulate tipo_gestion, gen(dgestion)

*estimamos el modelo verdadero
regress iecep dgestion1 nivel_educ_madre

*analizamos el efecto de omitir el nivel educativo de la madre
regress iecep dgestion1 

*Chequeamos que efectivamente hay una correlacion entre estas variables
correl dgestion1 nivel_educ_madre

*Por ultimo comparemos el efecto en el R2
regress iecep dgestion1 nivel_educ_madre
regress iecep dgestion1 
regress iecep nivel_educ_madre
