class VistaMateria

	def imprimirMateriaInscripcion(indice : Int32,
				       nombre : String,
				       id : String,
				       docente : String)
		printf "%d) %s (%s), Catedra: %s\n", indice, nombre, id, docente
	end

	def imprimirMateriaHistorial(indice : Int32,
				     nombre : String,
				     id : String,
				     nota : Int32)
		printf "%d) %s (%s): %d\n", indice, nombre, id, nota
	end
end