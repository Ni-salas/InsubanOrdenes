-- ELIMINACIÓN DE TABLAS
DROP TABLE OrdenCompra CASCADE CONSTRAINTS;
DROP TABLE Proveedor CASCADE CONSTRAINTS;
DROP TABLE Solicitante CASCADE CONSTRAINTS;
DROP TABLE Comuna CASCADE CONSTRAINTS;
DROP TABLE TpVenta CASCADE CONSTRAINTS;

------------------------------------------------------------------------------------------------

-- CREACIÓN DE TABLAS

-- Tabla: Comuna
CREATE TABLE Comuna (
    cod_comuna NUMBER(2) GENERATED ALWAYS AS IDENTITY
        START WITH 1 INCREMENT BY 1 PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL
);

-- Tabla: TpVenta
CREATE TABLE TpVenta (
    cod_venta NUMBER(2) GENERATED ALWAYS AS IDENTITY
        START WITH 1 INCREMENT BY 1 PRIMARY KEY,
    descripcion VARCHAR2(30) NOT NULL
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    id_proveedor NUMBER GENERATED ALWAYS AS IDENTITY
        START WITH 1 INCREMENT BY 1 PRIMARY KEY,
    rut VARCHAR2(8) UNIQUE NOT NULL,
    dv_rut CHAR(1) NOT NULL,
    nombre VARCHAR2(60) NOT NULL,
    direccion VARCHAR2(60),
    email VARCHAR2(60),
    telefono NUMBER(13),
    vendedor VARCHAR2(60),
    TpVenta_cod_venta NUMBER(2) NOT NULL,
    Comuna_cod_comuna NUMBER(2) NOT NULL,
    CONSTRAINT Proveedor_TpVenta_FK FOREIGN KEY (TpVenta_cod_venta) REFERENCES TpVenta(cod_venta),
    CONSTRAINT Proveedor_Comuna_FK FOREIGN KEY (Comuna_cod_comuna) REFERENCES Comuna(cod_comuna)
);

-- Tabla: Solicitante
CREATE TABLE Solicitante (
    cod_solic NUMBER(2) GENERATED ALWAYS AS IDENTITY
        START WITH 1 INCREMENT BY 1 PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    telefono NUMBER(9) NOT NULL,
    email VARCHAR2(30) NOT NULL
);

-- Tabla: OrdenCompra
CREATE TABLE OrdenCompra (
    num_orden NUMBER(9) PRIMARY KEY,
    insumo VARCHAR2(30) NOT NULL,
    cantidad NUMBER(6) NOT NULL,
    precio NUMBER(6) NOT NULL,
    Proveedor_rut VARCHAR2(8) NOT NULL,
    Solicitante_cod_solic NUMBER(2) NOT NULL,
    CONSTRAINT OrdenCompra_Proveedor_FK FOREIGN KEY (Proveedor_rut) REFERENCES Proveedor(rut),
    CONSTRAINT OrdenCompra_Solicitante_FK FOREIGN KEY (Solicitante_cod_solic) REFERENCES Solicitante(cod_solic)
);

------------------------------------------------------------------------------------------------

-- Insertar Informacion en COMUNA
INSERT INTO Comuna (nombre) VALUES ('San Miguel');
INSERT INTO Comuna (nombre) VALUES ('Quinta Normal');
INSERT INTO Comuna (nombre) VALUES ('Santiago');
INSERT INTO Comuna (nombre) VALUES ('Las Condes');
INSERT INTO Comuna (nombre) VALUES ('Huechuraba');
INSERT INTO Comuna (nombre) VALUES ('San Joaquin');
INSERT INTO Comuna (nombre) VALUES ('La Cisterna');
INSERT INTO Comuna (nombre) VALUES ('Quilicura');
INSERT INTO Comuna (nombre) VALUES ('El Bosque');
INSERT INTO Comuna (nombre) VALUES ('Pudahuel');
INSERT INTO Comuna (nombre) VALUES ('Providencia');
INSERT INTO Comuna (nombre) VALUES ('Lampa');
INSERT INTO Comuna (nombre) VALUES ('Macul');
INSERT INTO Comuna (nombre) VALUES ('Cerrillos');
INSERT INTO Comuna (nombre) VALUES ('Maipu');
INSERT INTO Comuna (nombre) VALUES ('Recoleta');

