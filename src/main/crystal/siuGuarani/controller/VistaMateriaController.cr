require "../modelo/Materia"

class VistaMateriaController
	@vistaMateria : VistaMateria

	def initialize()
		@vistaMateria = VistaMateria.new()
	end

	def imprimirMateriasInscripcion(materias : Array(Materia))
		this.vistaMateria.imprimirMensaje("Seleccione el indice de la materia a inscribirse\n")
		i = 0
		for materia in materias:
			this.vistaMateria.imprimirMateriaInscripcion(i++,
								     materia.obtenerNombre,
								     materia.obtenerId,
								     materia.obtenerCantInscriptos,
								     materia.obtenerMaxInscriptos)
		end
	end

	def imprimirMateriasHistorial(materias : Array(Materia))
		this.vistaMateria.imprimirMensaje("Tu historial acamedico es:\n")
		i = 0
		for materia in materias:
			this.vistaMateria.imprimirMateriaHistorial(i++,
								   materia.obtenerNombre,
								   materia.obtenerId,
								   materia.obtenerNota)
		end
	end
end