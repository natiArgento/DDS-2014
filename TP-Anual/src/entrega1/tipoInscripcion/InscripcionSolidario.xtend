package entrega1.tipoInscripcion

import main.Inscripcion
import main.Jugador
import main.Partido

class InscripcionSolidario extends TipoInscripcion {

@Property int prioridad = 1

	override inscribirA (Jugador jugador, Partido partido, Inscripcion unaInsc) {
		confirmarInscripcion(unaInsc,partido)		
	}
	
	override ocupaLugarFijo(){
		false
	}
}
