class Materia
	@nombre : String
	@id : Int32
	@docente : String
	@nota : Int32
	@inscripto : Bool

    	def initialize(nombre : String,
		       id : String,
		       docente : String,
		       inscriptos : Int32)
		@nombre = nombre
		@id = id
		@docente = docente
        	@nota = 0
		@inscripto = false
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerId() : String
		return @id
	end

	def obtenerNota() : Int32
		return @nota
	end

	def obtenerInscripcion() : Bool
		return @inscripto
	end

	def inscripcion()
		@inscripto == true
	end

	def anularInscripcion()
		@inscripto == false
	end
end