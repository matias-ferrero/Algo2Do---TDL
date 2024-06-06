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
		@materias = Array(Materia).new
	end

	def obtenerMaterias() : Array(Materia)
		return @materias
	end
	
	def historiaAcademica() : Array(Materia)
		return @materias.select { |materia| materia.obtenerNota() > 0 }
	end

	def misInscripciones() : Array(Materia)
		return @materias.select { |materia| materia.obtenerInscripcion() }
	end

	def inscripcion(opcion : Int32) : Bool
		return @materias[opcion].inscripcion()
	end

	def anularInscripcion(opcion : Int32)
		@materias[opcion].anularInscripcion()
	end
end
