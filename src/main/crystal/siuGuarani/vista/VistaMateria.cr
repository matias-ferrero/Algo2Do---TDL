class VistaMateria
	include Vista

	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end

	def imprimirMateriaInscripcion(indice : Int32,
				       nombre : String,
				       id : Int32,
				       cantInscriptos : Int32,
				       maxInscriptos : Int32)
		printf "%d) %s (%d): %d/%d\n", indice, nombre, id, cantInscriptos, maxInscriptos
	end

	def imprimirMateriaHistorial(indice : Int32,
				     nombre : String,
				     id : Int32,
				     nota : Int32)
		printf "%d) %s (%d): %d\n", indice, nombre, id, nota
	end
end