-- tablas base de datos hqr 

--tabla persona


create table "comentario"
  ( "id" bigserial not null,
    "nombre" character varying(150) not null,
    "correo" character varying(150) not null,
    "comentario" character varying(255) not null
    );

create table "persona"
(
"id_persona" bigserial not null,
"correo" character varying(150) not null,
"nombre" character varying(155) not null,
"apellido_paterno" character varying(50) not null,
"apellido_materno" character varying(50),
"telefono_local" character varying(25) not null,
"telefono_movil" character varying(25),
"usuario_id" bigint not null
);


-- tabla cliente
create table "cliente"
(
  "id_cliente" bigserial not null,
  "persona_id" bigint not null,
  "area" character varying(150) not null,
  "puesto" character varying(150) not null,
  "nombre_empresa"character varying(150) not null,
  "habilitado" integer not null
);

-- tabla empleado
create table "empleado"
(
  "id_empleado" bigserial not null,
  "persona_id" bigint not null,
  "direccion" character varying(150) not null, 
  "horas_x_semana" integer not null,
  "carrera" character varying(150) not null, 
  "estado_civil" character varying(25) not null, 
  "numero_hijos" integer not null,
  "fecha_nacimiento" date not null, 
  "antiguedad" character varying(100) not null,
  "sueldo_mensual" character varying(50),
  "sexo" character varying(1) not null,
  "candidato" character varying(1) not null,
  "area" character varying(150) not null,
  "puesto" character varying(150) not null,
  "nombre_empresa"character varying(150) not null, 
  "habilitado" integer not null
);

-- tabla empleado_proyecto
create table "empleado_proyecto"
(
  "id" bigserial not null,
  "empleado_id" bigint not null,
  "proyecto_id" bigint not null,
  "habilitado" integer not null  
);

-- tabla password_token
create table "password_token"
(
  "id_password_token" bigserial not null,
  "usuario_password_token" bigint not null,
  "token_password_token" character varying(100),
  "date_password_token" timestamp not null
);

-- tabla pregunta
create table "pregunta"
(
  "id_pregunta" bigserial not null,
  "nombre_pregunta" character varying(255) not null,
  "habilitado" integer not null
);

-- tabla pregunta_prueba
create table "pregunta_prueba"
(
  "id" bigserial not null, 
  "pregunta_id" bigint not null,
  "prueba_id" bigint not null,
  "numero_pregunta" integer not null
);

-- tabla pregunta_respuesta
create table "pregunta_respuesta"
(
  "id_pregunta_respuesta" bigserial not null,
  "pregunta_id" bigint not null,
  "respuesta_id" bigint not null,
  "puntaje_respuesta" integer not null
);

-- tabla proyecto
create table "proyecto"
(
  "id_proyecto" bigserial not null,
  "cliente_id" bigint not null,
  "nombre_proyecto" character varying(150) not null,
  "descripcion" character varying(255) not null,
  "fecha_inicio" date not null,
  "fecha_fin" date,
  "habilitado" integer not null

);

-- tabla prueba
create table "prueba"
(
  "id_prueba" bigserial not null,
  "nombre_prueba" character varying(100) not null,
  "descripcion_prueba" character varying(255) not null,
  "habilitado" integer not null  
);


-- tabla prueba_cliente
create table "prueba_cliente"
(
  "id" bigserial not null,
  "prueba_id" bigint not null,
  "cliente_id" bigint not null,
  "habilitado" integer not null
  );


-- tabla prueba_proyecto
create table "prueba_proyecto"
(
  "id_prueba_proyecto" bigserial not null,
  "prueba_id" bigint not null,
  "proyecto_id" bigint not null,
  "puntaje_prueba" integer,
  "fecha_creacion" date,
  "habilitado" integer not null    
);

/*
-- tabla prueba_proyecto_token
create table "prueba_proyecto_token"
(
  "id_prueba_proyecto_token" bigserial not null,
  "prueba_token" bigint not null,
  "token_prueba_proyecto_token" character varying(100),
  "date_prueba_proyecto_token" timestamp not null
);
*/

