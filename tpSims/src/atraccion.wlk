object interesado{
	method valorar(unSims, otroSims){
		return otroSims.dineroDeTodosSusAmigos()*0.1
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims) && unSims.leDuplicaElDinero(otroSims)
	}
}
object superficial{
	method valorar(unSims, otroSims){
		return otroSims.popularidad()*20
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims) && unSims.esMasPopularQueSusAmigos(otroSims) && otroSims.esJoven()
	}
}

object buenazo{
	method valorar(unSims, otroSims){
		return unSims.nivelDeFelicidad()/2
	}
	method leInteresa(unSims, otroSims){
		return unSims.prefiereSexoDe(otroSims)
	}
}

object peleadoConLaVida{
	method valorar(unSims, otroSims){
		return 0
	}
	method leInteresa(unSims, otroSims){
		return  unSims.prefiereSexoDe(otroSims) && otroSims.esInfeliz()
	}
}
