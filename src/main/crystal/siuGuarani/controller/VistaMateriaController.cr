require "../modelo/Materia"
require "../vista/VistaMateria"


class VistaMateriaController
	@vistaMateria : VistaMateria

	def initialize()
		@vistaMateria = VistaMateria.new()
	end

	def imprimirMateriasInscripcion(materias : Array(Materia))
		@vistaMateria.imprimirMensaje("Seleccione el indice de la materia a inscribirse\n")
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaInscripcion(i+=1,
								 materia.obtenerNombre,
								 materia.obtenerId,
								 materia.obtenerCantInscriptos,
								 materia.obtenerMaxInscriptos)
		end
	end

	def imprimirMateriasHistorial(materias : Array(Materia))
		@vistaMateria.imprimirMensaje("Tu historial acamedico es:\n")
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaHistorial(i+=1,
							       materia.obtenerNombre,
							       materia.obtenerId,
							       materia.obtenerNota)
		end
	end

	def pedirMateria(materias : Array(Materia)) : Int32
		opcionValida = false
		@vistaMateria.imprimirMensaje("Seleccione una materia")
		opcion = ERROR

		while !opcionValida
			opcion = leerInt(gets.to_s.chomp)

			if opcion < SALIR || opcion > materias.size
				@vistaMateria.imprimirMensaje("Seleccione una opcion correcta!")
			else
				opcionValida = true
			end
		end
		return opcion
	end
end