-- tabla prueba_empleado
create table "prueba_empleado"
(
  "id" bigserial not null,
  "empleado_id" bigint not null,
  "prueba_id" bigint not null,
  "puntaje_prueba" double precision not null,
  "fecha_prueba" date not null 

);

-- tabla respuesta
create table "respuesta"
(
  "id_respuesta" bigserial not null,
  "nombre_respuesta" character varying(150) not null,
  "habilitado" integer not null  
);

-- tabla respuesta_empleado
create table "respuesta_empleado"
(
  "id" bigserial not null,
  "pregunta_respuesta_id" bigint not null,  
  "empleado_id" bigint not null
);

-- tabla usuario
create table "usuario"
(
  "id_usuario" bigserial not null,  
  "login_usuario" character varying(50) not null,
  "password_usuario" character varying(100) not null,
  "rol_usuario" character varying(20) not null
);

-- tabla Cliente_empleado
create table "cliente_empleado"
(
  "id_cliente_empleado" bigint not null,
  "cliente_id" bigserial not null,  
  "empleado_id" bigserial not null
 
);


-- LLAVES PRIMARIAS
ALTER TABLE comentario ADD PRIMARY KEY (id);
ALTER TABLE persona ADD PRIMARY KEY (id_persona);
ALTER TABLE cliente ADD PRIMARY KEY (id_cliente);
ALTER TABLE empleado ADD PRIMARY KEY (id_empleado);
ALTER TABLE password_token ADD PRIMARY KEY (id_password_token);
ALTER TABLE pregunta ADD PRIMARY KEY (id_pregunta);
ALTER TABLE pregunta_respuesta ADD PRIMARY KEY (id_pregunta_respuesta);
ALTER TABLE proyecto ADD PRIMARY KEY (id_proyecto);
ALTER TABLE prueba ADD PRIMARY KEY (id_prueba);
ALTER TABLE prueba_proyecto ADD PRIMARY KEY (id_prueba_proyecto);
--ALTER TABLE prueba_proyecto_token ADD PRIMARY KEY (id_prueba_proyecto_token);
ALTER TABLE respuesta ADD PRIMARY KEY (id_respuesta);
ALTER TABLE usuario ADD PRIMARY KEY (id_usuario);
ALTER TABLE cliente_empleado ADD PRIMARY KEY (id_cliente_empleado);
ALTER TABLE respuesta_empleado ADD PRIMARY KEY(id);
ALTER TABLE pregunta_prueba ADD PRIMARY KEY(id);
ALTER TABLE empleado_proyecto ADD PRIMARY KEY(id);
ALTER TABLE prueba_empleado ADD PRIMARY KEY(id);
ALTER TABLE prueba_cliente ADD PRIMARY KEY(id);

-- UNIQUE
ALTER TABLE persona ADD  UNIQUE (correo);
--ALTER TABLE usuario ADD  UNIQUE (login_usuario);


-- LLAVES FORANEAS

