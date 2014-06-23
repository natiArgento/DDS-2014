package entrega4

import main.Jugador
import main.Partido

class OrdenSC {
	
	public static val OrdenSC porHandicap = new OrdenSC[handicap]
	public OrdenSC porNCalificaciones n = new OrdenSC[jugador | jugador.promedioCalificaciones(jugador.listaDeCalificaciones,n)]
	public static OrdenSC porUltimoPartido = new OrdenSC[promedioUltimoPartido]
	
	var (Jugador)=>int criterio
	
	new((Jugador)=>int unCriterio){
		this.criterio = unCriterio
	}
	
	def ordenarLista(Partido partido){
		return partido.confirmados.sortBy(criterio)
	}
}