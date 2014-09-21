package entrega4.reentrega.ordenamiento

import principales.Jugador

class OrdenamientoCalificacionUltimos2Partidos extends CriterioOrdenamiento {
	
		
	override calcularValor() {
		[ Jugador jugador |
				val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList
				val promedio = misPuntajes.fold(0d, [ acum, puntaje | acum + puntaje ]) / misPuntajes.size
				promedio
		]
	}
	
}