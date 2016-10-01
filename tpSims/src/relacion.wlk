class Relacion{
	var unSims
	var otroSims
	var nuevosAmigos = []
	constructor(unSimsC, otroSimsC){
		unSims = unSimsC
		otroSims = otroSimsC
		self.comenzarRelacion()
		self.nuevosAmigos()
	}
	method comenzarRelacion(){
		unSims.pareja(otroSims)
		otroSims.pareja(unSims)
		unSims.relacion(self)
		otroSims.relacion(self)
	}
	method estaEnRelacion(unSimsCualquiera){
		return unSimsCualquiera == unSims || unSimsCualquiera == otroSims
	}
	method nuevosAmigos(){
		unSims.amigos().forEach({unAmigo => nuevosAmigos.add(unAmigo)})
	var sinRepetidos = otroSims.amigos().filter({unAmigo => not(nuevosAmigos.contains(unAmigo))})
		sinRepetidos.forEach({unAmigo => nuevosAmigos.add(unAmigo)})
		//nuevosAmigos.addAll(unSims.amigos())
		//nuevosAmigos.addAll(otroSims.amigos())
	//	nuevosAmigos.asSet()
	//Descartamos esta solucion porque tarda bastante en testear (calculamos que tarda
	//el algoritmo del asSet)
		}
	method amigos(){
		return nuevosAmigos
	}
	
	method miembros(){
			return [unSims, otroSims]
	}
	method funcionaRelacion(){
		return unSims.leInteresa(otroSims) &&  otroSims.leInteresa(unSims)
	}
	method sePudreTodo(){
		return not(self.funcionaRelacion()) && self.algunoPuedeSerInfiel()
	}
	method terminarRelacion(){
		unSims.pareja(soltero)
		otroSims.pareja(soltero)
		unSims.relacion(sinPareja)
		otroSims.relacion(sinPareja)
	}
	method reiniciarRelacion(){
		unSims.relacion().terminarRelacion()
		otroSims.relacion().terminarRelacion()
		self.comenzarRelacion()
	}
	
	method terminoLaRelacion(){
		return not(unSims.pareja() == otroSims) 
	}
	method algunoPuedeSerInfiel(){
		return nuevosAmigos.any({otrSims => unSims.leInteresa(otrSims)}) || nuevosAmigos.any({otrSims => otroSims.leInteresa(otrSims)})
	}
}


object sinPareja{
	method terminarRelacion(){}
	method ComenzarRelacion(){}
	method amigos(susAmigos){
		return susAmigos
	}
}

object soltero {}
