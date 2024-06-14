require "../modelo/Materia"
require "../vista/VistaMateria"


class VistaMateriaController
	@vistaMateria : VistaMateria

	def initialize()
		@vistaMateria = VistaMateria.new()
	end

	def imprimirMateriasInscripcion(materias : Array(Materia))
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaInscripcion(i+=1,
								 materia.obtenerNombre,
								 materia.obtenerId)
		end
	end

	def imprimirMateriasHistorial(materias : Array(Materia))
		i = 0
		materias.each do |materia|
			@vistaMateria.imprimirMateriaHistorial(i+=1,
							       materia.obtenerNombre,
							       materia.obtenerId,
							       materia.obtenerNota)
		end
	end

end