ALTER TABLE persona ADD FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario) MATCH FULL;
ALTER TABLE cliente ADD  FOREIGN KEY (persona_id) REFERENCES persona (id_persona) MATCH FULL;
ALTER TABLE empleado ADD  FOREIGN KEY (persona_id) REFERENCES persona (id_persona) MATCH FULL;
ALTER TABLE empleado_proyecto ADD  FOREIGN KEY (empleado_id) REFERENCES empleado (id_empleado) MATCH FULL;
ALTER TABLE empleado_proyecto ADD  FOREIGN KEY (proyecto_id) REFERENCES proyecto (id_proyecto) MATCH FULL;
ALTER TABLE pregunta_respuesta ADD  FOREIGN KEY (pregunta_id) REFERENCES pregunta (id_pregunta) MATCH FULL;
ALTER TABLE pregunta_respuesta ADD  FOREIGN KEY (respuesta_id) REFERENCES respuesta (id_respuesta) MATCH FULL;
ALTER TABLE pregunta_prueba ADD  FOREIGN KEY (pregunta_id) REFERENCES pregunta (id_pregunta) MATCH FULL;
ALTER TABLE pregunta_prueba ADD  FOREIGN KEY (prueba_id) REFERENCES prueba (id_prueba) MATCH FULL;
ALTER TABLE proyecto ADD  FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente) MATCH FULL;
ALTER TABLE prueba_cliente ADD  FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente) MATCH FULL;
ALTER TABLE prueba_cliente ADD  FOREIGN KEY (prueba_id) REFERENCES prueba (id_prueba) MATCH FULL;
ALTER TABLE prueba_proyecto ADD  FOREIGN KEY (prueba_id) REFERENCES prueba (id_prueba) MATCH FULL;
ALTER TABLE prueba_proyecto ADD  FOREIGN KEY (proyecto_id) REFERENCES proyecto (id_proyecto) MATCH FULL;
ALTER TABLE prueba_empleado ADD  FOREIGN KEY (empleado_id) REFERENCES empleado (id_empleado) MATCH FULL;
ALTER TABLE prueba_empleado ADD  FOREIGN KEY (prueba_id) REFERENCES prueba (id_prueba) MATCH FULL;
ALTER TABLE respuesta_empleado ADD  FOREIGN KEY (pregunta_respuesta_id) REFERENCES pregunta_respuesta (id_pregunta_respuesta) MATCH FULL;
ALTER TABLE respuesta_empleado ADD  FOREIGN KEY (empleado_id) REFERENCES empleado (id_empleado) MATCH FULL;
ALTER TABLE password_token ADD  FOREIGN KEY (usuario_password_token) REFERENCES usuario (id_usuario) MATCH FULL;


-- alta administrador
INSERT INTO usuario("login_usuario","password_usuario","rol_usuario") VALUES('admin',md5('+Admin123'),'ROLE_ADMIN');
INSERT INTO persona("correo", "nombre", "apellido_paterno", "apellido_materno", "telefono_local", "telefono_movil", "usuario_id") VALUES('marcoaurelio1655@ciencias.unam.mx', 'Marco', 'Estrada', 'Robles', '57627914', '5568709342', 1);
insert into cliente( "persona_id","area", "puesto", "nombre_empresa", "habilitado")
values(1,'Directivos','Director General','Consultoria Human Quality Research',1);

INSERT INTO usuario("login_usuario","password_usuario","rol_usuario")
VALUES
('aaron',md5('aaron'),'ROLE_CLIENTE'),
('rafa',md5('rafa'),'ROLE_CLIENTE'),
('will01',md5('user'),'ROLE_CLIENTE'),
('hob01',md5('user'),'ROLE_EMPLEADO'),
('fel01',md5('user'),'ROLE_EMPLEADO'),
('mel01',md5('user'),'ROLE_EMPLEADO'),
('gis01',md5('user'),'ROLE_EMPLEADO'),
('bet01',md5('user'),'ROLE_EMPLEADO'),
('bili01',md5('user'),'ROLE_EMPLEADO'),
('kyli01',md5('user'),'ROLE_EMPLEADO'),
('vas01',md5('user'),'ROLE_EMPLEADO'),
('bon01',md5('user'),'ROLE_EMPLEADO');

INSERT INTO cliente("usuario_id","correo", "nombre_cliente","apellido_paterno_cliente","apellido_materno_cliente", "telefono_local", 
            "telefono_movil","area", "puesto", "nombre_empresa","habilitado")
