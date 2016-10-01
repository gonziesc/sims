class Atraccion{
	method esSexoPreferencia(unSims, otroSims){
		return unSims.sexoPreferencia() == otroSims.sexo()
	}
}
object interesado inherits Atraccion{
	method valorar(unSims, otroSims){
		var dineroAmigos =  otroSims.amigos().sum({unAmigo => unAmigo.dinero()})
		return dineroAmigos*0.1
	}
	method leInteresa(unSims, otroSims){
		var sexoPreferencia = self.esSexoPreferencia(unSims, otroSims)
		var duplicaDinero = otroSims.dinero()*2 >= unSims.dinero()
		return sexoPreferencia && duplicaDinero
	}
}
object superficial  inherits Atraccion{
	method valorar(unSims, otroSims){
		return otroSims.popularidad()*20
	}
	method leInteresa(unSims, otroSims){
		var sexoPreferencia = self.esSexoPreferencia(unSims, otroSims)
		var masPopular = unSims.amigoMasPopular().popularidad() < otroSims.popularidad() 
		var enRangoDeEdad = otroSims.edad() > 18 && otroSims.edad() < 29
		return sexoPreferencia && masPopular && enRangoDeEdad
	}
}

object buenazo inherits Atraccion{
	method valorar(unSims, otroSims){
		return unSims.nivelDeFelicidad()/2
	}
	method leInteresa(unSims, otroSims){
		return self.esSexoPreferencia(unSims, otroSims)
	}
}

object peleadoConLaVida  inherits Atraccion{
	method valorar(unSims, otroSims){
		return 0
	}
	method leInteresa(unSims, otroSims){
		var sexoPreferencia = self.esSexoPreferencia(unSims, otroSims)
		var esInfeliz = otroSims.nivelDeFelicidad() < 200
		return sexoPreferencia && esInfeliz
	}
}