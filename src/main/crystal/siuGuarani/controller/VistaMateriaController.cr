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
end