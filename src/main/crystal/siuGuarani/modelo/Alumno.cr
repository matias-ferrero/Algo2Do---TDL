require "./Materia"

class Alumno
	@nombre : String
	@padron : Int32
	@carrera : String
	@inscripciones : Array(Materia) 
	@materias : Array(Materia) 

	def initialize(nombre : String, padron : Int32, carrera : String)
		@nombre = nombre
		@padron = padron
		@carrera = carrera
		@inscripciones = Array()
		@materias = Array()
	end

	def historiaAcademica()
	  @materias
	end

	def inscripcion() : Bool
	  #inscribirme a una materia
	end

	def anularInscripcion() : Bool
	  #desinscribirme a una materia
	end

end
