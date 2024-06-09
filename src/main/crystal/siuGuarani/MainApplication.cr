require "./controller/Controller"
require "./modelo/Alumno"
#require "granite_orm"
require "../../../../lib/granite_orm/src/granite_orm"

class Main

	def self.main()
		alumno = Alumno.new("Franco Ricciardo", 44626243, 109907, "Ingenieria en Informatica")
		controlador = Controller.new(alumno)
		while !controlador.salir()
			controlador.menuPrincipal()
		end
	end
end

Main.main