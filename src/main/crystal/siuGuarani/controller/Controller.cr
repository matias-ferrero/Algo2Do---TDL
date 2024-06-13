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
		@carreras = inicializarCarreras()
		@vistaSistema = VistaSistema.new()
		@vistaMateriaController = VistaMateriaController.new()
		@terminado = false
		@alumno = signUp()
		puts "Termino el constructor"#TODO: Eliminar comentario
	end

	def salir() : Bool
		return @terminado
	end

	def signUp() : Alumno
		@vistaSistema.imprimirMensaje("Ingrese su nombre\n")
		nombre = gets.to_s.chomp
		materias = pedirCarreras()
		return Alumno.new(nombre, materias, "carreraActual") # <- TODO Funcion para Setear carreraActual
	end
	
	def menuPrincipal()
		puts "Entre al menu principal\n"

		@vistaSistema.mostrarMenu(@alumno.obtenerNombre())
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

	private def inicializarCarreras() : Hash(String, Array(Materia))
		carreras = Hash(String, Array(Materia)).new()

		carreras["Informatica"] ||= Array(Materia).new()
		carreras["Informatica"] << Materia.new("Analisis Matematico II", "CB001", "Martin Maulhardt")
		carreras["Informatica"] << Materia.new("Fundamentos de Programacion", "TB021", "Diego Essaya")
		carreras["Informatica"] << Materia.new("Introduccion al Desarrollo de Software", "TB022", "Manuel Camejo")
		carreras["Informatica"] << Materia.new("Algebra Lineal", "CB002", "Gabriela Vargas")
		carreras["Informatica"] << Materia.new("Organizacion del Computador", "TB023", "Edgardo Marchi")
		carreras["Informatica"] << Materia.new("Algoritmos y Estructuras de Datos", "CB100", "Lucas Pandolfo")
		carreras["Informatica"] << Materia.new("Probabilidad y Estadistica B", "CB003", "Silvia Perez")
		carreras["Informatica"] << Materia.new("Teoria de Algoritmos", "TB024", "Martin Buchwald")
		carreras["Informatica"] << Materia.new("Paradigmas de Programacion", "TB025", "Matias Cano")
		carreras["Informatica"] << Materia.new("Sistemas Operativos", "TA043", "Mariano Mendez")
		carreras["Informatica"] << Materia.new("Base de Datos", "TA044", "Alberto Fasce")
		carreras["Informatica"] << Materia.new("Modelacion Numerica", "CB051", "Daniel Griggio")
		carreras["Informatica"] << Materia.new("Taller de Programacion", "TA045", "Pablo Deymonnaz")
		carreras["Informatica"] << Materia.new("Ingenieria de Software I", "TA046", "Norberto Gonzalez")
		carreras["Informatica"] << Materia.new("Ciencia de Datos", "TA047", "Juan Manuel Rodriguez")
		carreras["Informatica"] << Materia.new("Gestion del Desarrollo de Sistemas Informaticos", "TC017", "Moises Fontela")
		carreras["Informatica"] << Materia.new("Programacion Concurrente", "TB026", "Pablo Deymonnaz")
		carreras["Informatica"] << Materia.new("Redes", "TA048", "Jose Ignacio Alvarez")
		carreras["Informatica"] << Materia.new("Fisica Para Informaticos", "CB024", "Claudia Matteo")
		carreras["Informatica"] << Materia.new("Empresas de Base Tecnologica I", "TC018", "Andres Godoy")
		carreras["Informatica"] << Materia.new("Ingenieria de Software I", "TA049", "Nicolas Paez")
		carreras["Informatica"] << Materia.new("Sistemas Distribuidos I", "TA050", "Pablo Roca")
		carreras["Informatica"] << Materia.new("Taller de Seguridad Informatica", "TA051", "A Designar")
		carreras["Informatica"] << Materia.new("Empresas de Base Tecnologica II", "TC019", "A Designar")
		carreras["Informatica"] << Materia.new("Tesis de Ingenieria en Informatica", "TA052", "A Designar")

		carreras["Sistemas"] ||= Array(Materia).new()
		carreras["Sistemas"] << Materia.new("Analisis Matematico II", "8101", "Martin Maulhardt")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion I", "9514", "Diego Essaya")
		carreras["Sistemas"] << Materia.new("Algebra II", "8102", "Gabriela Vargas")
		carreras["Sistemas"] << Materia.new("Matematica Discreta", "8111", "Fernando Acero")
		carreras["Sistemas"] << Materia.new("Organizacion del Computador", "9557", "Edgardo Marchi")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion II", "9515", "Lucas Pandolfo")
		carreras["Sistemas"] << Materia.new("Organizacion de Datos", "9558", "Juan Manuel Rodriguez")
		carreras["Sistemas"] << Materia.new("Probabilidad y Estadistica B", "8104", "Silvia Perez")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion III", "9502", "Matias Cano")
		carreras["Sistemas"] << Materia.new("Estructuras y Procesos Organizacionales", "9139", "Adriana Galli")
		carreras["Sistemas"] << Materia.new("Taller de Programacion", "9508", "Pablo Deymonnaz")
		carreras["Sistemas"] << Materia.new("Sistemas Operativos", "9503", "Mariano Mendez")
		carreras["Sistemas"] << Materia.new("Economia de las Organizaciones", "9149", "Luis Yomha")
		carreras["Sistemas"] << Materia.new("Metodos y Modelos de la Ingenieria de Software I", "9520", "Sergio Vilagra")
		carreras["Sistemas"] << Materia.new("Base de Datos", "9505", "Alberto Fasce")
		carreras["Sistemas"] << Materia.new("Modelos y Optimizacion I", "9104", "Pablo Echevarria")
		carreras["Sistemas"] << Materia.new("Administracion de las Organizaciones", "9142", "Miguel Angel Bilello")
		carreras["Sistemas"] << Materia.new("Metodos y Modelos de la Ingenieria de Software II", "9520", "Sergio Vilagra")
		carreras["Sistemas"] << Materia.new("Modelos y Optimizacion II", "9105", "Claudia Gioscio")
		carreras["Sistemas"] << Materia.new("Administracion y Control de Proyectos Informaticos I", "9524", "Moises Fontela")
		carreras["Sistemas"] << Materia.new("Redes y Aplicaciones Distribuidas I", "9560", "Jose Ignacio Alvarez")
		carreras["Sistemas"] << Materia.new("Diseño, Operacion y Gestion de Servicios Informaticos", "9559", "Gustavo Carolo")
		carreras["Sistemas"] << Materia.new("Legislacion y Ejercicio Profesional en Sistemas e Informatica", "9140", "Adrian Noremberg")
		carreras["Sistemas"] << Materia.new("Estandares de Calidad y Modelos de Referencia", "9530", "Diego Fontdevila")
		carreras["Sistemas"] << Materia.new("Trabajo Profesional de Licenciatura de Analisis en Sistemas", "TA052", "A Designar")
		
		return carreras
	end
	
	private def pedirCarreras() : Hash(String, Array(Materia))
		listaCarreras = @carreras.keys
		listaMaterias = Hash(String, Array(Materia)).new()

		@vistaSistema.imprimirCarreras(listaCarreras)

		opcion = leerInt(gets.to_s.chomp)
		clave = listaCarreras[opcion-1]

		listaMaterias[clave] ||= Array(Materia).new()
		listaMaterias[clave] = listaMaterias[clave] + @carreras[clave] 

		return listaMaterias

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