require "../modelo/Materia"
require "../vista/VistaMateria"


class VistaMateriaController
	@vistaMateria : VistaMateria

	def initialize()
		@vistaMateria = VistaMateria.new()
	end

	def imprimirMateriasInscripcion(materias)
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaInscripcion(i+=1,
								 materia.obtenerNombre,
								 materia.obtenerId,
								 materia.obtenerDocente)
		end
	end

	def imprimirMateriasHistorial(materias)
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaHistorial(i+=1,
							       materia.obtenerNombre,
							       materia.obtenerId,
							       materia.obtenerNota)
		end
	end

	def inicializarMaterias() : Hash(String, Array(Materia))
		carreras = Hash(String, Array(Materia)).new()

		carreras["Informatica"] ||= Array(Materia).new()
		carreras["Informatica"] << Materia.new("Analisis Matematico II", "CB001", "Martin Maulhardt")
		carreras["Informatica"] << Materia.new("Fundamentos de Programacion", "TB021", "Diego Essaya")
		carreras["Informatica"] << Materia.new("Introduccion al Desarrollo de Software", "TB022", "Manuel Camejo")
		carreras["Informatica"] << Materia.new("Algebra Lineal", "CB002", "Gabriela Vargas")
		carreras["Informatica"] << Materia.new("Organizacion del Computador", "TB023", "Edgardo Marchi")
		carreras["Informatica"] << Materia.new("Algoritmos y Estructuras de Datos", "CB100", "Lucas Pandolfo")
		carreras["Informatica"] << Materia.new("Probabilidad y Estadistica", "CB003", "Silvia Perez")
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
		carreras["Sistemas"] << Materia.new("Analisis Matematico II", 8101, "Martin Maulhardt")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion I", 9514, "Diego Essaya")
		carreras["Sistemas"] << Materia.new("Algebra II", 8102, "Gabriela Vargas")
		carreras["Sistemas"] << Materia.new("Matematica Discreta", 8111, "Fernando Acero")
		carreras["Sistemas"] << Materia.new("Organizacion del Computador", 9557, "Edgardo Marchi")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion II", 9515, "Lucas Pandolfo")
		carreras["Sistemas"] << Materia.new("Organizacion de Datos", 9558, "Juan Manuel Rodriguez")
		carreras["Sistemas"] << Materia.new("Probabilidad y Estadistica", 8104, "Silvia Perez")
		carreras["Sistemas"] << Materia.new("Algoritmos y Programacion III", 9502, "Matias Cano")
		carreras["Sistemas"] << Materia.new("Estructuras y Procesos Organizacionales", 9139, "Adriana Galli")
		carreras["Sistemas"] << Materia.new("Taller de Programacion", 9508, "Pablo Deymonnaz")
		carreras["Sistemas"] << Materia.new("Sistemas Operativos", 9503, "Mariano Mendez")
		carreras["Sistemas"] << Materia.new("Economia de las Organizaciones", 9149, "Luis Yomha")
		carreras["Sistemas"] << Materia.new("Metodos y Modelos de la Ingenieria de Software I", 9520, "Sergio Vilagra")
		carreras["Sistemas"] << Materia.new("Base de Datos", 9505, "Alberto Fasce")
		carreras["Sistemas"] << Materia.new("Modelos y Optimizacion I", 9104, "Pablo Echevarria")
		carreras["Sistemas"] << Materia.new("Administracion de las Organizaciones", 9142, "Miguel Angel Bilello")
		carreras["Sistemas"] << Materia.new("Metodos y Modelos de la Ingenieria de Software II", 9520, "Sergio Vilagra")
		carreras["Sistemas"] << Materia.new("Modelos y Optimizacion II", 9105, "Claudia Gioscio")
		carreras["Sistemas"] << Materia.new("Administracion y Control de Proyectos Informaticos I", 9524, "Moises Fontela")
		carreras["Sistemas"] << Materia.new("Redes y Aplicaciones Distribuidas I", 9560, "Jose Ignacio Alvarez")
		carreras["Sistemas"] << Materia.new("Diseño, Operacion y Gestion de Servicios Informaticos", 9559, "Gustavo Carolo")
		carreras["Sistemas"] << Materia.new("Legislacion y Ejercicio Profesional en Sistemas e Informatica", 9140, "Adrian Noremberg")
		carreras["Sistemas"] << Materia.new("Estandares de Calidad y Modelos de Referencia", 9530, "Diego Fontdevila")
		carreras["Sistemas"] << Materia.new("Trabajo Profesional de Licenciatura de Analisis en Sistemas", "TA052", "A Designar")

		carreras["Quimica"] ||= Array(Materia).new()
		carreras["Quimica"] << Materia.new("Analisis Matematico II", "CB001", "Martin Maulhardt")
		carreras["Quimica"] << Materia.new("Quimica General", "CB103", "Ana Fossati")
		carreras["Quimica"] << Materia.new("Introduccion a Ingenieria Quimica", "TB087", "Pablo Ippolito")
		carreras["Quimica"] << Materia.new("Algebra Lineal", "CB002", "Gabriela Vargas")
		carreras["Quimica"] << Materia.new("Fisica de los Sistemas de Particulas", "CB020", "David Rossi")
		carreras["Quimica"] << Materia.new("Quimica Inorganica", "TB088", "Maria Debandi")
		carreras["Quimica"] << Materia.new("Fundamentos de Procesos Quimicos", "TB089", "Edgardo Alma")
		carreras["Quimica"] << Materia.new("Electricidad y Magnetismo", "CB022", "Marcelo Fontana")
		carreras["Quimica"] << Materia.new("Optica", "CB021", "A Designar")
		carreras["Quimica"] << Materia.new("Modelacion Numerica", "CB051", "Daniel Griggio")
		carreras["Quimica"] << Materia.new("Termoodinamica de los Procesos", "TB090", "Beatriz Irigoyen")
		carreras["Quimica"] << Materia.new("Quimica Organica", "TB091", "Miriam Martins")
		carreras["Quimica"] << Materia.new("Probabilidad y Estadistica", "CB003", "Silvia Perez")
		carreras["Quimica"] << Materia.new("Fenomenos de Transporte", "TA161", "Mabel Agaliotis")
		carreras["Quimica"] << Materia.new("Operaciones Unitarias de Transferencia de Cantidad de Movimiento y Energia", "TA162", "Jose Martucci")
		carreras["Quimica"] << Materia.new("Quimica Fisica", "TB092", "Adrian Razzitte")
		carreras["Quimica"] << Materia.new("Introduccion a la Ciencia de Datos", "CB050", "Manuel Camejo")
		carreras["Quimica"] << Materia.new("Quimica Analitica Instrumental", "TB093", "Maria Piol")
		carreras["Quimica"] << Materia.new("Laboratorio de Operaciones y Procesos", "TA163", "Mauricio Chocron")
		carreras["Quimica"] << Materia.new("Operaciones Unitarias de Transferencia de Materia", "TA164", "Aude Vergenie")
		carreras["Quimica"] << Materia.new("Instalacion de Plantas de Procesos", "TA165", "Lautaro Gelso")
		carreras["Quimica"] << Materia.new("Diseño de Reactores", "TA166", "Maria Dieuzeide")
		carreras["Quimica"] << Materia.new("Dinamica y Control de Procesos", "TA167", "Anibal Zanini")
		carreras["Quimica"] << Materia.new("Evaluacion de Proyectos de Plantas Quimicas", "TC026", "Juan Pablo Medina")
		carreras["Quimica"] << Materia.new("Ingenieria de Bioprocesos", "TA168", "Fernando Mariño")
		carreras["Quimica"] << Materia.new("Diseño de Procesos", "TA169", "Beatriz Fernandez")
		carreras["Quimica"] << Materia.new("Trabajo Profesional de Ingenieria Quimica", "TA170", "Marcelo Rollhaiser")
		carreras["Quimica"] << Materia.new("Emisiones de Contaminantes Quimicos y Biologicos", "TC027", "Daniela Santagata")
		carreras["Quimica"] << Materia.new("Legislacion y Ejercicio Profesional", "TC002", "Hector Papaleo")
		return carreras
	end
end