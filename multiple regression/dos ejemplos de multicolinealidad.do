*2 ejemplos de nmulticolinealidad
use "C:\Users\Ricardo Pasquini\Dropbox\MEU 2015\stata codes and datasets\calidad.dta", clear
drop if chabviv>8
*modelo inicial, relacion lineal con chabviv
regress valalq  chabviv 
twoway (scatter valalq  chabviv ) (lfit valalq  chabviv )

*modelo propuesto, relacion nolineal con chabviv
gen chabviv2=chabviv^2
regress valalq  chabviv chabviv2
*notar que coef de chabviv no es 

correl chabviv chabviv2

*Posibles soluciones
tab barrio, gen(barrio)
*posible solucion: aumentar explicativas que reduzcan el error
regress valalq  chabviv chabviv2 barrio1 barrio2 barrio4 barrio5 barrio6 
*chabviv es nuevamente significativa
*los errores estandares disminuyeron
*no sabemos si chabviv2 es significativa

*posible solucion, otro tipo de transformacion
gen logchabviv=log(chabviv)

regress valalq logchabviv barrio1 barrio2 barrio4 barrio5 barrio6 
*lo comparo contra la especificacion lineal...
regress valalq chabviv barrio1 barrio2 barrio4 barrio5 barrio6 



*Ejemplo 2: Calidad educativa
clear all
import delimited "C:\Users\Ricardo Pasquini\Dropbox\MEU 2015\stata codes and datasets\establecimientos educativos\estadistica-educativa.csv"
*iecep "Índice de Equidad y Calidad de la Educación Porteña"
regress tasa_repeticion_2012  one_alto_mat
regress tasa_repeticion_2012  one_alto_cs_nat
regress tasa_repeticion_2012  one_alto_cs_soc
regress tasa_repeticion_2012  one_alto_lengua
regress tasa_repeticion_2012 one_alto_cs_nat one_alto_cs_soc one_alto_lengua one_alto_mat

gen one_alto_prom=(one_alto_cs_nat + one_alto_cs_soc +one_alto_lengua +one_alto_mat)/4

regress tasa_repeticion_2012 one_alto_prom
