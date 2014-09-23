package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import principales.Jugador

class InfoJugadorPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final GenerarEquiposPage generadorPage
	private final BuscarJugadorPage buscadorPage
	private final InfoJugadorPage infoPage
	@Property Jugador jugador	
	int variable	
	
	new(int b, GenerarEquiposPage gp, BuscarJugadorPage bp, InfoJugadorPage ip, Jugador jugador) {
		this.generadorPage=gp
		this.buscadorPage=bp
		this.infoPage=ip
		this.variable=b
						
		this.jugador=jugador
		
		val Form<Jugador> infoJugadorForm = new Form<Jugador>("infoJugador",this.jugador.asCompoundModel)		
		agregarDatos(infoJugadorForm)
		agregarAcciones(infoJugadorForm)
		this.addChild(infoJugadorForm)
		
	}
	
	def agregarDatos(Form<Jugador> parent) {
		parent.addChild(new Label("nombre"))
		parent.addChild(new Label("apodo"))
		parent.addChild(new Label("handicap"))
	}
		
	def verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(2, null, null, this,jugadorSeleccionado)
	}
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def volver() {
		if(variable == 0){
			responsePage = generadorPage
		}
		else{
			if(variable == 1){
				responsePage = buscadorPage
			}
			else{}
				responsePage = infoPage
			}
		}
		
}