VALUES
 (2,'aaron_guerrero21@ciencias.unam.mx','Aaron', 'Guerrero', 'Hernández.','5512345678','(55) 69-196-7260','Recursos Humanos','Gerente','Banamex',1),
 (3,'phalian360@gmail.com','Rafael', 'Robles', 'Rios.','5715948938','(55) 29-525-6750','Recursos Humanos','Gerente','Barcel',1),
 (4,'convallis@outlook.com','Wilfrido', 'Steven', 'Cruz.','8319 6133','(55) 34-216-1603','Lacus Quisque Imperdiet Industries','Gerente Recursos Humanos','Grupo Jaque',1),
 (5,'arcu.mauris@dropbox.org','Hogan', 'Clinton', 'Hurtado.','3842 6041','(55) 15-274-3113','Odio Sagittis Semper Inc.','Auxiliar Contable','Banamex',1),
 (6,'massa.vitae@segob.edu','Felix', 'Destiny', 'Urrutia.','3737 1747','(55) 02-613-2526','Morbi Foundation','Auxiliar Ventas','Banamex',1),
 (7,'dui.semper@gmail.com','Melton','Alexis','Xomali.','6123 7252','(55) 36-297-6134','Luctus Corp.','Repartidor','Barcel',1),
 (8,'pede@eget.net','Greer',' Buckminster',' opez.','0815 5189','(55) 46-056-3455','Egestas A Consulting','Auxiliar Administrativo','Barcel',1),
 (9,'dui@banamex.com','Benton',' Steven ','Martinez.','6656 8091','(55) 69-041-5631','Nunc Mauris Elit Inc.','Abogado','Grupo Jaque',1),
 (10,'elit@ligula.ca','Bean',' Victor ','Quiroz.','9260 4412','(55) 79-224-5826','Cursus Et Consulting','Mercadotecnia','Grupo Jaque',1),
 (11,'mi_reyc@facebook.org','Irwin',' Chancellor',' James.','0072 9708','(55) 71-958-1095','Nam Ac Nulla Corp.','Gerente de Seguros','Banamex',1),
 (12,'armadura865@hotmail.com','Ware ','Joan ','Montiel.','9198 8504','(55) 30-959-9773','Magna Company','Cajero A','Banamex',1),
 (13,'interdum@comex.org','Bonner',' Talon',' Padilla.','4018 5304','(55) 21-206-1383','Nisl Sem Consequat PC','Cajero B','Banamex',1);


INSERT INTO empleado(cliente_id,direccion,horas_x_semana,carrera,estado_civil,numero_hijos,fecha_nacimiento
  ,antiguedad,sueldo_mensual,sexo,candidato,habilitado)
VALUES 
 (5,'7104 Adipiscing Ctra.',43,'Ingeniería mecánica','casado',0,'2008/12/31','null','11000','M','0',1),
 (6,'716-464 Amet Calle',51,'Estadística','casado',3,'2008/12/31','null','14000','H','1',1),
 (7,'284-2436 Ornare, Carretera',44,'Estadística','soltero',4,'2008/12/31','null','11000','M','0',1),
 (8,'Apdo.:173-8669 Aliquam Carretera',55,'Salud pública','soltero',1,'2008/12/31','null','11000','H','1',1),
 (9,'Apdo.:343-2971 Parturient Avenida',47,'Arquitectura','soltero',1,'2008/12/31','null','13000','H','0',1),
 (10,'8437 Et ',45,'ingeniería civil','casado',2,'2008/12/31','null','11000','H','1',1),
 (11,'195 Auctor ',41,'Salud pública','casado',2,'2008/12/31','null','14000','H','0',1),
 (12,'3747 Fusce ',49,'Historia','soltero',0,'2008/12/31','null','11000','M','1',1),
 (13,'374157 Fusce ',49,'Matematicas','soltero',0,'2008/12/31','null','11500','M','1',1);

 
INSERT INTO proyecto(cliente_id,nombre_proyecto,descripcion,fecha_inicio,fecha_fin,habilitado)
VALUES 
(2,'Proyecto de Banamex','Esto es una prueba del proyecto de Banamex', '2016-01-01','2016-12-31',1),
(3,'Proyecto de Barcel','Esto es una prueba del proyecto de Barcel', '2016-01-01','2016-12-31',1),
(4,'Proyecto de Grupo Jaque','Esto es una prueba del proyecto de Grupo Jaque', '2016-01-01','2016-12-31',1);

INSERT INTO empleado_proyecto(empleado_id,proyecto_id,habilitado)
VALUES (1,1,1),(2,1,1),(3,2,1),(4,2,1),(5,3,1),(6,3,1),(7,1,1),(8,1,1);

