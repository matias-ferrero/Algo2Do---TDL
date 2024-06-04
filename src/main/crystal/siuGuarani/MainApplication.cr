require "../controller/Controller"

class Main

	def main()
		controlador = Controller.new()
		while !controlador.salir()
			controlador.menuPrincipal()
		end
	end
end