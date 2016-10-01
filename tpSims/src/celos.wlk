

object celosPorPopularidad inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => unAmigo.popularidad() <= unSims.popularidad()})
		unSims.amigos(nuevosAmigos)
		
	}
}
object celosPorPareja inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => not((unSims.pareja()).esAmigo(unAmigo))})
		unSims.amigos(nuevosAmigos)
	}
}
object celosPorPlata inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		var nuevosAmigos = unSims.amigos().filter({unAmigo => unAmigo.dinero() <= unSims.dinero()})
		unSims.amigos(nuevosAmigos)
	}
}

class Celos{
	method bajarFelicidad(unSims){
		unSims.disminuirFelicidad(10)
	}
	
}