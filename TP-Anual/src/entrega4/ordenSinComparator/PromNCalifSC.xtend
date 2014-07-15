package entrega4.ordenSinComparator

import main.Partido

class PromNCalifSC extends OrdenSC {
	
	var int n
	
	new (int numero){
		n = numero
	}
	
	override ordenarLista(Partido partido){
		criterio = [jugador | jugador.promedioCalificaciones(jugador.listaDeCalificaciones,n)]
		super.ordenarLista(partido)
	}
}