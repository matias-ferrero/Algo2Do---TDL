require "./Materia"

class Alumno
	@nombre : String
	@carreras : 
	@materias : Hash(String, Array(Materia))

	def initialize(nombre : String, materias : Hash(String, Array(Materia)))
		@nombre = nombre
		@materias = materias
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerPadron() : Int32
		return @padron
	end

	def obtenerCarrera() : String
		return @carrera
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
