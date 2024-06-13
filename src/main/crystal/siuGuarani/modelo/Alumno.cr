require "./Materia"

class Alumno
	@nombre : String
	@materias : Hash(String, Array(Materia))
	@carreraActual : String

	def initialize(nombre : String, materias : Hash(String, Array(Materia)), carrera : String)
		@nombre = nombre
		@materias = materias
		@carreraActual = carrera
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerCarreraActual() : String
		return @carreraActual
	end

	def obtenerMaterias() : Array(Materia)
		return @materias[@carreraActual]
	end
	
	def historiaAcademica() : Array(Materia)
		return @materias[@carreraActual].select { |materia| materia.obtenerNota() > 0 }
	end

	def misInscripciones() : Array(Materia)
		return @materias[@carreraActual].select { |materia| materia.obtenerInscripcion() }
	end

	def inscripcion(opcion : Int32) : Bool
		listaMaterias = @materias[@carreraActual]
		return listaMaterias[opcion].inscripcion()
	end

	def anularInscripcion(opcion : Int32) : Bool
		listaMaterias = @materias[@carreraActual]
		return listaMaterias[opcion].anularInscripcion()
	end
end
