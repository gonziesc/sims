import atraccion.*
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

object mercenario inherits Trabajar {
	override method dinero(unSims){
		return 100 + unSims.dinero()*0.02
	}
}	

object aburrido inherits Trabajar{
	override method dinero(unSims){
		return unSims.trabajo().plata()
	}
	override method unidadesFelicidad(unSims){
		return -unSims.trabajo().unidadesFelicidad()
	}
}
object desocupado{
	method trabajar(unSims, unTrabajo)
	{
	}
}


object programador inherits Trabajo(20, 20, copado){}
object oficinista inherits Trabajo(20, 20, aburrido){}
object barraBrava inherits Trabajo(20, 20, mercenario){}
