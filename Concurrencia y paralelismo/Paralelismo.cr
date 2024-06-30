# Simula una consulta de datos personales
def consulta_datos_personales(id)
    sleep 2 # Simula el tiempo de espera de la consulta
    puts "Datos personales del alumno #{id}"
  end
  
  # Simula una consulta de inscripciones
  def consulta_inscripciones(id)
    sleep 2 # Simula el tiempo de espera de la consulta
    puts "Inscripciones del alumno #{id}"
  end
  
  # Simula una consulta de calificaciones
  def consulta_calificaciones(id)
    sleep 2 # Simula el tiempo de espera de la consulta
    puts "Calificaciones del alumno #{id}"
  end
  
  # Lista de IDs de alumnos
  ids_alumnos = [1, 2, 3, 4, 5]
  
  # Realiza las consultas en paralelo
  ids_alumnos.each do |id|
    spawn consulta_datos_personales(id)
    spawn consulta_inscripciones(id)
    spawn consulta_calificaciones(id)
  end
  
  # Espera a que todas las fibras terminen
  sleep 3
  