INSERT INTO respuesta(nombre_respuesta,habilitado)
VALUES 
('Totalmente de acuerdo',1),
('De acuerdo',1),
('Ni de acuerdo ni en desacuerdo',1),
('En desacuerdo',1),
('Totalmente en desacuerdo',1),
('-5',1),
('-6',1),
('7',1),
('6',1),
('-7',1),
('Sí',1),
('No',1);

INSERT INTO pregunta (nombre_pregunta,habilitado)
VALUES
('No pierdo la concentración cuando se presentan eventos inesperados en mi trabajo.',1),
('Aunque las situaciones no sean estables, soy totalmente competente.',1),
('Es difícil para mí encarar eventos inesperados.',1),
('Me cuesta trabajo ser una persona madura.',1),
('Mi desempeño es igual de bueno en diferentes entornos.',1),
('Tengo agilidad mental.',1),
('Soy una persona madura que sabe cómo actuar en eventos impredecibles.',1),
('Me considero hábil para resolver eventos inesperados.',1),
('Aunque las situaciones en mi trabajo sean inciertas, soy capaz de encararlas.',1),
('Aunque no conozca a fondo la situación en la que me encuentre salgo adelante.',1),
('Me siento entusiasmado cuando me enfrento a un reto difícil de resolver.',1),
('Resuelvo los conflictos de forma eficaz.',1),
('No soy innovador.',1),
('Muchos me consideran una persona cuadrada.',1),
('Soy astuto para salir de los apuros.',1),
('¿Cuál es la respuesta correcta de la siguiente operación 38+21-66?',1),
('Soluciono conflictos hábilmente.',1),
('Me causa desconfianza escuchar a personas que no siguen los pasos específicos necesarios para alcanzar una meta.',1),
('Soy creativo, a menudo se me ocurren diferentes formas de hacer las cosas.',1),
('Encuentro rápidamente respuestas a los problemas.',1),
('Se me dificulta establecer nuevas relaciones personales en la empresa.',1),
('No soy comunicativo.',1),
('Algunas personas dicen que soy irritante.',1),
('La relación con mis compañeros de trabajo es limitada.',1),
('Prefiero estar solo que mal acompañado.',1),
('A veces soy inmaduro en mi trabajo.',1),
('Me enojo muy rápido si alguien me contradice.',1),
('Soy agresivo con aquellos que me provocan.',1),
('Soy tímido, me cuesta trabajo hablar con desconocidos.',1),
('Puedo ser irrespetuoso.',1);

INSERT INTO pregunta (nombre_pregunta,habilitado)
VALUES
('La iluminación es muy buena',1),
('Esta empresa sería una de las primeras en ensayar nuevas ideas',1),
('La variedad no es especialmente importante aqui',1),
('La gente expresa con franqueza lo que piensa',1)
('Aquí es importante realizar mucho trabajo',1),
('El personal se siente libre para solicitar un aumento de sueldo',1),
('Se toman enserio las frases el trabajo antes que el juego',1),
('Los jefes están siempre controlando al personal',1),
('Aqui los colores y la decoración hacen agradable el lugar de trabajo',1),
('Se espera que los empleados cumplan muy estrictamente las reglas y costumbres',1),
('Normalmente el trabajo es muy interesante',1),
('El ambiente está siempre bien ventilado',1),
('El mobiliario esta bien acomodado',1),
('Los jefes son accesibles',1),
('El cambio no importa mucho aqui',1),
('Los jefes supervisan muy estrechamente al personal',1),
('Las condiciones de pago no son claras',1),
('Siempre se exige cumplir con las metas',1),
('El amiente me gusta',1),
('Aqui se trbaja intensamente',1);


