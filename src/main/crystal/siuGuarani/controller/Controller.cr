require "../modelo/Alumno"
require "../modelo/Materia"
require "./VistaMateriaController"
require "../vista/VistaSistema"

class Controller
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
		@vistaSistema.imprimirMensaje("Ingrese su nombre:\n")
		nombre = gets.to_s.chomp

		materias = pedirPrimeraCarrera()
		carreraActual = materias.keys[0]

		return Alumno.new(nombre, materias, carreraActual)
	end

	private def pedirPrimeraCarrera() : Hash(String, Array(Materia))
		listaCarreras = @carreras.keys
		listaMaterias = Hash(String, Array(Materia)).new()
		opcion = SALIR

		@vistaSistema.imprimirCarreras(listaCarreras)
		opcionValida = false
		
		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion <= SALIR || opcion > listaCarreras.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			else
				opcionValida = true
			end
		end

		clave = listaCarreras[opcion-1]

		listaMaterias[clave] ||= Array(Materia).new()
		listaMaterias[clave] = listaMaterias[clave] + @carreras[clave] 

		return listaMaterias

	end

	def menuPrincipal()
		@vistaSistema.mostrarMenu(@alumno.obtenerNombre())
		opcion = leerInt(gets.to_s.chomp)
		
		case opcion
			when SALIR
				@terminado = true
			when 1
				materias = @alumno.historiaAcademica()
				if materias.size > 0
					@vistaSistema.imprimirMensaje("Tu Historia Acamedica es:\n")
					@vistaMateriaController.imprimirMateriasHistorial(materias)
				else
					@vistaSistema.imprimirMensaje("No cursaste ninguna materia!\n")
				end
			when 2
				materias = @alumno.misInscripciones()
				if materias.size > 0
					@vistaSistema.imprimirMensaje("Tus Incripciones son:\n")
					@vistaMateriaController.imprimirMateriasInscripcion(materias)
				else
					@vistaSistema.imprimirMensaje("No estas cursando ninguna materia!\n")
				end
			when 3
				@vistaSistema.imprimirMensaje("Seleccione el indice de la Materia a la cual se quiere inscribir\n")
				seleccionarMateriaParaInscripcion()
			when 4
				@vistaSistema.imprimirMensaje("Seleccione el indice de la Materia a la cual se quiere desinscribir\n")
				seleccionarMateriaParaAnular()
			when 5
				@vistaSistema.imprimirMensaje("Seleccione la materia que va a rendir:\n")
				rendirMateria()
			when 6
				@vistaSistema.imprimirMensaje("Seleccione una Carrera (que no sea la misma) para Inscribirse\n")
				tramitarSimultaneidad()
			when 7
				@vistaSistema.imprimirMensaje("Seleccione en que carrera quiere posicionarse\n")
				cambiarCarreraActual()
			else
				@vistaSistema.imprimirMensaje("Seleccione una Opcion Correcta!\n")
			end
	end

	private def seleccionarMateriaParaInscripcion()
		materias = @alumno.obtenerMaterias()
		@vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		if @alumno.inscripcion(opcion-1)
			@vistaSistema.imprimirMensaje("Inscripcion valida!\n")
		else
			@vistaSistema.imprimirMensaje("Error! Ya estas inscripto en esa materia!\n")
		end
	end

	private def seleccionarMateriaParaAnular()
		materias = @alumno.misInscripciones()
		if materias.size == 0
			@vistaSistema.imprimirMensaje("No estas cursando ninguna materia!\n")
			return
		end

		@vistaMateriaController.imprimirMateriasInscripcion(materias)
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		if @alumno.anularInscripcion(opcion-1)
			@vistaSistema.imprimirMensaje("Inscripcion anulada correctamente!\n")
		else
			@vistaSistema.imprimirMensaje("Error! Hubo un fallo en la anulacion de la inscripcion!\n")
		end
	end

	private def rendirMateria()
		opcionValida = false
		materias = @alumno.misInscripciones()
		if materias.size == 0
			@vistaSistema.imprimirMensaje("No estas cursando ninguna materia!\n")
			return
		end

		@vistaMateriaController.imprimirMateriasInscripcion(materias)

		opcion = SALIR
		opcion = pedirMateria(materias)

		if opcion == SALIR
			return
		end

		nota = SALIR
		nota = pedirNota()

		if nota == SALIR 
			return
		end

		@alumno.rendirMateria(opcion-1, nota)
	end

	private def pedirMateria(materias) : Int32
		opcionValida = false
		@vistaSistema.imprimirMensaje("Seleccione una materia (o 0 para Salir): ")
		opcion = 0

		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > materias.size || opcion.class != Int32
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			else
				opcionValida = true
			end
		end
		return opcion
	end

	private def pedirNota() : Int32
		opcionValida = false
		nota = SALIR
		@vistaSistema.imprimirMensaje("Introduzca la nota correspondiente!\n")
		while !opcionValida
			nota = leerInt(gets.to_s.chomp)

			if nota < SALIR || nota > 10
				@vistaSistema.imprimirMensaje("Introduzca una nota valida, entre 1 y 10 (o 0 para salir)\n")
			else
				opcionValida = true
			end
		end
		return nota
	end

	private def tramitarSimultaneidad()
		nuevaCarrera = pedirSimultaneidad()

		if @alumno.agregarCarrera(nuevaCarrera)
			@vistaSistema.imprimirMensaje("Trámite Aceptado!\n")
		else
			@vistaSistema.imprimirMensaje("Trámite Rechazado! Selecciono la misma carrera que ya se encuentra cursando\n")
		end

	end

	private def pedirSimultaneidad() : Hash(String, Array(Materia))
		listaCarreras = @carreras.keys
		listaMaterias = Hash(String, Array(Materia)).new()
		opcion = SALIR

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

	private def cambiarCarreraActual()
		listaCarreras = @alumno.obtenerCarreras()
		if listaCarreras.size == 1
			@vistaSistema.imprimirMensaje("Solo esta cursando una carrera\n")
			return
		end

		opcion = SALIR

		@vistaSistema.imprimirCarreras(listaCarreras)
		opcionValida = false
		
		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > listaCarreras.size
				@vistaSistema.imprimirMensaje("Seleccione una opcion correcta!\n")
			elsif opcion == SALIR
				return
			end
			opcionValida = true
		end

		@alumno.modificarCarreraActual(listaCarreras[opcion - 1])
		
		seleccionada = @alumno.obtenerCarreraActual
		printf "Carrera Seleccionada: %s\n", seleccionada
	end

	private def leerInt(input : String) : Int32
		default = -1
		begin
			return input.to_i
		rescue
			return default
		end
	end
end