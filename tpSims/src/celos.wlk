

object celosPorPopularidad inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => unAmigo.popularidad() <= unSims.popularidad()})
		unSims.cambiarAmigos(nuevosAmigos)
		
	}
}
object celosPorPareja inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => not((unSims.pareja()).esAmigo(unAmigo))})
		unSims.cambiarAmigos(nuevosAmigos)
	}
}
object celosPorPlata inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => unAmigo.dinero() <= unSims.dinero()})
		unSims.cambiarAmigos(nuevosAmigos)
	}
}

class Celos{
	method bajarFelicidad(unSims){
		unSims.disminuirFelicidad(10)
	}
	
}