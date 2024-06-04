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
		#hago cosas
	end
end