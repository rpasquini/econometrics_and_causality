* Econometria
* Prof Ricardo Pasquini

*Ejemplos numéricos para primera 2 propiedades de MCO y Bondad de Ajuste
********************************************************************
* limpio la memoria
clear all
* Cargo la base de calidad
*****************************

* seteo la ruta de la carpeta de trabajo
cd "C:\Users\Ricardo Pasquini\Documents\My Dropbox\My courses\Econometria MEU\stata codes and datasets\"

use "calidad.dta", clear

*Para evitar inconsistencias voy a eliminar de la base las observaciones que no voy a usar>
*drop if valalq==. 

* 1) Estimamos el modelo teorico valalq=alfa+beta*chabviv+u

regress valalq chabviv 

*2) Calculo Valores Ajustados a mano:
generate valalqsombrero=890.3321+89.33139*chabviv if e(sample)

*3) Calculo errores a mano:
generate residuos=valalqsombrero-valalq 

*4) Resultado 1: Mostramos que el promedio de los errores es 0. 
sum residuos if e(sample)
*Notar que los resultados son aproximadamente 0

*5) Resultado 2: Promedio de los Y es igual a los Yhats
sum valalq valalqsombrero if e(sample)
*Notar que los resultados son aproximadamente iguales
