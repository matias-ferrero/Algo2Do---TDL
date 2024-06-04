require "./Materia"

class Alumno
	@nombre : String
	@padron : Int32
	@carrera : String
	@materias : Array(Materia)

	def initialize(nombre : String, padron : Int32, carrera : String)
		@nombre = nombre
		@padron = padron
		@carrera = carrera
		@materias = Array()
	end

	def obtenerMaterias() : Array(Materia)
		return @materias
	end
	
	def historiaAcademica() : Array(Materia)
		return @materias.filter { |Materia| materia.obtenerNota() > 0 }
	end

	def misInscripciones() : Array(Materia)
		return @materias.filter { |Materia| materia.obtenerInscripcion() }
	end

	def inscripcion(opcion : Int32) : Bool
		return this.materias[opcion].inscripcion()
	end

	def anularInscripcion(opcion : Int32)
		this.materias[opcion].anularInscripcion()
	end
end