INSERT INTO pregunta_respuesta (pregunta_id,respuesta_id,puntaje_respuesta)
VALUES (31,1,1),(31,2,2),(31,11,3),(31,3,4),(31,4,5),(31,5,6),
       (32,1,1),(32,2,2),(32,11,3),(32,3,4),(32,4,5),(32,5,6),
       (33,1,1),(33,2,2),(33,11,3),(33,3,4),(33,4,5),(33,5,6),
       (34,1,1),(34,2,2),(34,11,3),(34,3,4),(34,4,5),(34,5,6),
       (35,1,1),(35,2,2),(35,11,3),(35,3,4),(35,4,5),(35,5,6),
       (36,1,1),(36,2,2),(36,11,3),(36,3,4),(36,4,5),(36,5,6),
       (37,1,1),(37,2,2),(37,11,3),(37,3,4),(37,4,5),(37,5,6),
       (38,1,1),(38,2,2),(38,11,3),(38,3,4),(38,4,5),(38,5,6),
       (39,1,1),(39,2,2),(39,11,3),(39,3,4),(39,4,5),(39,5,6),
       (40,1,1),(40,2,2),(40,11,3),(40,3,4),(40,4,5),(40,5,6),
       (41,1,1),(41,2,2),(41,11,3),(41,3,4),(41,4,5),(41,5,6),
       (42,1,1),(42,2,2),(42,11,3),(42,3,4),(42,4,5),(42,5,6),
       (43,1,1),(43,2,2),(43,11,3),(43,3,4),(43,4,5),(43,5,6),
       (44,1,1),(44,2,2),(44,11,3),(44,3,4),(44,4,5),(44,5,6),
       (45,1,1),(45,2,2),(45,11,3),(45,3,4),(45,4,5),(45,5,6),
       (46,1,1),(46,2,2),(46,11,3),(46,3,4),(46,4,5),(46,5,6),
       (47,1,1),(47,2,2),(47,11,3),(47,3,4),(47,4,5),(47,5,6),
       (48,1,1),(48,2,2),(48,11,3),(48,3,4),(48,4,5),(48,5,6),
       (49,1,1),(49,2,2),(49,11,3),(49,3,4),(49,4,5),(49,5,6),
       (50,1,1),(50,2,2),(50,11,3),(50,3,4),(50,4,5),(50,5,6);


INSERT INTO pregunta_respuesta (pregunta_id,respuesta_id, puntaje_respuesta)
VALUES
(1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),
(2,1,1),(2,2,2),(2,3,3),(2,4,4),(2,5,5),
(3,1,5),(3,2,4),(3,3,3),(3,4,2),(3,5,1),
(4,1,5),(4,2,4),(4,3,3),(4,4,2),(4,5,1),
(5,1,1),(5,2,2),(5,3,3),(5,4,4),(5,5,5),
(6,1,1),(6,2,2),(6,3,3),(6,4,4),(6,5,5),
(7,1,1),(7,2,2),(7,3,3),(7,4,4),(7,5,5),
(8,1,1),(8,2,2),(8,3,3),(8,4,4),(8,5,5),
(9,1,1),(9,2,2),(9,3,3),(9,4,4),(9,5,5),
(10,1,1),(10,2,2),(10,3,3),(10,4,4),(10,5,5),
(11,1,1),(11,2,2),(11,3,3),(11,4,4),(11,5,5),
(12,1,1),(12,2,2),(12,3,3),(12,4,4),(12,5,5),
(13,1,5),(13,2,4),(13,3,3),(13,4,2),(13,5,1),
(14,1,5),(14,2,4),(14,3,3),(14,4,2),(14,5,1),
(15,1,1),(15,2,2),(15,3,3),(15,4,4),(15,5,5),
(16,6,1),(16,7,2),(16,8,3),(16,9,4),(16,10,5),
(17,1,1),(17,2,2),(17,3,3),(17,4,4),(17,5,5),
(18,1,5),(18,2,4),(18,3,3),(18,4,2),(18,5,1),
(19,1,1),(19,2,2),(19,3,3),(19,4,4),(19,5,5),
(20,1,1),(20,2,2),(20,3,3),(20,4,4),(20,5,5),
(21,1,5),(21,2,4),(21,3,3),(21,4,2),(21,5,1),
(22,1,5),(22,2,4),(22,3,3),(22,4,2),(22,5,1),
(23,1,5),(23,2,4),(23,3,3),(23,4,2),(23,5,1),
(24,1,5),(24,2,4),(24,3,3),(24,4,2),(24,5,1),
(25,1,5),(25,2,4),(25,3,3),(25,4,2),(25,5,1),
(26,1,5),(26,2,4),(26,3,3),(26,4,2),(26,5,1),
(27,1,5),(27,2,4),(27,3,3),(27,4,2),(27,5,1),
(28,1,5),(28,2,4),(28,3,3),(28,4,2),(28,5,1),
(29,1,5),(29,2,4),(29,3,3),(29,4,2),(29,5,1),
(30,1,5),(30,2,4),(30,3,3),(30,4,2),(30,5,1);




