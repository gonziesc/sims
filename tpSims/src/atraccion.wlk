
object interesado{
	method valorar(unSims, otroSims){
		return otroSims.dineroDeTodosSusAmigos()*0.1
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims) && unSims.leDuplicaElDinero(otroSims)
	}
	method trabajar(unSims){
		
	}
	method cuantoEstaDispuestoAPrestarle(unSims, otroSims){
		if(self.valorar(unSims, otroSims)*10 > otroSims.dinero()){
			return otroSims.dinero()
		} 
		else {return self.valorar(unSims, otroSims)*10}
	}
}
object superficial{
	method valorar(unSims, otroSims){
		return otroSims.popularidad()*20
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims) && unSims.esMasPopularQueSusAmigos(otroSims) && otroSims.esJoven()
	}
	method trabajar(unSims){
		
	}
	method cuantoEstaDispuestoAPrestarle(unSims, otroSims){
		return self.valorar(unSims, otroSims)*10
	}
}

object buenazo{
	method valorar(unSims, otroSims){
		return unSims.nivelDeFelicidad()/2
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims)
	}
	method trabajar(unSims){
		if(unSims.trabajaConTodosSusAmigos()){
			unSims.aumentarFelicidad(unSims.nivelDeFelicidad()*0.1)
		}
	}
	method cuantoEstaDispuestoAPrestarle(unSims, otroSims){
		return self.valorar(unSims, otroSims)*10
	}
}

object peleadoConLaVida{
	method valorar(unSims, otroSims){
		return 0
	}
	method leInteresa(unSims, otroSims){
		return  unSims.prefiereSexoDe(otroSims) && otroSims.esInfeliz()
	}
	method trabajar(unSims){
		
	}
	method cuantoEstaDispuestoAPrestarle(unSims, otroSims){
		return self.valorar(unSims, otroSims)*10
	}
}
