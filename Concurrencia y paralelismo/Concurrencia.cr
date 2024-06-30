# Definimos una estructura para representar las solicitudes de inscripción
struct Inscripcion
    property alumno_id : Int32
    property curso_id : Int32
  
    def initialize(@alumno_id : Int32, @curso_id : Int32)
    end
  end
  
  # Método para simular el procesamiento de una solicitud de inscripción
  def procesar_inscripcion(inscripcion : Inscripcion)
    puts "Procesando inscripción del alumno #{inscripcion.alumno_id} al curso #{inscripcion.curso_id}"
    # Simulamos un tiempo de procesamiento
    sleep 2.seconds
    puts "Inscripción completada para el alumno #{inscripcion.alumno_id} al curso #{inscripcion.curso_id}"
  end
  
  # Canal para manejar las solicitudes de inscripción
  channel = Channel(Inscripcion).new
  
  # Fiber para procesar las solicitudes de inscripción
  spawn do
    while inscripcion = channel.receive
      procesar_inscripcion(inscripcion)
    end
  end
  
  # Simulamos la recepción de solicitudes de inscripción
  5.times do |i|
    inscripcion = Inscripcion.new(i, 101)
    channel.send(inscripcion)
    puts "Solicitud de inscripción recibida para el alumno #{i}"
  end
  
  # Esperamos un tiempo para asegurarnos de que todas las inscripciones sean procesadas
  sleep 10.seconds
