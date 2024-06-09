require "../../../../../lib/granite_orm/src/granite_orm"

class Materia < Granite::ORM::Base
	table name: "materias"

	@nombre : String
	@codigo : Int32
	@nota : Int32
	@inscripto : Bool
	@docente : String
	@cantInscriptos : Int32
	@maxInscriptos : Int32

    	def initialize(nombre : String, codigo : Int32, cantInscriptos : Int32)
		@nombre = nombre
		@codigo = codigo
        	@nota = 0
		@inscripto = false
		@docente = ""
		@cantInscriptos = 0
        	@maxInscriptos = 0
	end

	def obtenerNombre()
		return @nombre
	end

	def obtenerCodigo()
		return @codigo
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