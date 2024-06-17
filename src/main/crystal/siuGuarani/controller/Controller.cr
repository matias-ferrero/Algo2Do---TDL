require "../modelo/Alumno"
require "../modelo/Materia"
require "./VistaMateriaController"
require "../vista/VistaSistema"

class Controller
	private ERROR = -1
	private SALIR = 0

   	@alumno : Alumno
	@carreras : Hash(String, Array(Materia))
	@vistaSistema : VistaSistema
	@vistaMateriaController : VistaMateriaController
	@terminado : Bool

	def initialize()
		@vistaSistema = VistaSistema.new()
		@vistaMateriaController = VistaMateriaController.new()
		@carreras = @vistaMateriaController.inicializarMaterias()
		@terminado = false
		@alumno = signUp()
	end

	def salir() : Bool
		return @terminado
	end

	def signUp()
		@vistaSistema.imprimirMensaje("Ingrese su nombre\n")
		nombre = gets.to_s.chomp

		materias = pedirCarrerasSinSalida()
		carreraActual = materias.keys[0]

		return Alumno.new(nombre, materias, carreraActual)
	end
	
	def menuPrincipal()
		@vistaSistema.mostrarMenu(@alumno.obtenerNombre())
		opcion = leerInt(gets.to_s.chomp)
		
		case opcion
			when SALIR
				@terminado = true
			when 1
				materias = @alumno.historiaAcademica()
				@vistaSistema.imprimirMensaje("Tu Historia Acamedica es:\n")
				@vistaMateriaController.imprimirMateriasHistorial(materias)
			when 2
				materias = @alumno.misInscripciones()
				@vistaSistema.imprimirMensaje("Tus Incripciones son:\n")
				@vistaMateriaController.imprimirMateriasHistorial(materias)
			when 3
				@vistaSistema.imprimirMensaje("Seleccione el indice de la Materia a la cual se quiere inscribir\n")
				seleccionarMateriaParaInscripcion()
			when 4
				@vistaSistema.imprimirMensaje("Seleccione el indice de la Materia a la cual se quiere desinscribir\n")
				seleccionarMateriaParaAnular()
			when 5
				@vistaSistema.imprimirMensaje("Seleccione la materia que va a rendir")
				rendirMateria()
			when 6
				@vistaSistema.imprimirMensaje("Seleccione el indice de la Carrera a la cual se quiere inscribir\n")
				tramitarSimultaneidad()
			when 7
				@vistaSistema.imprimirMensaje()
				cambiarCarreraActual()
			else
				@vistaSistema.imprimirMensaje("Seleccione una Opcion Correcta!\n")
			end
	end
	
	private def pedirCarrerasSinSalida() : Hash(String, Array(Materia))
		listaCarreras = @carreras.keys
		listaMaterias = Hash(String, Array(Materia)).new()
		opcion = ERROR

		@vistaSistema.imprimirCarreras(listaCarreras)
		opcionValida = false
		
		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion <= SALIR || opcion > listaCarreras.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			end
			opcionValida = true
		end

		clave = listaCarreras[opcion-1]

		listaMaterias[clave] ||= Array(Materia).new()
		listaMaterias[clave] = listaMaterias[clave] + @carreras[clave] 

		return listaMaterias

	end
	
	private def pedirCarrerasPermisivo() : Hash(String, Array(Materia))
		listaCarreras = @carreras.keys
		listaMaterias = Hash(String, Array(Materia)).new()
		opcion = ERROR

		@vistaSistema.imprimirCarreras(listaCarreras)
		opcionValida = false
		
		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > listaCarreras.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			elsif opcion == SALIR
				listaMaterias[@alumno.obtenerCarreraActual] = @alumno.obtenerMaterias
				return listaMaterias
			end
			opcionValida = true
		end

		clave = listaCarreras[opcion-1]

		listaMaterias[clave] ||= Array(Materia).new()
		listaMaterias[clave] = listaMaterias[clave] + @carreras[clave] 

		return listaMaterias

	end

	private def seleccionarMateriaParaInscripcion()
		materias = @alumno.misInscripciones()
		@vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		if !@alumno.inscripcion(opcion-1)
			@vistaSistema.imprimirMensaje("No hay mas cupos en esta materia!\n")
		else
			@vistaSistema.imprimirMensaje("Inscripcion valida!\n")
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
		@vistaSistema.imprimirMensaje("Inscripcion anulada!\n")
		
	end

	private def pedirMateria(materias : Array(Materia)) : Int32
		opcionValida = false
		@vistaSistema.imprimirMensaje("Seleccione una materia (o 0 para Salir): ")
		opcion = ERROR

		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > materias.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			else
				opcionValida = true
			end
		end
		return opcion
	end

	private def rendirMateria(materias : Array(Materia))
		@vistaSistema.imprimirMensaje("Seleccione la materia que va a rendir:\n")
		opcion = seleccionarMateriaParaInscripcion()

		@alumno.rendirMateria(opcion)
	end

	private def tramitarSimultaneidad() : Bool
		@vistaSistema.imprimirMensaje("Seleccione una carrera (que no sea la misma) para Inscribirse\n")
		simult = pedirCarrerasPermisivo()

		return @alumno.agregarCarrera(simult)
	end

	private def cambiarCarreraActual() : Bool
		@vistaSistema.imprimirMensaje("Seleccione su carrera actual\n")

		listaCarreras = @alumno.obtenerCarreras()
		if listaCarreras.size == 1
			@vistaSistema.imprimirMensaje("Solo esta cursando una carrera\n")
			return false
		end

		opcion = ERROR

		@vistaSistema.imprimirCarreras(listaCarreras)
		opcionValida = false
		
		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > listaCarreras.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			elsif opcion == SALIR
				return false
			end
			opcionValida = true
		end

		@alumno.modificarCarreraActual(listaCarreras[opcion - 1])
		return true
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