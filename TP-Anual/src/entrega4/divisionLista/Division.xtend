package entrega4.divisionLista

import java.util.ArrayList
import java.util.List
import main.Jugador
import main.Partido

class Division {
	@Property List<Integer> equipo1
	@Property List<Integer> equipo2
	
public static val divisionPorPares = new Division(#[1,3,5,7,9],#[2,4,6,8,10])
public static val divisionB = new Division(#[1,4,5,8,9],#[2,3,6,7,10])
	
	new(List<Integer> equipo1, List<Integer> equipo2){
		this.equipo1 = equipo1
		this.equipo2 = equipo2
	}
	def void dividirEquipos(Partido partido){
		var List<Jugador> equipoA = new ArrayList()
		var List<Jugador> equipoB = new ArrayList()
		for (i:0..4){
			var int a = equipo1.get(i)-1
			var int b = equipo2.get(i)-1
			equipoA.add = partido.confirmados.get(a)
			equipoB.add = partido.confirmados.get(b)
		}
		partido.equipoA = equipoA
		partido.equipoB = equipoB
	}
}