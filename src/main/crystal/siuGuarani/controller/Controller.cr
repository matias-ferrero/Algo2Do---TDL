require "../modelo/Alumno"
require "./VistaAlumnoController"
require "./VistaMateriaController"
require "../vista/VistaSistema"

class Controller
	private ERROR = -1
	private SALIR = 0

   	@alumno : Alumno
	@vistaSistema : VistaSistema
	@vistaAlumnoController : VistaAlumnoController
	@vistaMateriaController : VistaMateriaController
	@terminado : Bool

	def initialize(alumno : Alumno)
		@alumno = alumno
		@vistaSistema = VistaSistema.new()
		@vistaAlumnoController = VistaAlumnoController.new(@alumno)
		@vistaMateriaController = VistaMateriaController.new()
		@terminado = false
		puts "Termino el constructor"
	end

	def salir() : Bool
		return @terminado
	end

	def signIn()
		#registrarse
	end

	def logIn()
		#loguearse
	end
	
	def menuPrincipal()
		puts "Entre al menu principal"
		@vistaSistema.imprimirMensaje("")#Todo: Texto
		opcion = leerInt(gets.to_s.chomp)
		printf "La opcion es %d \n", opcion
		case opcion
			when SALIR
				@terminado = true
			when 1
				materias = @alumno.historiaAcademica()
				@vistaMateriaController.imprimirMateriasHistorial(materias)
			when 2
				materias = @alumno.misInscripciones()
				@vistaMateriaController.imprimirMateriasHistorial(materias)
			when 3
				seleccionarMateriaParaInscripcion()
			when 4
				seleccionarMateriaParaAnular()
			else

			end
	end

	private def seleccionarMateriaParaInscripcion()
		materias = @alumno.obtenerMaterias()
		@vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		if !@alumno.inscripcion(opcion-1)
			@vistaSistema.imprimirMensaje("No hay mas cupos en esta materia!")
		else
			@vistaSistema.imprimirMensaje("Inscripcion valida!")
		end
	end

	private def seleccionarMateriaParaAnular()
		materias = @alumno.misInscripciones()
		@vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		@alumno.anularInscripcion(opcion-1)
		@vistaSistema.imprimirMensaje("Inscripcion anulada!")
		
	end

	private def pedirMateria(materias : Array(Materia)) : Int32
		opcionValida = false
		@vistaSistema.imprimirMensaje("Seleccione una materia")
		opcion = ERROR

		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > materias.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!")
			else
				opcionValida = true
			end
		end
		return opcion
	end

	private def leerInt(input : String) : Int32
		default = ERROR
		begin
			return input.to_i
		rescue
			return default
		end
	end
end