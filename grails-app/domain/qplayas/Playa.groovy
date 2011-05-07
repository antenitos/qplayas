package qplayas

class Playa {
	
	String nombre
	String localidad
	String provincia
	Posicion posicion
	Caracteristicas caracteristicas
	Tipo tipo
	Acceso acceso
	Transporte transporte
	Hospital hospital
	Seguridad seguridad
	Turismo turismo
	Servicios servicios
	Medioambiente medioambiente
	
	static hasMany = [tiempo:Tiempo]
	

    static constraints = {
    }
}
