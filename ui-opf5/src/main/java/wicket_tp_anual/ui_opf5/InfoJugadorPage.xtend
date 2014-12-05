package wicket_tp_anual.ui_opf5

import org.apache.wicket.Page
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador
import wicket_tp_anual.ui_opf5.BuscadorModel.InfoJugador

class InfoJugadorPage extends WebPage implements VisualizarJugadoresPage {

	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final Page returnPage
	@Property Jugador jugador
	var InfoJugador buscador

	new(Page returnPage, Jugador jugador) {
		this.returnPage = returnPage
		this.jugador = jugador
		this.buscador = new InfoJugador(jugador)
		buscador.search()

		this.addChild( new Form<Jugador>("infoJugador", this.jugador.asCompoundModel) => [
		agregarDatos
		agregarAcciones
		])
		this.addChild( new Form<InfoJugador>("buscador", this.buscador.asCompoundModel) => [
			agregarDatosList
		])


	}

	def agregarDatos(Form<Jugador> parent) {
		parent.addChild(new LabelJugador("nombre", jugador))
		parent.addChild(new LabelJugador("apodo", jugador))
		parent.addChild(new LabelJugador("handicap", jugador))
		parent.addChild(new Label("promedioUltimoPartido"))
		parent.addChild(new LabelJugador("promedioTotal", jugador))
		parent.addChild(new LabelJugador("nacimiento", jugador))
	}
	
	def agregarDatosList(Form<InfoJugador> parent){
		parent.addChild(new GrillaJugadores("resultadoAmigos", this))
		
		val infracciones = new XListView("resultadoPenalizaciones")
		infracciones.populateItem = [ inf |
			inf.model = inf.modelObject.asCompoundModel
			inf.addChild(new Label("fecha"))
			inf.addChild(new Label("motivo"))
			inf.addChild(new Label("partido"))
		]
		parent.addChild(infracciones)
	}

	override verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this, jugadorSeleccionado)
	}

	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick = [|volver]);
	}

	def volver() {
		responsePage = returnPage
	}

}
