

object celosPorPopularidad inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		unSims.amigos(unSims.sacarAmigosMasPopulares())
		
	}
}
object celosPorPareja inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		unSims.amigos(unSims.sacarAmigosDePareja())
	}
}
object celosPorPlata inherits Celos{
	method hacerQueTengaCelos(unSims)
	{
		self.bajarFelicidad(unSims)
		unSims.amigos(unSims.sacarAmigosConMasDinero())
	}
}

class Celos{
	method bajarFelicidad(unSims){
		unSims.disminuirFelicidad(10)
	}
	
}
