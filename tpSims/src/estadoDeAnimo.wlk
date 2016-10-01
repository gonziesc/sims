
object normalidad{
	method nivelDeFelicidad(felicidad){
		return felicidad
	}
	method informacion(informacion){
		return informacion
	}
}

object soniador{
	method nivelDeFelicidad(felicidad){
		return felicidad + 1000
	}
	method informacion(informacion){
		return []
	}
}

object incomodidad{
	method nivelDeFelicidad(felicidad){
		return felicidad -200
	}
	method informacion(informacion){
		return informacion
	}
}
