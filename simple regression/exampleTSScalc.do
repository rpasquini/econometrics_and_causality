* Econometria
* Prof Ricardo Pasquini
* Ejemplo Numerico> Calculo el TSS
**************************************
 clear all

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
 

*dropeo las observaciones que no use en la regresion para que no molesten despues
keep if e(sample)

*Calculating TSS
 sum valalq 
 egen valalqbar=mean(valalq) 
 gen valalqresidualsquare=(valalq-valalqbar)^2  
 egen long tss=sum(valalqresidualsquare)  
 sum tss

 display as text "TSS for this model is " as result r(mean)
