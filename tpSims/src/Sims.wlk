import estadoDeAnimo.*
import atraccion.*
import celos.*
import trabajo.*
import abrazo.*
import relacion.*

object hombre{}
object mujer{}

class Sims {
	var sexo
	var edad
	var amigos = []
	var nivelDeFelicidad
	var personalidad
	var dinero
	var estado = normalidad
	var pareja
	var sexoPreferencia
	var informacion = []
	var trabajo
	var relacion = sinPareja
	constructor(unSexo, unaFelicidad, unaEdad, unaPersonalidad, 
		unSexoPreferencia, unTrabajo, unDinero
	){
		sexo = unSexo
		edad = unaEdad
		nivelDeFelicidad = unaFelicidad
		personalidad = unaPersonalidad
		sexoPreferencia = unSexoPreferencia
		trabajo = unTrabajo
		dinero = unDinero
	}
	method pareja(){
		return pareja
	}
	method trabajo(){
		return trabajo
	}
	method relacion(){
		return relacion
	}
	method trabajar(){
		trabajo.trabajar(self)
	}
	method informacion(){
		return estado.informacion(informacion)
	}
	method estado(){
		return estado
	}
	method valoracion(unSims){
		return personalidad.valorar(self, unSims)
	}
	method leInteresa(unSims){
		return personalidad.leInteresa(self, unSims)
	}
	method dinero(){
		return dinero
	}
	method sexo(){
		return sexo
	}
	method sexoPreferencia(){
		return sexoPreferencia
	}
	method personalidad(){
		return personalidad
	}
	method amigos(){
		return relacion.amigos(amigos)
	}
	method amigosVerdaderos(){
		return amigos
		//solo para test 28.c
	}
	method edad(){
		return edad
	}
	method nivelDeFelicidad(){
		return estado.nivelDeFelicidad(nivelDeFelicidad)
	}
	method abrazar(unSims, tipoAbrazo){
		tipoAbrazo.abrazar(self, unSims)
	}
	method celar(tipoCelos){
		tipoCelos.hacerQueTengaCelos(self)
	}
	method agregarAmigo(unAmigo){
		amigos.add(unAmigo)
	}
	method trabajaConTodosSusAmigos(){
		return amigos.all({unAmigo => unAmigo.trabajo() == trabajo})
	}
	method relacion(unaRelacion){
		relacion = unaRelacion
	}
	method aumentarFelicidad(nivel){
		nivelDeFelicidad += nivel
	}
	method disminuirFelicidad(nivel){
		nivelDeFelicidad -= nivel
	}
	method aumentarDinero(nuevoDinero){
		dinero += nuevoDinero
	}
	method quienesLeGustan(listaPersonas){
		return listaPersonas.filter({unSims => self.leInteresa(unSims)})
	}
	method estado(nuevoEstado){
		if(estado == nuevoEstado) {
  			error.throwWithMessage("ya tiene este estado")
  		}
  		if(not(nuevoEstado == normalidad)) {
  			self.seLeFueElEstado()
  		}
  		estado = nuevoEstado
	}
	method seLeFueElEstado(){
		estado = normalidad
	}
	method pareja(nuevaPareja){
		pareja = nuevaPareja
	}
	method amigosDeFierro(){
		return amigos.take(4)
	}
	method nuevosAmigos(){
		return amigos.drop(amigos.size() - 4)
	}
	method amigos(nuevosAmigos){
		amigos = nuevosAmigos
	}
	method esAmigo(unAmigo){
		return amigos.contains(unAmigo)
	}
	method amigoQueMasValora(){
		return amigos.max({unAmigo => self.valoracion(self)})
	}
	method amigoMasPopular(){
		return amigos.max({unAmigo => unAmigo.popularidad()})
	}
	method popularidad(){
		return amigos.sum({unAmigo => unAmigo.nivelDeFelicidad()})
	}
	method esElMasPopular(){
		return amigos.all({unAmigo => self.popularidad() > unAmigo.popularidad()})
	}
	method contarInformacion(unaInformacion){
		if(not(self.tieneInformacion(unaInformacion))){
			informacion.add(unaInformacion)
		}
	}
	method cuanConocedor(){
		return informacion.sum({unaInfo => unaInfo.length()})
	}
	method amnesia(){
		informacion = []
	}
	method tieneInformacion(unaInformacion){
		return informacion.contains(unaInformacion)
	}
	method dineroDeTodosSusAmigos(){
		return amigos.sum({unAmigo => unAmigo.dinero()})
	}
	method hacerAmigo(otroSims){
		self.agregarAmigo(otroSims)
		self.aumentarFelicidad(self.valoracion(otroSims))
	}
	method nosHacemosAmigos(otroSims){
		self.hacerAmigo(otroSims)
		otroSims.hacerAmigo(self)
	}
	method prefiereSexoDe(otroSims){
		return otroSims.sexo() == sexoPreferencia
	}
	method leDuplicaElDinero(otroSims){
		return otroSims.dinero()*2 >= dinero
	}
	method esMasPopularQueSusAmigos(otroSims){
		return self.amigoMasPopular().popularidad() < otroSims.popularidad() 
	}
	method esJoven(){
		return edad > 18 && edad < 29
	}
	method esInfeliz(){
		return self.nivelDeFelicidad() < 200
	}
	method sacarAmigosMasPopulares(){
		return amigos.filter({unAmigo => unAmigo.popularidad() <= self.popularidad()})
	}
	method sacarAmigosDePareja(){
		return amigos.filter({unAmigo => not(pareja.esAmigo(unAmigo))})
	}
	method sacarAmigosConMasDinero(){
		return amigos.filter({unAmigo => unAmigo.dinero() <= dinero})
	}
	method esSuCumpleanios(){
		edad +=1
	}
}