-- Insertar Informacion en Tipo de Venta (TpVenta)
INSERT INTO TpVenta (descripcion) VALUES ('Contado');
INSERT INTO TpVenta (descripcion) VALUES ('Credito');
INSERT INTO TpVenta (descripcion) VALUES ('Efectivo');
INSERT INTO TpVenta (descripcion) VALUES ('Cheque');

-- Insertar Informacion en Tipo de Venta (TpVenta)
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76242249', '2', 'Induslab SPA', 'Enrique Matte 1462', 'ventas@induslab.cl', 225677363, 'David Brill', 1, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77021940', 'K', 'Comercial Industrial Market Ltda', 'Constantino 539', 'ventas6@refrimarket.com', 226833268, 'Joan Vivas', 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76046809', '6', 'Dap Ducasse Diseño Ltda', 'Av. Libertador Bernardo Ohiggins 1460, piso 5', 'nuvia.hormazabal@dapducasse.cl', 56232937000, 'Nuvia Hormazabal', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77508307', '7', 'Nico Cruzat', 'La Capitania 80- Oficina 108', 'nico@nicocruzat.cl', 56979007536, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('87717600', '2', 'Aceros y Metales SpA', '', 'tmoreno@acermet.cl', 225845200, 'Tania Moreno', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76279430', '6', 'Sociedad Comercial Orellana y Vidal', 'Cordillera 551', 'servicio@oyvrental.cl', 940269651, 'Rodrigo Carrasco G', 1, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76127937', '8', 'Román y De Col y Cía. Ltda.', 'CIRCUNVALACION AMERICO VESPUCIO 1940', 'aroman@autorodec.com', NULL, 'Alvaro Roman', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78730890', '2', 'Induacril SPA', 'Camino El Guanaco 6813', 'Ventas@induacril.cl', 944047029, 'Linda Sanchez', 1, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('93020000', 'K', 'Tecnigen SA.', 'Av. Carlos Valdovinos 450', 'info@tecnigen.cl', 223960600, 'Rolando Elgueta', 1, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76166794', '7', 'Trichem Ltda', 'Alcalde Barrera 9165', 'trichem@trichemci.com', 225272844, 'Gabriela Ojeda', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76097502', '8', 'Quality Rubber SA', 'Av. Americo Vespucio 1151', 'maraneda@qrubber.cl', 968344053, 'Marcela Aranda', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('26452499', '7', 'Omar Bandres Servicios de Ingenieria y Seguridad', 'Valle Lo Campino', 'bctronicsl@gmail.com', 976026030, 'Omar Brandes', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76925886', '8', 'Arriendo Lusomaq SPA', 'Calle Progreso 1309', 'contacto@lusomaq.cl', 977577061, 'Franchesca Ibarra', 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77222312', '9', 'Robert Tamayo Matriceria Torneria y Metalmecancia EIRL', 'Av Traiguen 1432', '', 999465649, 'Robert Tamayo', 2, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76122343', '7', 'Importadora Cromtek SpA', 'Av. DEL Valle sur 576, OF 703', 'contacto@cromtek.cl', 227333480, 'Sandra Caceres', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('91806000', '6', 'Abastible SA', 'Av Apoquindo', 'Elizabeth.EspinozaD@abastible.cl', 226939909, 'Elizabeth Espinoza Dinamarca', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76516761', '2', 'Obinu y Cia Ltda', 'Sargento Aldea 194', 'info@obinu.cl', 225273443, 'Yaret Arancibia', 1, 10);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77142419', '8', 'Servicios Eberall', 'Huerfanos 1055', 'ventas@eberall.cl', 56962975169, 'Elennys Garcia', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96605640', '1', 'Comercial Vimaroni SpA', 'DEL ALHELI 2332', 'ventas@vimaroni.cl', 2827061, 'Paola Olmos', 1, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78382590', '2', 'Valck', 'Camino San Pedro 9600', 'josefina@valck.cl', 225523860, 'Josefina Valck', 1, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76339652', '5', 'Of Quimica SpA', 'Parinacota #239', 'ventas@ofquimica.cl', 224791204, 'Karina Saavedra', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79728570', '6', 'Farmalatina Ltda', 'Las Encinas 1495, Valle Grande', 'analitica@farmalatina.cl', 228385019, 'Flor Saldaña', 1, 13);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76206859', '4', 'Metabali Consultores Ltda', 'Av. Apoquindo 6410 Of 210', 'melisa@metabali.cl', 56998871878, 'Maria Elsa Tabali', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78131420', 'k', 'Ingenieria Desimat Limitada', 'Puerto Vespucio 9670', 'facturacion@desimat.cl', 225851200, 'Ingenieria Desimat', 1, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76463059', '9', 'Gramlit SPA', 'Las Hortensias 972', 'ventas@gramlit.com', 225381002, 'Maria Emilia', 1, 10);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76730517', '6', 'Servicios Integrales y Proyectos Marcelo Perez EIRL', 'Nemesio Antunez 353', 'mperezm@mymproyectos.cl', 944083275, 'Marcelo Perez', 2, 14);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('16711057', '6', 'Carolina Diaz Paillalef', 'Los Pamperos 238', 'hielos.gradocero@gmail.com', 56975685662, 'Carolina Diaz', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77537533', '7', 'Cleaning SpA', 'Ahumada 312 Of 715', 'ventas@insumoscleaning.cl', 56930984761, 'Marcia Maira', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('99535580', '9', 'asesorias industriales ENOTEC SA', 'carlos edwards 1135', 'servicio@enotec.cl', 56225213450, 'Carolina Morales', 1, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('86778100', '5', 'plasticos Haddad SA', 'Jose Ananias Lama 444', 'ventas@haddad.cl', 56224627200, 'Camila Campos', 1, 11);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76117967', '5', 'TAAG TECHNOLOGIES SA', 'Rio Refugio 9641', 'njofre@taag-genetics.com', 229353200, 'Felipe Hinojosa', 1, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79629010', '2', 'Chesterton International Chile Ltda', 'Av. Los Vientos 20090 bodega B', 'alfonso.jaramillo@chesterton.com', 229444631, 'ALfonso Jaramillo', 2, 12);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76051243', '5', 'Comercial Hidraulica Restock Ltda', 'Brasil 81', 'ccuadros@hidraulicarestock.cl', 226964812, NULL, 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76218782', '5', 'Genesys Analitica SpA', 'Jose domingo cañar 574', 'mgonzalez@genesysanalitica.cl', 942192561, 'Mariela Gonzalez', 1, 15);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76163793', '2', 'Plasticentro SA', 'CAMINO LA MONTAÑA 355', 'sandro.becerra@plasticentro.cl', 223864700, 'Sandro Becerra', 1, 13);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('16536886', 'K', 'Maria Muñoz Navarrete', 'Los Lilium 1266', 'marymuoz26@gmail.com', 930800778, 'Maria Muñoz', 1, 16);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77736990', '3', 'Villegas y Perez Ltda', 'San Ignacio 1460', 'contacto@vilyper.cl', 5550450, 'Javier Puschel', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79722860', '5', 'Winkler Limitada', 'El Quillay #466 Parque Industrial', 'pflores@winklerltda.com', 56224826500, 'Priscila Flores', 2, 13);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78240410', '5', 'Aginox Comercial Ltda', 'Conferencia 956', 'j.ventas@aginox.cl', 228625600, 'Jorge Alderete', 2, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76496798', 'K', 'ANSA SPA', 'Ojos del Salado 840', 'naguad@imaqingenieria.cl', 227390054, 'Nagib Aguad', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('85417200', 'K', 'Nalco Industrial Services Chile Ltda', 'Avenida Isidora Goyenechea 2800 Of 1102', 'serviciocliente@nalco.com', 56940136123, 'Barbara Payera', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80326500', '3', 'Oxiquim SA', 'Av. Sta Maria 2050', 'ricardo.lara@oxiquim.com', 224788000, 'Ricardo Lara', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78972190', '4', 'HANNA INSTRUMENTS EQUIPOS LTDA', 'LO ECHEVERS 311', 'eduim@hannachile.com', 56950021734, 'Eduim Barrios', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77459130', '3', 'Ahorromat', 'Av. Gral San Martin 590', 'oyarcecontreras@gmail.com', 222449523, 'Marcelo Oyarce', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92681000', '6', 'Airolite SA', 'Camino Lo Echevers 550 bodega 30', 'cgatica@airolite.cl', 23455200, 'Carolina Gatica', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77218776', '9', 'Taglermaq SpA', 'Presidente German Riesco 8736-1', 'mponce@taglermaq.cl', NULL, 'Marco Ponce', 1, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76312131', '3', 'ALTI TEC Ltda', 'Av. Club Hipico 4676 Torre Norte Piso 8', 'proyectos@altitecchile.cl', 228870113, 'Jorge Reyes', 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76013877', '0', 'Amezaga Ingenieria y Suministros SA', 'Providencia 2594 oficina 621', 'contacto@tech-oh.cl', 223357779, 'Ruben Ramirez', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76496798', 'K', 'ANSA SPA', 'Ojos del Salado 840', 'naguad@imaqingenieria.cl', 227390054, 'Nagib Aguad', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76433951', '7', 'Aura Oyarzun seguridad y proteccion EIRL', 'Vicxuña Mackenna 8219', 'gerencia@cercoalarm', 982890839, 'Aura Oyarzun', 1, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96919040', '0', 'Bomba Espa S.A.', 'Calle Dos 9447, Parque Industrial Buenaventura', 'rhofmann@espachile.cl', 227266900, 'Raimund Hofmann', 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96598550', '6', 'Bombas Imchisa SA', 'Calle Dos 9447, Parque Industrial Buenaventura', 'cspate@espa.cl', 227266900, 'Claudia Spate', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76774170', '7', 'Busch Chile S.A', 'Av Presidente Frei Montalva 7070 Bod 9', 'jromero@busch.cl', 223765136, 'Julio Romero', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80960800', 'K', 'CARMELO TALA Y CIA LTDA', 'AV. PADRE ALBERTO HURTADO 0101', 'ventas@carmelotala.cl', 227791407, NULL, 2, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83030600', '5', 'CASA ROYAL', 'Avenida Libertador Bernardo O’Higgins 845', 'contacto@casaroyal.cl', NULL, NULL, 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('81185000', '4', 'Cesmec SA', 'Avda Marathon 2595', 'victor.lastra@bureauveritas.com', 223502100, 'Victor Lastra', 1, 10);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78983170', 'k', 'Cimtec SA', 'Av. Las Montañana 39 Los Libertadores', 'ventas@cimtec.cl', 225447900, 'Alejandra Gonzalez', 1, 2);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76554904', '3', 'CLAPPS CHILE SPA', 'MONJITAS 550 OF. 19', 'pamela@clappschile.cl', 226891576, 'Pamela Suarez', 2, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96974100', '8', 'CODEPACK', 'PARINACOTA 381 MODULO 9', 'osandoval@codepack.cl', 228166700, 'Oscar Sandoval', 3, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78769930', '8', 'Comercial Allen Ltda', 'Eduardo Matte 1830', 'emonsalve@allen.cl', 225553918, 'Eduardo Monsalve', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76051243', '5', 'Comercial Hidraulica Restock Ltda.', 'Av. Brasil 81', 'ccuadros@hidraulicarestock.cl', 226964812, 'Cristian Pavez', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77137860', '9', 'Comercial K Limitada', 'Crucero Peralillo S/N', 'g.molina@mk.cl', 226788141, 'Gisella Molina', 1, 13);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76644817', '8', 'Comercial Pro-Technology Ltda.', 'Vicuña Mackenna 7255 Of.707', 'andrea.villalobos@protechnology.cl', 222978401, 'Andrea Villalobos', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79993310', '1', 'Comercial Versluys', 'El Quilo 5535', 'carolinaversluys@gmail.com', 22228231, 'Carolina', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76096776', '9', 'Comercializadora Ambiente Ltda', 'La Martina 455 Bodega x9', 'ventas@cambiente.cl', 976670966, 'Carlos Mendez', 1, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76804728', '6', 'D&V Aceros SPA', 'Rodolfo Jaramillo906', 'vhgonzalez14@gmail.com', NULL, 'Victor Hugo Gonzalez', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('89396900', '4', 'Distribuidora Electrica Vitel SA', 'Chiloe 1189', 'jcalderon@vitel.cl', 225562646, 'Jennifer Calderon Villalobos', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76082923', '4', 'DYNTEC CHILE SPA', 'CAMINO ISLA NORTE S/N', 'ronald.jurgens@eco-dyntec.com', NULL, 'Ronald Jurgens', 1, 2);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78887880', 'k', 'Ecokorp Ltda.', 'Los Alamos 2394', 'ventas@ecokorp.cl', 227845431, 'Tamara Salinas', 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('85541900', '9', 'EDAPI S.A.', 'Chile España 414 Ñuñoa', 'aalarcon@edapi.cl', 223752600, 'Alicia Alarcon H.', 3, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76085401', '8', 'Eduardo Jose Fierro Plasticos EIRL', 'Quinahue 7116', 'msanz@angelplast.cl', NULL, 'Maria Jose Sanz', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('25270730', '1', 'EDWART PEREZ', NULL, 'edwartperez@gmail.com', NULL, 'Edwart Perez', 1, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96896480', '1', 'Sonepar Chile SA', 'Av. Vicuña Mackenna 2301', 'ELISEO.SALAZAR@SONEPAR.CL', 991624487, 'Eliseo Salazar', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80409800', '3', 'ELECTRICIDAD GOBANTES S.A.', 'AV. MATTA 1195', 'contactenos@gobantes.cl', 226900000, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79748470', '9', 'Electricidad Guzman', 'Avda. Fresia 2196', 'r.gonzalez@guzman.cl', 223871111, 'Rebeca Gonzalez', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76371984', '7', 'ELECTRONLINE', 'San Antonio 378, Of. 211', 'ventas@electronline.cl', 223023149, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('52003384', 'K', 'EVOLTA', 'Apoquindo 4100, OF 301, Piso 3', 'ventas@evolta.cl', 222429434, NULL, 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76867361', '6', 'Extintores Malaga SPA', 'Radal 643', NULL, 22864254, 'Maria Chico', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96863240', 'k', 'FIBRO CHILE SA', 'EL JUNCAL 900 - BUENAVENTURA', 'vpoblete@freevac.cl', NULL, NULL, 2, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83045600', '7', 'Galvez e Hijos Ltda', 'General Mackennna 1579', 'ventas@galvezehijos.cl', 22699339, 'Ximena Millar Soriano', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76842605', '8', 'Sociedad Comercial Rodastock Ltda', 'Vergara 38-40', 'ventas@rodastock.cl', 227841560, 'Monica Salas', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78377470', '4', 'GMP', 'Cirujano Guzmán 131', 'ebocaz@gmp.cl', 223468182, 'Erika Bocaz C', 3, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76124702', '6', 'HAKANSSON SAWBLADES CHILE LTDA', 'AVDA. EINSTEIN 760', 'Fsalinas@hakanssonchile.cl', NULL, 'Francisco Salinas', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78627210', '6', 'HIPERMERCADOS TOTTUS S.A.', NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76753396', '9', 'Importadora Best Store SPA', 'Guardia Vieja 490 oficina D', NULL, 223331673, NULL, 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83083700', '0', 'Importadora Dilaco SA', 'Perez Valenzuela 1138', 'azambrando@dilaco.com', 224029700, 'Alesandra Zambrano', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76711569', '5', 'Importadora RC SPA', 'AV. Americo Vespucio 2022', 'ventas@importadorarc.cl', NULL, 'Victor', 1, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76129541', '1', 'Importadora y exportadora Jorge Bravo EIRL', 'Huerfanos 2204', 'jalyon.cia@tie.cl', 226994979, 'Miriam Colimil', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83297700', '4', 'IMPRESOS Y CARTONAJES SA', 'LAS ENCINAS 441', 'mpinero@imicar.cl', NULL, 'Manuel Piñero', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76150343', 'k', 'INDURA S.A', 'Av. Las Americas 585, cerrillos-santiago', 'acorrea@indura.net', 6006003039, 'Alberto Luis correa quiro', 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76452427', '6', 'INNOVAPRINT CHILE SpA', 'Av.del Parque 5339 of. 105 Ciudad Empresarial', 'ventas2@innovaprint.cl', 226047127, 'Maria Eugenia Idrogo', 3, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76732331', 'K', 'Inofliss', 'Avenida Apoquindo 6410 Of. 605', 'venta@inofliss.cl', 228147038, 'Carlos Bravo', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96582680', '7', 'INTERMEC CHILE S.A.', 'Coronel 2330 of 11', 'elias.moraga@intermec.cl', 222341419, 'Elias Moraga', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76215357', '2', 'Karcher Chile SPA', 'Los lIbertadores 16500', NULL, 223806100, 'Ariel Martinez', 1, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80478200', '1', 'LAPIZ LOPEZ', NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('5817368', '1', 'Laura Rosa Quevedo Alvarez', 'Simon Bolivar casa 2 parcela d-1', 'farepa.gac@gmail.com', NULL, 'Hans Quevedo', 2, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76134946', '5', 'LIDER', NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76006708', '3', 'Luis Matta Armijo Servcio Refrigeracion EIRL', 'Segunda Avenida 376', 'friomatt@hotmail.com', 228111269, 'Luis Matta', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76720742', '5', 'Mantencion y reparacion Fricsotek SPA', 'Progreso 1309', 'r.salinas@fricsotek.cl', 56963685421, 'Ricardo Salinas', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('93320000', '0', 'Marienberg y Cia', 'Santa Marta 1600', 'jgs@marienberg.cl', 229474000, 'Jaqueline Gonzalez', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76229937', '2', 'MASMAUCO LTDA', 'AVDA. EL SALTO 4001 OF. 91', 'pedido@rentokil-initial.com', NULL, NULL, 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76490300', '5', 'MATERIAS PRIMAS CLAUDIA ESCOBAR SA', 'COLOMBIA 0390', NULL, NULL, 'VERONICA TORO', 1, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76875136', '6', 'MAXINNOVATION', NULL, NULL, NULL, 'David Hidalgo', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76854670', '3', 'MetalromE.I.R.L', 'Camino EL Colera s7n Cerrillos', 'jr.metalrom@gmail.com', 72463447, 'Jonathan Roman A', 2, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('9954930', '6', 'Multivac Chile SA', 'Calle Rio Refugioi 9665', 'maximiliano.paninao@cl.multivac.com', 27996000, 'Maximiliano Paninao', 2, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76172535', '1', 'NEBULAN', 'Av. Suecia 0155, oficina 304', NULL, NULL, 'Gonzalo Campbell', 4, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77251280', '5', 'Newchem technologies ltda', 'campo de deportes 421', NULL, NULL, 'Claudina Plaza', 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83017600', '4', 'NIBSA SA', 'Juan Griego 4429999999999', 'trinidad.garcia@nibsa.com', 224898100, 'Trinidad Garcia', 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('6682543', '4', 'Orlando Arcadio Diaz Diaz', 'Recreo 539', 'mecanizadosdiaz@yahoo.es', 227763392, 'Orlando Diaz Diaz', 2, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76019839', '0', 'PATRICIO SALAMANCA Y CIA LTDA', 'AUTIPISTA 8360 BLOQUE INT.', 'jm.salamanca@forymar.cl', NULL, 'Juan Manuel Salamanca', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78885550', '8', 'PC Factory S.A', NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77507670', '4', 'Pinxcel Graphics Ltda.', 'Avda. Picarte 327, Módulo 26', 'ngarcia@pinxcel.cl', 632202042, 'Norma Garcia', 3, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96501500', NULL, 'Plastigen SPA', 'Av Lo Boza 370', 'sbecerra@plastigen.cl', 223323900, 'Sandro Becerra', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96567010', '6', 'Politec SA', 'Camino Coquimbo 16064', 'Jdaniel.Lozada@femoglas.com', 223947100, 'Daniel Lozada', 1, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96980910', '9', 'Precision SA', 'Avenida El Salto 4291', 'oc_cliente@precision.cl', NULL, 'Maria Eugenia Aguilera', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76826870', '3', 'PRONTO COMUNICACIONES', 'Av. Del Valle Sur 577', 'mrodriguez@prontoip.com', 228580678, 'Marcelo Rodriguez', 3, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96556940', '5', 'PROVEEDORES INTEGRALES PRISA S.A.', 'LAS ROSAS 5757', 'ytoberp@prisa.cl', 8206000, 'Yolanda Tobar', 3, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77949040', '8', 'Punto Hidraulico Ltda', 'San Isidro 1466', 'nestor@puntohidraulico.cl', 225541878, 'Nestor Castillo', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92556000', '6', 'Refrigeracion y Repuestos S.A.C', 'Av. Condel 1064', 'ventas@ryrsac.cl', 229047724, 'Cristian Seguel', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78421810', '4', 'Rodacenter', 'Av. Americo Vespucio 1391', 'murdaneta@rodacenter.cl', 226272727, 'Marcos Urdaneta', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('99510910', '7', 'Segurycel Industrial Celume y Gonzalez', 'Avenida Ejercito Libertador 740', 'j.figueroa@segurycel.cl', 227075774, 'Jessica Figueroa', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('10935449', 'K', 'Servicarl SPA', 'Rosario', 'crivas@procesadoracrl.cl', 92401098, 'Cesar Rivas Liberona', 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76709668', '2', 'Servicios de SaludArboroa SpA', 'Almarza #110', 'coordinadora@beatself.cl', 23591721, 'Maria Moreno Gaete', 2, 1);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('8906900', '5', 'SMC Pneumatics Chile SA', 'Av La Montaña 1115', 'neris.acosta@smcchile.cl', 222708600, 'Neris Acosta', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77099530', '2', 'SOC PLASTICOS TECNICOS SPA', 'CAMINO SANTA INES', NULL, NULL, 'Manuel Espinola', 2, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77990830', '5', 'SOCIEDAD COMERCIAL DE MARKETING M&V SPA', 'AMERICO VESPUCIO NORTE 1385 DEPTO 34-35', 'ventas@exoset.cl', NULL, 'Diego Mellado', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76567567', '7', 'Sociedad Comercializadora Unifilm Ltda.', 'Marchant Pereira #3282', 'ventas@unifilm.cl', 222096350, 'Marcela Velasquez', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76214282', '1', 'SOCIEDAD MULLER SA', 'CAMINO LA MONTAÑA SITIO 56 LOTEO', 'marlene.muller@interpanel.cl', NULL, 'Marlene Muller', 2, 8);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96792430', 'K', 'SODIMAC S.A.', NULL, 'contactosodimac@sodimac.cl', NULL, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77419950', '0', 'Sodiper Vivaceta Limitda', 'Fermin Vivaceta 660', 'jorge.jove@sodiper.cl', 227959283, 'Jorge Jove', 1, 3);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76589179', '5', 'SolucionesRG Reyes Limitada', 'Cayupil 0337', 'solucionesrgchile@gmail.com', 998132416, 'Ricardo Garcia', 2, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76799430', '3', 'SP DIGITAL', 'Padre Mariano 356', NULL, 226567043, 'Elisa Santos', 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76333980', '7', 'SPARTAN DE CHILE LTDA', 'CERRO SANTA LUCIA 9873', 'ivan.marquez@spartan.cl', NULL, NULL, 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('9896306', '5', 'T & C COMPUTER', 'SAN DIEGO 965 LOCAL 12', 'ventas@tyccomputer.cl', 226628859, NULL, 1, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76764877', '4', 'Tecmetal Chile SPA', 'Calle cerro San Cristobal', 'tecmetal@gmail.com', 967049200, 'Walter Aguirre', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('89769600', '3', 'Tecnilñub Limitada', 'Alcalde Pedro Alarcon 726', 'aquevedo@tecnilub.cl', 227951300, 'Arturo Quevedo', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96542490', '3', 'Treck SA', 'Santa Rosa 5220', 'paulina.cerda@treck.cl', 24909986, 'Paulina Cerda', 3, 5);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78382590', '2', 'VALCK Y CIA S.A.', 'Camino Fdo San Pedro 9600', 'ximena.valdes@valck.cl', 225523860, 'Ximena Valdes', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('82525800', '0', 'Veto y Compañía Limitada', 'San Eugenio 567', 'ventas412@veto.cl', 223554400, 'Hernan Flores', 1, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76741064', '6', 'VP SERVICIOS GENERALES SpA', 'Mac Iver 142 Oficina 411 - Santiago', 'ventas3@vpservicios.cl', 232305776, 'Melva Portales', 3, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92147000', '2', 'WENCO SA', 'AV. AMERICO VESPUCIO 1125', 'silvana.leiva@wenco.cl', NULL, 'Silvana Leiva', 2, 7);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78701740', '1', 'Wurth Chile Ltda', 'Coronel Santiago Buena 1345', 'lcodina@wurth.cl', NULL, 'Laura Codina', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79961910', '5', 'XYLEM Water Solutions Chile SA', 'Alcalde Guzman 1480', 'mario.reyes@xyleminc.com', 225628600, 'Mario Reyes', 2, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80565900', '9', 'Yolito Balart Hnos ltda', 'Antillanca', 'rsolis@yolito.cl', 224820800, 'Richard Solis', 1, 6);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76057953', 'K', 'GreenClean Chile Ltda', 'Av. Condell 1470', 'contacto@greencleanchile.cl', 226656194, 'Bernardita Lira', 2, 4);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76524695', '4', 'Manufacturas de Telas SpA', 'Avda Portugal 1357', 'erika.gatica.ca@gmail.com', NULL, 'Erika Gatica', 2, 4);
