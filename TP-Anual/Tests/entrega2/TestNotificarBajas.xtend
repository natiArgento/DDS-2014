package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega2.observerNotificador.DiezConfirmadosObserver
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestNotificarBajas {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador
	var Jugador jugador = new Jugador(25, "Pecho Frio")

	@Before
	def inicio() {
		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador))
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			partido.inscribir(jugador, new InscripcionEstandar)

		}
	}

	@Test
	def notificarCuandoHayMenosDe10() {
		partido.inscribir(jugador, new InscripcionEstandar)
		assertEquals(1, stubNotificador.partidosNotificados.size)
		jugador.darseDeBaja(partido)
		assertEquals(0, stubNotificador.partidosNotificados.size)

	}
}
