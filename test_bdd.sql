CREATE TABLE IF NOT EXISTS Alumnos(
    id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	dni NUMERIC NOT NULL UNIQUE,
	padron NUMERIC NOT NULL,
	password VARCHAR(100) NOT NULL,
	carrera VARCHAR(100) NOT NULL
)

CREATE TABLE IF NOT EXISTS Materias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo NUMERIC NOT NULL,
	nota NUMERIC NOT NULL DEFAULT 0,
	inscripto BOOL DEFAULT false,
	docente VARCHAR(100),
	cantInscriptos NUMERIC NOT NULL DEFAULT 0,
	maxInscriptos NUMERIC NOT NULL
)
	
CREATE TABLE IF NOT EXISTS Alumnos_Materias(
    alumno_id INT REFERENCES Alumnos(id),
    materia_id INT REFERENCES Materias(id),
    PRIMARY KEY (alumno_id, materia_id)
)