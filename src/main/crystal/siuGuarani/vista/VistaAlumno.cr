require "./Vista"

class VistaAlumno
        include Vista

	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end
end