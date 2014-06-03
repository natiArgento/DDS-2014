package bajaDecorator

abstract class Decorator implements BajaInscripcion{
	@Property BajaInscripcion decorado
	
	new(BajaInscripcion cliente)
	{
		decorado = cliente
	}
}