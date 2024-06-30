class VistaMateria

	def imprimirMateriaInscripcion(indice, nombre, id : String, docente)
		printf "%d) %s (%s), Catedra: %s\n", indice, nombre, id, docente
	end

	def imprimirMateriaInscripcion(indice, nombre, id, docente)
		printf "%d) %s (%d), Catedra: %s\n", indice, nombre, id, docente
	end

	def imprimirMateriaHistorial(indice, nombre, id : String, nota)
		printf "%d) %s (%s): %d\n", indice, nombre, id, nota
	end

	def imprimirMateriaHistorial(indice, nombre, id, nota)
		printf "%d) %s (%d): %d\n", indice, nombre, id, nota
	end
end