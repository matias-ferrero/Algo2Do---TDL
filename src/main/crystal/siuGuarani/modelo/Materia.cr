class Materia
	@nota : Int32
	@inscripto : Bool

    	def initialize(@nombre : String, @id : String, @docente : String)
        	@nota = 0
		@inscripto = false
	end

	def obtenerNombre() : String
		return @nombre
	end

	def obtenerId() : String
		return @id
	end

	def obtenerDocente() : String
		return @docente
	end

	def obtenerNota() : Int32
		return @nota
	end

	def obtenerInscripcion() : Bool
		return @inscripto
	end

	def inscripcion() : Bool
		if @inscripto == true
			return false
		end
		@nota = 0
		@inscripto = true
		return true
	end

	def anularInscripcion() : Bool
		if @inscripto == false
			return false
		end
		
		@inscripto = false
		return true
	end
	
	def rendir(nota)
		@nota = nota

		if @nota >= 4
			@inscripto = false
		end
	end
end