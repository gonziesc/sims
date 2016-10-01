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
	method porSerBuenazo(unSims){
		var esBuenazo = unSims.personalidad() == buenazo
		var trabajaConSusAmigos = unSims.trabajaConTodosSusAmigos()
		if(esBuenazo && trabajaConSusAmigos){
			unSims.aumentarFelicidad(unSims.nivelDeFelicidad()*0.1)
		}
	}
}

object copado inherits Trabajar{
	 method trabajar(unSims){
	 	self.porSerBuenazo(unSims)
	 	unSims.aumentarDinero(unSims.trabajo().plata())
	 	unSims.aumentarFelicidad(unSims.trabajo().unidadesFelicidad())
	 }
}	 

object mercenario inherits Trabajar {
	method trabajar(unSims){
		self.porSerBuenazo(unSims)
		var dineroGanado = 100 + unSims.dinero()*0.02
		unSims.aumentarDinero(dineroGanado)
	}	
}	

object aburrido inherits Trabajar{
	method trabajar(unSims)
	{
		self.porSerBuenazo(unSims)
		unSims.aumentarDinero(unSims.trabajo().plata())
	 	unSims.disminuirFelicidad(unSims.trabajo().unidadesFelicidad())
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
