require "../modelo/Alumno"
require "./VistaAlumnoController"

class Controller
   	@alumno : Alumno
	@vistaAlumnoController : VistaAlumnoController
	@vistaMateriaController : VistaMateriaController

	def initialize()
		@vistaAlumnoController = VistaAlumnoController.new(@alumno)
		@vistaMateriaController = VistaMateriaController.new()
	end

	def signIn()
		#registrarse
	end

	def logIn()
		#loguearse
	end
	
    	def menuPrincipal()
		opcion = leerInt()
		case opcion
		when 1
			materias = this.alumno.historiaAcademica()
			this.vistaMateriaController.imprimirMateriasHistorial(materias)
		when 2
			materias = this.alumno.misInscripciones()
			this.vistaMateriaController.imprimirMateriasHistorial(materias)
		when 3
			opcion = this.seleccionarMateria()
		when 4
		# anular inscripcion
		else

		end
    	end

	private

	def seleccionarMateria() : Int32
		materias = this.alumno.obtenerMaterias()
		this.vistaMateriaController.imprimirMateriasInscripcion(materias)
		#TODO: Continuar

	end

	def leerInt() : Int32
		puts "\nIngrese un numero: "
		return toInt(gets.chomp)
	end

	def toInt(input : String) : Int32
		default = -1
		begin
			return input.to_i
		rescue
			return default
		end
	end
end