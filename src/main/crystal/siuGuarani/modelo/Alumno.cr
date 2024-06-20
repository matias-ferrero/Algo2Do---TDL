require "./Materia"

class Alumno

	def initialize(@nombre : String, @materias : Hash(String, Array(Materia)), @carreraActual : String)
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

	def inscripcion(opcion) : Bool
		listaMaterias = obtenerMaterias()
		return listaMaterias[opcion].inscripcion()
	end

	def anularInscripcion(opcion) : Bool
		listaMaterias = misInscripciones()
		return listaMaterias[opcion].anularInscripcion()
	end

	def rendirMateria(opcion, nota)
		listaMaterias = misInscripciones()
		listaMaterias[opcion].rendir(nota)
	end

	def agregarCarrera(carreras) : Bool
		listaCarreras = obtenerCarreras()
		
		listaCarreras.each do |i|
			if i == carreras.keys[0]
				return false
			end
		end

		@materias.merge!(carreras)
		return true 
	end
end
