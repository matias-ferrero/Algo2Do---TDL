require "./Materia"
require "../../../../../lib/granite_orm/src/granite_orm"

class Alumno < Granite::ORM::Base
	table name: "alumnos"

	@nombre : String
	@dni : Int32
	@padron : Int32
	@password : String
	@carrera : String
	@materias : Array(Materia)

	def initialize(nombre : String, dni : Int32, padron : Int32, carrera : String)
		@nombre = nombre
		@dni = dni
		@padron = padron
		#@password = #llamar a signIn ¿?
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

	def obtenerPassword() : String
		return @password
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
