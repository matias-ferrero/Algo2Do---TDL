class VistaMateria

	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end

	def imprimirMateriaInscripcion(indice : Int32,
				       nombre : String,
				       id : String)
		printf "%d) %s (%d)\n", indice, nombre, id
	end

	def imprimirMateriaHistorial(indice : Int32,
				     nombre : String,
				     id : String,
				     nota : Int32)
		printf "%d) %s (%d): %d\n", indice, nombre, id, nota
	end
end