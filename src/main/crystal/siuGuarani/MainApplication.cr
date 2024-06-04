require "./controller/Controller"
require "./modelo/Alumno"

class Main

	def self.main()
		alumno = Alumno.new("Franco Ricciardo", 109907, "Ingenieria en Informatica")
		controlador = Controller.new(alumno)
		while !controlador.salir()
			controlador.menuPrincipal()
		end
	end
end

Main.main