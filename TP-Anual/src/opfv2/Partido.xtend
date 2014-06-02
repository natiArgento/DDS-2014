package opfv2

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import observerNotificador.InscripcionObserver

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> estandares
	@Property ArrayList<Inscripcion> solidarios
	@Property ArrayList<Inscripcion> condicionales
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.estandares = new ArrayList()
		this.solidarios = new ArrayList()
		this.condicionales = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}


	def getListaQuienesJugaron(){
		return this.quienesJugaron
	}
	
	def getListaJugadores() {
		val HashSet<Jugador> listaJugadores = newHashSet()
		estandares.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		solidarios.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		condicionales.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		return listaJugadores
		/* para arreglar este tema, por ejemplo, seria mejor guardar 
		* todas las inscripciones en una sola lista? 
	
	def getQuienesJugaron() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def getQuienesJugaron() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
		* Sigo sin verle demasiado sentido a guardar cada Tipo en su propia lista
		*/
	}
}
