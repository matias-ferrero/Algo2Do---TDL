require "./Vista"

class VistaAlumno
        include Vista

	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end

	def imprimirAlumno(nombre : String,
			   dni : Int32,
			   padron : Int32,
			   carrera : String)
		printf "Nombre: %s \nUsuario: %d \nPadron: %d \nCarrera: %s\n", nombre,
										dni,
										padron,
										carrera
	end
end