package main

import entrega2.observerNotificador.InscripcionObserver
import java.util.ArrayList
import java.util.List
import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.NoHayMasLugarParaInscribirse
import java.util.Date
import entrega2.bajaObserver.Penalizacion

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> inscripciones
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.inscripciones = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}


	def getListaQuienesJugaron(){
		return this.getQuienesJugaron
	}
	
	def getListaJugadores() {
		inscripciones.map(inscripcion | inscripcion.jugador)
	}
	
	def permiteInscripciones() {
		(inscripciones.filter[inscripcion | inscripcion.prioridad == 0].size) < 10
		}

	def darDeBajaConReemplazante(Jugador jugador, Jugador reemplazante, TipoInscripcion tipoInscripcion){
		this.eliminarInscripcion(jugador)
		this.inscribirJugador(reemplazante,tipoInscripcion)
	}
	
	def darDeBajaSinReemplazante(Jugador jugador){
		this.eliminarInscripcion(jugador)
		this.penalizaA(jugador)
		}
		
	def penalizaA(Jugador jugador){
		jugador.agregatePenalizacion(new Penalizacion(new Date(),"no dejaste reemplazante",this))
	}
	
	def eliminarInscripcion(Jugador jugador){
		var inscrip= this.inscripciones.findFirst[i|i.jugador == jugador]
		this.inscripciones.remove(inscrip)
	}
	
	def inscribirJugador(Jugador reemplazante, TipoInscripcion tipo){
		var Inscripcion inscrip = new Inscripcion (reemplazante,this,tipo)
		if(!this.permiteInscripciones){
			throw new NoHayMasLugarParaInscribirse("no tiene mas cupo este partido")}
			inscripciones.add(inscrip)
		}
		
	}

