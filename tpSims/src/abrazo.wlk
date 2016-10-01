import estadoDeAnimo.*
object abrazoComun{
	method abrazar(unSims, otroSims){
		unSims.aumentarFelicidad(2)
		otroSims.aumentarFelicidad(4)
	}
}

object abrazoProlongado{
	method abrazar(unSims, otroSims){
		if(otroSims.leInteresa(unSims)){
			otroSims.estado(soniador)
		}
		else{
			otroSims.estado(incomodidad)
		}
	}
}