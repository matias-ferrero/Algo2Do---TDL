class VistaSistema

    	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end

	def mostrarMenu(nombre : String)
		printf "\n%s seleccione una opcion:\n", nombre
		printf "1 : Historia Academica\n" 
		printf "2 : Mis Inscripciones\n"
		printf "3 : Inscribirme a una Materia\n"
		printf "4 : Anular una Inscripcion a Materia\n"
		printf "5 : Tramitar Simultaneidad con otra Carrera\n"
		printf "0 : Salir\n"
	end

	def imprimirCarreras(nombres : Array(String))
		printf "\nSeleccione una opcion:\n"
		i = 1
		nombres.each do |nombre|
			printf "%d) %s\n", i, nombre
			i += 1
		end
	end
end