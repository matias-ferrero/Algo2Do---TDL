require "../modelo/Alumno"
require "../vista/VistaAlumno"

class VistaAlumnoController
	@alumno : Alumno
	@vistaAlumno : VistaAlumno

	def initialize(alumno : Alumno)
		@alumno = alumno
		@vistaAlumno = VistaAlumno.new()	
	end

	def imprimirAlumno()
		@vistaAlumno.imprimirAlumno(@alumno.obtenerNombre(),
					    @alumno.obtenerDni(),
					    @alumno.obtenerPadron(),
					    @alumno.obtenerCarrera())
	end
end