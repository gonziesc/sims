class Libro{
	var capitulos = []
	method agregarCapitulo(unCapitulo){
		capitulos.add(unCapitulo)
	}
	method informar(){
		return capitulos.anyOne()
	}
}


object tinelli{
  	method informar(){
  	 	return "Toto"
  	 }
}
  
object rial{
  	method informar(){
  	 	return "Escandalo"
  	 }
}
