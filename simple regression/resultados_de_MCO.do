*Ejemplos numéricos para las 4 propiedades de MCO y Bondad de Ajuste
********************************************************************
* Cargo la base de calidad
*****************************
use "C:\Users\Ricardo Pasquini\Documents\My Dropbox\My courses\Econometria MEU\stata codes and datasets\calidad.dta", clear

*Para no tener inconsistencias voy a eliminar las observaciones que no voy a usar>
drop if valalq==. | chabviv==. 

* 1) Estimamos el modelo teorico valalq=alfa+beta*chabviv+u

regress valalq chabviv 

*2) Calculo Valores Ajustados a mano:
generate valalqsombrero=890.3321+89.33139*chabviv

*3) Calculo errores a mano:
generate error=valalqsombrero -valalq

*4) Resultado 1: Promedio de los errores es 0
sum error

*5) Resultado 2: Promedio de los Y es igual a los Yhats
sum valalq valalqsombrero

*6) Resultado 3: Suma de x*e es igual a 0
generate xe=chabviv*error
egen sumaxe=sum(xe) 
sum sumaxe
*7) Resultado 4: Suma de ysombrero*e es igual a 0
generate valalqsombreroxerror=valalqsombrero*error
egen suma_valalqsombreroxerror=sum(valalqsombreroxerror) 
sum suma_valalqsombreroxerror


*Graficamos

graph twoway (scatter valalq chabviv) ///
             (scatter valalqsombrero chabviv)

/*
predict pricehat, xb
sum price pricehat