INSERT INTO prueba(nombre_prueba,descripcion_prueba,habilitado)VALUES('Adaptabilidad laboral','Esta prueba es para la posibilidad de adaptarse a un nuevo entorno de trabajo',1);

INSERT INTO prueba(nombre_prueba, descripcion_prueba, habilitado)VALUES('Clima laboral', 'A continuación, encontrará unas frases relacionadas con el trabajo. Están pensadas para distintos ambientes laborales, pero puede que no se ajusten del todo al lugar donde trabaja. Trate de acomodarlas a su propio caso.',1);

INSERT INTO pregunta_prueba(pregunta_id,prueba_id,numero_pregunta)
VALUES 
(1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),
(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),
(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),
(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),
(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),
(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30);

INSERT INTO pregunta_prueba(pregunta_id,prueba_id,numero_pregunta)
VALUES 
(31,2,1),(32,2,2),(33,2,3),(34,2,4),(35,2,5),
(36,2,6),(37,2,7),(38,2,8),(39,2,9),(40,2,10),
(41,2,11),(42,2,12),(43,2,13),(44,2,14),(45,2,15),
(46,2,16),(47,2,17),(48,2,18),(49,2,19),(50,2,20);

INSERT INTO prueba_cliente(cliente_id,prueba_id,habilitado)
VALUES
(2,1,1),(3,1,1),(4,1,1);

INSERT INTO prueba_proyecto(prueba_id,proyecto_id,fecha_creacion,puntaje_prueba,habilitado)
VALUES
(1,1,'2016-01-01',10,1);

INSERT INTO cliente_empleado(id_cliente_empleado,cliente_id,empleado_id) 	
VALUES(1,2,5),(2,3,6),(3,4,7),(4,2,8),(5,3,9),(6,4,10);
select persona.nombre, persona.apellido_paterno, pru.nombre_prueba, p.nombre_pregunta, r.nombre_respuesta from respuesta r join pregunta_respuesta pr on pr.respuesta_id = r.id_respuesta join
pregunta p on p.id_pregunta = pr.pregunta_id join pregunta_prueba pp on pp.pregunta_id = p.id_pregunta join prueba pru on
pru.id_prueba = pp.prueba_id join respuesta_empleado res on res.pregunta_respuesta_id = pr.id_pregunta_respuesta join empleado emp on
emp.id_empleado = res.empleado_id join persona on persona.id_persona = emp.persona_id;


select persona.nombre as nombre, persona.apellido_paterno as apellido, pru.nombre_prueba as prueba, p.nombre_pregunta as pregunta, r.nombre_respuesta as respuesta 
from respuesta r join pregunta_respuesta pr on pr.respuesta_id = r.id_respuesta join
pregunta p on p.id_pregunta = pr.pregunta_id join pregunta_prueba pp on pp.pregunta_id = p.id_pregunta join prueba pru on
pru.id_prueba = pp.prueba_id join respuesta_empleado res on res.pregunta_respuesta_id = pr.id_pregunta_respuesta join empleado emp on
emp.id_empleado = res.empleado_id join persona on persona.id_persona = emp.persona_id;


select * from crosstab('SELECT id_respuesta, nombre_respuesta, habilitado from respuesta') as ct ("Totalmente de acuerdo" text);
