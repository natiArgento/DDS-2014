package main.xtend.entrega4.ordenamientoLista

import entrega4.ordenamientoLista.OrdenLista
import main.Jugador

class OrdenarPorNCalificaciones extends OrdenLista {
	@Property int n
	
	new(int n){
		this.n = n
	}
	
	override evaluar(Jugador jugador) { 
		jugador.promedioCalificaciones(jugador.getListaDeCalificaciones,getN)
	}
	
}