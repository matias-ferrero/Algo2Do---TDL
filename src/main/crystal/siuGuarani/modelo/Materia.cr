class Materia
    @nombre : String 
    @id : Int32 
#    @cursos: ??
    @inscriptos : Int32 
    @maxInscriptos : Int32 


    def initialize(nombre : String, id : Int32, inscriptos : Int32)
		@nombre = nombre
		@id = id
		@inscriptos = 0
        @maxInscriptos = 0
	end


end