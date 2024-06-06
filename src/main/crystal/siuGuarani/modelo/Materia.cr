class Materia
	@nombre : String
	@id : Int32
	@nota : Int32
	@inscripto : Bool
	@docente : String
	@cantInscriptos : Int32
	@maxInscriptos : Int32

    	def initialize(nombre : String, id : Int32, inscriptos : Int32)
		@nombre = nombre
		@id = id
        	@nota = 0
		@inscripto = false
		@docente = ""
		@cantInscriptos = 0
        	@maxInscriptos = 0
	end

	def obtenerNombre()
		return @nombre
	end

	def obtenerId()
		return @id
	end

	def obtenerNota()
		return @nota
	end

	def obtenerInscripcion()
		return @inscripto
	end

	def obtenerCantInscriptos()
		return @cantInscriptos
	end

	def obtenerMaxInscriptos()
		return @maxInscriptos
	end

	def inscripcion() : Bool
		if @cantInscriptos < @maxInscriptos
			@inscripto == true
			@cantInscriptos += 1
			return true
		end

		return false
	end

	def anularInscripcion()
		@inscripto == false
		@cantInscriptos -= 1
	end
end