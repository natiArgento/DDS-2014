package entrega3

import org.junit.Test
import principales.Jugador

import static org.junit.Assert.*

class TestProponerJugador {
	
	var admin = new Administrador("Natalia","lamejoradmin@blabla.com")
	var jugadorProponedor = new Jugador(20,"Lucas","-")
	
	@Test
	def testProponeJugadorYRegistraLaPeticion(){
		assertEquals(0,admin.getJugadoresPorConfirmar.size)
		
		jugadorProponedor.proponerJugadorA(admin,"Pepe","Pepito",46)
				
		assertEquals(1,admin.getJugadoresPorConfirmar.size)
	}
	
	@Test
	def testProponeJugadorYEsAceptado(){
		assertEquals(0,admin.getJugadoresAprobados.size)
		
		var sugerido = jugadorProponedor.proponerJugadorA(admin,"Pepe","Pepito",46)
		admin.aceptar(sugerido)
						
		assertEquals(1,admin.getJugadoresAprobados.size)
	}
	
	@Test
	def testProponeJugadorYEsRechazado(){
		assertEquals(0,admin.getJugadoresRechazados.size)
		
		var sugerido = jugadorProponedor.proponerJugadorA(admin,"Pepe","Pepito",46)
		admin.rechazar(sugerido,"Es un pecho frio")
						
		assertEquals(1,admin.getJugadoresRechazados.size)
	}
}