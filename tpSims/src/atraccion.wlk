object interesado{
	method valorar(unSims, otroSims){
		return otroSims.dineroDeTodosSusAmigos()*0.1
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims) && unSims.leDuplicaElDinero(otroSims)
	}
	method trabajar(unSims){
		
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
}
