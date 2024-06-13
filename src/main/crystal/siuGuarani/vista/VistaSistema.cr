class VistaSistema

    	def imprimirMensaje(mensaje : String)
		printf "%s", mensaje
	end

	def mostrarMenu(nombre : String)
		printf "\n%s seleccione una opcion:\n", nombre
		printf "1 : Ver Campo\n" 
		printf "2 : Usar Habilidad\n"
		printf "3 : Usar Item\n"
		printf "4 : Cambiar Pokemon\n"
		printf "5 : Rendirse\n"
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