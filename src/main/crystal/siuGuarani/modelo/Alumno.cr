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

	def obtenerCarreras() : Array(String)
		return @materias.keys		
	end

	def obtenerMaterias() : Array(Materia)
		return @materias[@carreraActual]
	end

	def modificarCarreraActual(carreraActual : String)
		@carreraActual = carreraActual
	end

	def historiaAcademica() : Array(Materia)
		return @materias[@carreraActual].select { |materia| materia.obtenerNota() > 0 }
	end

	def misInscripciones() : Array(Materia)
		return @materias[@carreraActual].select { |materia| materia.obtenerInscripcion() }
	end

	def inscripcion(opcion : Int32) : Bool
		listaMaterias = misInscripciones()
		return listaMaterias[opcion].inscripcion()
	end

	def anularInscripcion(opcion : Int32) : Bool
		listaMaterias = misInscripciones()
		return listaMaterias[opcion].anularInscripcion()
	end

	def rendirMateria(opcion : Int32)
		listaMaterias = misInscripciones()
		listaMaterias[opcion].rendir()
	end

	def agregarCarrera(carreras : Hash(String, Array(Materia))) : Bool
		
		@materias.each do |materia|
			if materia == carreras.keys[0]
				return false
			end
		end

		@materias.merge!(carreras)
		return true 
	end
end
