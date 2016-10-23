import atraccion.*
import estadoDeAnimo.*
class Trabajo{
	var plataTrabajo
	var unidadesFelicidad
	var tipoTrabajo
	constructor(plata, felicidad, tipo){
		plataTrabajo = plata
		unidadesFelicidad = felicidad
		tipoTrabajo = tipo
	}
	method plata(){
		return plataTrabajo
	}
	method unidadesFelicidad(){
		return unidadesFelicidad
	}
	method tipoTrabajo(){
		return tipoTrabajo
	}
        method trabajar(unSims){
                tipoTrabajo.trabajar(unSims)
        }
}


class Trabajar{
	method trabajar(unSims){
		unSims.personalidad().trabajar(unSims)
		unSims.aumentarDinero(self.dinero(unSims))
	 	unSims.aumentarFelicidad(self.unidadesFelicidad(unSims))
		unSims.cambiarEstado(normalidad)
	}
	method dinero(unSims){return 0}
	method unidadesFelicidad(unSims){return 0}
	//solo para que wollok no tire error
}



object copado inherits Trabajar{
	override method dinero(unSims){
		return unSims.trabajo().plata()
	}
	override method unidadesFelicidad(unSims){
		return unSims.trabajo().unidadesFelicidad()
	}
	
}	 

class TrabajoMercenario inherits Trabajar {
	override method dinero(unSims){
		return 100 + unSims.dinero()*0.02
	}
}
object mercenario inherits TrabajoMercenario {
} 

object mercenarioSocial inherits TrabajoMercenario {
	override method dinero(unSims){
		return 100 + unSims.dinero()*0.02 + self.comision(unSims)
	}
	method comision(unSims){
		return unSims.cantidadAmigos()
	} 
}	

class TrabajoAburrido inherits Trabajar{
	override method dinero(unSims){
		return unSims.trabajo().plata()
	}
	override method unidadesFelicidad(unSims){
		return -unSims.trabajo().unidadesFelicidad()
	}
}

object aburridoHastaLaMuerte inherits TrabajoAburrido {
	var n = 10
	override method unidadesFelicidad(unSims){
		return -unSims.trabajo().unidadesFelicidad()*n
	}
}

object aburrido inherits TrabajoAburrido {
}
object desocupado{
	method trabajar(unSims, unTrabajo)
	{
	}
}


object programador inherits Trabajo(20, 20, copado){}
object oficinista inherits Trabajo(20, 20, aburrido){}
object barraBrava inherits Trabajo(20, 20, mercenario){}
object oficinistaFullTime inherits Trabajo(20, 20, aburridoHastaLaMuerte){}
object barraBravaConAmigos inherits Trabajo(20, 20, mercenarioSocial){}
