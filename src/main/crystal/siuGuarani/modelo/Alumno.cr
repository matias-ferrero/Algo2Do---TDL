require "./Materia"

class Alumno
	@nombre : String
	@dni : Int32
	@padron : Int32
	@carrera : String
	@materias : Array(Materia)

	def initialize(nombre : String, padron : Int32, carrera : String)
		@nombre = nombre
		@dni = 0
		@padron = padron
		@carrera = carrera
		@materias = Array(Materia).new
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerDni() : Int32
		return @dni
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
