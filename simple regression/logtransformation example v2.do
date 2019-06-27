* A continuacion setear la ruta
cd "C:\Users\Ricardo Pasquini\Documents\My Dropbox\My courses\Econometria MEU\stata codes and datasets\"

* la base fue preparada por la version 1 de este codigo
use calidad_log_example.dta, clear


* Vemos primero que concluiriamos de estimar la regression de manera naive

regress alquiler chabviv

* ahora vemos el posible problema
graph twoway (scatter alquiler chabviv) (lfit alquiler chabviv)

predict residuos, resid
graph twoway (histogram residuos)
graph twoway (histogram residuos) if residuos<4000

* para arreglarlo tendría que tomar logaritmo:

gen logdelalquiler=ln(alquiler)
regress logdelalquiler chabviv


*Uso el mismo modelo para presentar un ajuste al cuadrado
gen chabvivcuad=chabviv*chabviv
regress alquiler chabviv chabvivcuad

* RAmsey Reset Test> Vuelvo al ejemplo incial para ver el test de forma funcional de Ramsey

regress alquiler chabviv

/*la hipotesis nula del test es que NO hay variable omitidas
 usando el comando estat, la sintaxis:
 estat ovtest [, rhs]
 donde la version por default incluye potencias de los fitted values de y como variables explicativas adicionales, la opcion rhs tambien 
 añade potencias de las variables explicativas.

 */
 
estat ovtest
estat ovtest, rhs

