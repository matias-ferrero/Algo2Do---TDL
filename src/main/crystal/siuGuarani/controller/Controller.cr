require "../modelo/Alumno"

class Controller
   # @alumno : Alumno

    def signIn()
        #registrarse
    end

    def logIn()
        #loguearse
    end

    def menuPrincipal()
        opcion : Int32
        case opcion
        when 1
            materias = this.alumno.historiaAcademica()
        when 2
            #mis inscripciones 
        when 3
            # inscribirse 
        when 4
            # anular inscripcion 
        end
    end 
end


