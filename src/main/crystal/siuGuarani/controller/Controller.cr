require "../modelo/Alumno"
require "./VistaAlumnoController"

class Controller
	private ERROR = -1
	private SALIR = 0

   	@alumno : Alumno
	@vistaSistema : VistaSistema
	@vistaAlumnoController : VistaAlumnoController
	@vistaMateriaController : VistaMateriaController
	@terminado : Bool

	def initialize()
		#@alumno = algo
		@vistaSistema = VistaSistema.new()
		@vistaAlumnoController = VistaAlumnoController.new(this.alumno)
		@vistaMateriaController = VistaMateriaController.new()
		@terminado = false
	end

	def salir()
		return this.terminado
	end

	def signIn()
		#registrarse
	end

	def logIn()
		#loguearse
	end
	
    	def menuPrincipal()
		this.vistaSistema.imprimirMensaje("")#Todo: Texto
		opcion = leerInt(gets.chomp)
		case opcion
			when SALIR
				this.terminado = true
			when 1
				materias = this.alumno.historiaAcademica()
				this.vistaMateriaController.imprimirMateriasHistorial(materias)
			when 2
				materias = this.alumno.misInscripciones()
				this.vistaMateriaController.imprimirMateriasHistorial(materias)
			when 3
				this.seleccionarMateriaParaInscripcion()
			when 4
				this.seleccionarMateriaParaAnular()
			else

		end
    	end

	private
	def seleccionarMateriaParaInscripcion()
		materias = this.alumno.obtenerMaterias()
		this.vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		if !this.alumno.inscripcion(opcion-1)
			this.vistaSistema.imprimirMensaje("No hay mas cupos en esta materia!")
		else
			this.vistaSistema.imprimirMensaje("Inscripcion valida!")
		end
	end

	def seleccionarMateriaParaAnular()
		materias = this.alumno.misInscripciones()
		this.vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		this.alumno.anularInscripcion(opcion-1)
		.vistaSistema.imprimirMensaje("Inscripcion anulada!")
		
	end

	def pedirMateria(materias : Array(Materia)): Int32
		opcionValida = false
		this.VistaSistema.imprimirMensaje("Seleccione una materia")

		while !opcionValida
			opcion = leerInt(gets.chomp)

			if opcion < SALIR || opcion > materias.size
				this.VistaSistema.imprimirMensaje("Seleccione una opcion correcta!")
			else
				opcionValida = true
			end
		end
		return opcion
	end

	def leerInt(input : String) : Int32
		default = ERROR
		begin
			return input.to_i
		rescue
			return default
		end
	end
end