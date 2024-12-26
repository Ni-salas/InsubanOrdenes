-- Eliminar tablas si existen
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS OrdenCompra;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Solicitante;
DROP TABLE IF EXISTS Comuna;
DROP TABLE IF EXISTS TpVenta;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Pais;
DROP TABLE IF EXISTS Factura;

-- Tabla: Solicitante
CREATE TABLE Solicitante (
    cod_solic INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    usuario VARCHAR(10) NOT NULL,
    contraseña VARCHAR(15) NOT NULL,
    telefono BIGINT(9) NOT NULL,
    email VARCHAR(30) NOT NULL
);

-- Tabla: Pais
CREATE TABLE Pais (
    cod_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: Region
CREATE TABLE Region (
    cod_region INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    Pais_cod_pais INT NOT NULL,
    CONSTRAINT Region_Pais_FK FOREIGN KEY (Pais_cod_pais) REFERENCES Pais(cod_pais)
);

-- Tabla: Comuna
CREATE TABLE Comuna (
    cod_comuna INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    Region_cod_region INT NOT NULL,
    CONSTRAINT Comuna_Region_FK FOREIGN KEY (Region_cod_region) REFERENCES Region(cod_region)
);

-- Tabla: TpVenta
CREATE TABLE TpVenta (
    cod_venta INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(30) NOT NULL
);

-- Tabla: OrdenCompra
CREATE TABLE OrdenCompra (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    monto_total DOUBLE(15, 2) NOT NULL,
    fecha_orden DATE NOT NULL,
    Solicitante_cod_solic INT NOT NULL,
    CONSTRAINT OrdenCompra_Solicitante_FK FOREIGN KEY (Solicitante_cod_solic) REFERENCES Solicitante(cod_solic)
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(8) UNIQUE NOT NULL,
    dv_rut CHAR(1) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    direccion VARCHAR(100),
    email VARCHAR(60),
    telefono BIGINT(13),
    vendedor VARCHAR(60),
    TpVenta_cod_venta INT NOT NULL,
    Comuna_cod_comuna INT NOT NULL,
    CONSTRAINT Proveedor_TpVenta_FK FOREIGN KEY (TpVenta_cod_venta) REFERENCES TpVenta(cod_venta),
    CONSTRAINT Proveedor_Comuna_FK FOREIGN KEY (Comuna_cod_comuna) REFERENCES Comuna(cod_comuna)
);

-- Tabla: Pedido 
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    insumos VARCHAR(30) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DOUBLE(12, 2) NOT NULL,
    precio_iva DOUBLE(12, 2) NOT NULL,
    precio_total DOUBLE(12, 2) NOT NULL,
    OrdenCompra_id INT NOT NULL,
    Proveedor_id INT NOT NULL,
    CONSTRAINT Pedido_Proveedor_FK FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id_proveedor),
    CONSTRAINT Pedido_OrdenCompra_FK FOREIGN KEY (OrdenCompra_id) REFERENCES OrdenCompra(id_orden)
);

------------------------------------------------------------------------------------------------
-- Insertar informacion en Solicitante:
INSERT INTO Solicitante (nombre,  apellido, usuario, contraseña, telefono, email) VALUES ('Nicolas', 'Salas', 'Nisa', 123456, 229458504, 'nsalas@insuban.cl');

-- Insertar informacion en Pais:
INSERT INTO Pais (nombre) VALUES ('Chile');
INSERT INTO Pais (nombre) VALUES ('España');
INSERT INTO Pais (nombre) VALUES ('Argentina');
INSERT INTO Pais (nombre) VALUES ('Dinamarca');
INSERT INTO Pais (nombre) VALUES ('México');
INSERT INTO Pais (nombre) VALUES ('Estados Unidos');
INSERT INTO Pais (nombre) VALUES ('Paraguay');

-- Insertar Informacion en Region:
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Antártica Chilena', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Antofagasta', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Araucanía', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Arica y Parinacota', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Aysén', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Atacama', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Biobío', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Coquimbo', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Los Lagos', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Los Ríos', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Magallanes', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Maule', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Ñuble', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('OHiggins', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Region Metropolitana', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Tarapacá', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Valparaíso', 1);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Andalucía', 2);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Cataluña', 2);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Madrid', 2);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Valencia', 2);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Buenos Aires', 3);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('CABA', 3);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Mendoza', 3);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Santa Fe', 3);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Córdoba', 3);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Hovedstaden', 4);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Midtjylland', 4);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Nordjylland', 4);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Syddanmark', 4);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Ciudad de México', 5);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Jalisco', 5);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Nuevo León', 5);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Puebla', 5);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('California', 6);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Texas', 6);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Florida', 6);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('New York', 6);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Asunción', 7);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Central', 7);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Alto Paraná', 7);
INSERT INTO Region(nombre, Pais_cod_pais) VALUES ('Itapúa', 7);

-- Insertar Informacion en Comuna:
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Antártica', 1);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Puerto Williams', 1);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Puerto Toro', 1);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Navarino', 1);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Antofagasta', 2);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Mejillones', 2);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Calama', 2);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Taltal', 2);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Temuco', 3);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Angol', 3);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Villarrica', 3);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Pucón', 3);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Arica', 4);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Putre', 4);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Camarones', 4);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('General Lagos', 4);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Coyhaique', 5);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Chile Chico', 5);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Aysén', 5);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Cisnes', 5);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Copiapó', 6);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Vallenar', 6);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Caldera', 6);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Tierra Amarilla', 6);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Concepción', 7);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Talcahuano', 7);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Los Ángeles', 7);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Hualpén', 7);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Serena', 8);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Coquimbo', 8);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Ovalle', 8);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Andacollo', 8);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Puerto Montt', 9);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Castro', 9);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Osorno', 9);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Puerto Varas', 9);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Valdivia', 10);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Unión', 10);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Río Bueno', 10);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Lago Ranco', 10);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Punta Arenas', 11);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Puerto Natales', 11);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Porvenir', 11);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Cabo de Hornos', 11);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Talca', 12);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Curicó', 12);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Linares', 12);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Molina', 12);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Chillán', 13);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Carlos', 13);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Quirihue', 13);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Ninhue', 13);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Doñihue', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Rancagua', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Fernando', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Graneros', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Pichilemu', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Codegua', 14);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Buin', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Calera de Tango', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Cerrillos', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Colina', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Conchali', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('El Bosque', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('El Monte', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Estación Central', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Huechuraba', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Independencia', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Isla de Maipo', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Cisterna', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Florida', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Granja', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Pintana', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('La Reina', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Lampa', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Las Condes', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Lo Barnechea', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Lo Espejo', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Lo Prado', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Macul', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Maipu', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Maria Pinto', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Ñuñoa', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Padre Hurtado', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Paine', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Pedro Aguirre Cerda', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Peñaflor', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Peñalolén', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Providencia', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Pudahuel', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Quilicura', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Quinta Normal', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Recoleta', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Renca', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Bernardo', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Miguel', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Ramon', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Joaquin', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Jose de Maipo', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Santiago', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Talagante', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Tiltil', 15);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Iquique', 16);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Alto Hospicio', 16);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Pica', 16);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Camiña', 16);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Valparaíso', 17);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Viña del Mar', 17);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('San Antonio', 17);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Quillota', 17);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Quilpue', 17);
INSERT INTO Comuna (nombre, Region_cod_region) VALUES ('Rosario', 25);

-- Insertar Informacion en Tipo de Venta (TpVenta):
INSERT INTO TpVenta (descripcion) VALUES ('Contado');
INSERT INTO TpVenta (descripcion) VALUES ('Credito');
INSERT INTO TpVenta (descripcion) VALUES ('Efectivo');
INSERT INTO TpVenta (descripcion) VALUES ('Cheque');

-- Insertar Informacion en Proveedor:
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76242249', '2', 'Induslab Spa', 'Enrique Matte 1462', 'ventas@induslab.cl', 225677363, 'David Brill', 1, 96);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77021940', 'K', 'Comercial Industrial Market Ltda', 'Constantino 539', 'ventas6@refrimarket.com', 226833268, 'Joan Vivas', 1, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76046809', '6', 'Dap Ducasse Diseño Ltda', 'Av. Libertador Bernardo Ohiggins 1460, Piso 5', 'nuvia.hormazabal@dapducasse.cl', 56232937000, 'Nuvia Hormazabal', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77508307', '7', 'Nico Cruzat', 'La Capitania 80- Oficina 108', 'nico@nicocruzat.cl', 56979007536, NULL, 1, 76);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('87717600', '2', 'Aceros Y Metales Spa', NULL, 'tmoreno@acermet.cl', 225845200, 'Tania Moreno', 2, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76279430', '6', 'Sociedad Comercial Orellana Y Vidal', 'Cordillera 551', 'servicio@oyvrental.cl', 940269651, 'Rodrigo Carrasco G', 1, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76127937', '8', 'Román Y De Col Y Cía. Ltda.', 'Circunvalación Americo Vespucio 1940', 'aroman@autorodec.com', NULL, 'Alvaro Roman', 1, 63);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76829992', '7', 'Induacril Spa', 'Camino El Guanaco 6813', 'ventas@induacril.cl', 944047029, 'Linda Sanchez', 1, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('93020000', 'K', 'Tecnigen Sa.', 'Av. Carlos Valdovinos 450', 'info@tecnigen.cl', 223960600, 'Rolando Elgueta', 1, 98);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76166794', '7', 'Trichem Ltda', 'Alcalde Barrera 9165', 'trichem@trichemci.com', 225272844, 'Gabriela Ojeda', 2, 70);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76097502', '8', 'Quality Rubber Sa', 'Av. Americo Vespucio 1151', 'maraneda@qrubber.cl', 968344053, 'Marcela Aranda', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('26452499', '7', 'Omar Bandres Servicios De Ingenieria Y Seguridad', 'Valle Lo Campino', 'bctronicsl@gmail.com', 976026030, 'Omar Brandes', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76925886', '8', 'Arriendo Lusomaq Spa', 'Calle Progreso 1309', 'contacto@lusomaq.cl', 977577061, 'Franchesca Ibarra', 1, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77222312', '9', 'Robert Tamayo Matriceria Torneria Y Metalmecanica Eirl', 'Av Traiguen 1432', 'robert', 999465649, 'Robert Tamayo', 2, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76122343', '7', 'Importadora Cromtek Spa', 'Av. Del Valle Sur 576, Of 703', 'contacto@cromtek.cl', 227333480, 'Sandra Caceres', 2, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('91806000', '6', 'Abastible Sa', 'Av. Apoquindo', 'elizabeth.espinozad@abastible.cl', 226939909, 'Elizabeth Espinoza Dinamarca', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76516761', '2', 'Obinu Y Cia Ltda', 'Sargento Aldea 194', 'info@obinu.cl', 225273443, 'Yaret Arancibia', 1, 64);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77142419', '8', 'Servicios Eberall', 'Huerfanos 1055', 'ventas@eberall.cl', 56962975169, 'Elennys Garcia', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96605640', '1', 'Comercial Vimaroni Spa', 'Del Alheli 2332', 'ventas@vimaroni.cl', 2827061, 'Paola Olmos', 1, 111);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76339652', '5', 'Of Quimica SpA', 'Parinacota #239', 'ventas@ofquimica.cl', 224791204, 'Karina Saavedra', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79728570', '6', 'Farmalatina Ltda', 'Las Encinas 1495, Valle Grande', 'analitica@farmalatina.cl', 228385019, 'Flor Saldaña', 1, 75);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76206859', '4', 'Metabali Consultores Ltda', 'Av. Apoquindo 6410 Of 210', 'melisa@metabali.cl', 56998871878, 'Maria Elsa Tabali', 1, 76);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78131420', 'K', 'Ingenieria Desimat Limitada', 'Puerto Vespucio 9670', 'facturacion@desimat.cl', 225851200, 'Ingenieria Desimat', 1, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76463059', '9', 'Gramlit SPA', 'Las Hortensias 972', 'ventas@gramlit.com', 225381002, 'Maria Emilia', 1, 61);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76730517', '6', 'Servicios Integrales y Proyectos Marcelo Perez EIRL', 'Nemesio Antunez 353', 'mperezm@mymproyectos.cl', 944083275, 'Marcelo Perez', 2, 81);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('16711057', '6', 'Carolina Diaz Paillalef', 'Los Pamperos 238', 'hielos.gradocero@gmail.com', 56975685662, 'Carolina Diaz', 1, 93);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77537533', '7', 'Cleaning SpA', 'Ahumada 312 Of 715', 'ventas@insumoscleaning.cl', 56930984761, 'Marcia Maira', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('99535580', '9', 'Asesorias Industriales ENOTEC SA', 'Carlos Edwards 1135', 'servicio@enotec.cl', 56225213450, 'Carolina Morales', 1, 96);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('86778100', '5', 'Plasticos Haddad SA', 'Jose Ananias Lama 444', 'ventas@haddad.cl', 56224627200, 'Camila Campos', 1, 80);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76117967', '5', 'TAAG Technologies SA', 'Rio Refugio 9641', 'njofre@taag-genetics.com', 229353200, 'Felipe Hinojosa', 1, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79629010', '2', 'Chesterton International Chile Ltda', 'Av. Los Vientos 20090 bodega B', 'alfonso.jaramillo@chesterton.com', 229444631, 'Alfonso Jaramillo', 2, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76218782', '5', 'Genesys Analitica SpA', 'Jose Domingo Cañas 574', 'mgonzalez@genesysanalitica.cl', 942192561, 'Mariela Gonzalez', 1, 83);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76163793', '2', 'Plasticentro SA', 'Camino La Montaña 355', 'sandro.becerra@plasticentro.cl', 223864700, 'Sandro Becerra', 1, 75);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('16536886', 'K', 'Maria Muñoz Navarrete', 'Los Lilium 1266', 'marymuoz26@gmail.com', 930800778, 'Maria Muñoz', 1, 9);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77736990', '3', 'Villegas y Perez Ltda', 'San Ignacio 1460', 'contacto@vilyper.cl', 5550450, 'Javier Puschel', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79722860', '5', 'Winkler Limitada', 'El Quillay #466 Parque Industrial', 'pflores@winklerltda.com', 56224826500, 'Priscila Flores', 2, 75);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78240410', '5', 'Aginox Comercial Ltda', 'Conferencia 956', 'j.ventas@aginox.cl', 228625600, 'Jorge Alderete', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('85417200', 'K', 'Nalco Industrial Services Chile Ltda', 'Avenida Isidora Goyenechea 2800 Of 1102', 'serviciocliente@nalco.com', 56940136123, 'Barbara Payera', 1, 76);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80326500', '3', 'Oxiquim Sa', 'Av. Sta Maria 2050', 'ricardo.lara@oxiquim.com', 224788000, 'Ricardo Lara', 2, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78972190', '4', 'Hanna Instruments Equipos Ltda', 'Lo Echevers 311', 'eduim@hannachile.com', 56950021734, 'Eduim Barrios', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77459130', '3', 'Ahorromat', 'Av. Gral San Martin 590', 'oyarcecontreras@gmail.com', 222449523, 'Marcelo Oyarce', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92681000', '6', 'Airolite Sa', 'Camino Lo Echevers 550 Bodega 30', 'cgatica@airolite.cl', 23455200, 'Carolina Gatica', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77218776', '9', 'Taglermaq Spa', 'Presidente German Riesco 8736-1', 'mponce@taglermaq.cl', NULL, 'Marco Ponce', 1, 94);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76312131', '3', 'Alti Tec Ltda', 'Av. Club Hipico 4676 Torre Norte Piso 8', 'proyectos@altitecchile.cl', 228870113, 'Jorge Reyes', 2, 86);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76013877', '0', 'Amezaga Ingenieria Y Suministros Sa', 'Providencia 2594 Oficina 621', 'contacto@tech-oh.cl', 223357779, 'Ruben Ramirez', 1, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76496798', 'K', 'Ansa Spa', 'Ojos Del Salado 840', 'naguad@imaqingenieria.cl', 227390054, 'Nagib Aguad', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76433951', '7', 'Aura Oyarzun Seguridad Y Proteccion Eirl', 'Vicuña Mackenna 8219', 'gerencia@cercoalarm', 982890839, 'Aura Oyarzun', 1, 71);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96919040', '0', 'Bomba Espa Sa', 'Calle Dos 9447, Parque Industrial Buenaventura', 'rhofmann@espachile.cl', 227266900, 'Raimund Hofmann', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96598550', '6', 'Bombas Imchisa Sa', 'Calle Dos 9447, Parque Industrial Buenaventura', 'cspate@espa.cl', 227266900, 'Claudia Spate', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76774170', '7', 'Busch Chile Sa', 'Av. Presidente Frei Montalva 7070 Bod 9', 'jromero@busch.cl', 223765136, 'Julio Romero', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80960800', 'K', 'Carmelo Tala Y Cia Ltda', 'Av. Padre Alberto Hurtado 0101', 'ventas@carmelotala.cl', 227791407, NULL, 2, 66);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83030600', '5', 'Casa Royal', 'Avenida Libertador Bernardo O’higgins 845', 'contacto@casaroyal.cl', NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('81185000', '4', 'Cesmec Sa', 'Avda Marathon 2595', 'victor.lastra@bureauveritas.com', 223502100, 'Victor Lastra', 1, 80);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78983170', 'K', 'Cimtec Sa', 'Av. Las Montañanas 39 Los Libertadores', 'ventas@cimtec.cl', 225447900, 'Alejandra Gonzalez', 1, 62);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76554904', '3', 'Clapps Chile Spa', 'Monjitas 550 Of. 19', 'pamela@clappschile.cl', 226891576, 'Pamela Suarez', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96974100', '8', 'Codepack', 'Parinacota 381 Modulo 9', 'osandoval@codepack.cl', 228166700, 'Oscar Sandoval', 3, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78769930', '8', 'Comercial Allen Ltda', 'Eduardo Matte 1830', 'emonsalve@allen.cl', 225553918, 'Eduardo Monsalve', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76051243', '5', 'Comercial Hidraulica Restock Ltda.', 'Av. Brasil 81', 'ccuadros@hidraulicarestock.cl', 226964812, 'Cristian Pavez', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77137860', '9', 'Comercial K Limitada', 'Crucero Peralillo S/N', 'g.molina@mk.cl', 226788141, 'Gisella Molina', 1, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76644817', '8', 'Comercial Pro-Technology Ltda.', 'Vicuña Mackenna 7255 Of.707', 'andrea.villalobos@protechnology.cl', 222978401, 'Andrea Villalobos', 2, 71);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79993310', '1', 'Comercial Versluys', 'El Quilo 5535', 'carolinaversluys@gmail.com', 22228231, 'Carolina', 2, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76096776', '9', 'Comercializadora Ambiente Ltda', 'La Martina 455 Bodega x9', 'ventas@cambiente.cl', 976670966, 'Carlos Mendez', 1, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76804728', '6', 'D&V Aceros SPA', 'Rodolfo Jaramillo906', 'vhgonzalez14@gmail.com', NULL, 'Victor Hugo Gonzalez', 2, 84);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('89396900', '4', 'Distribuidora Electrica Vitel SA', 'Chiloe 1189', 'jcalderon@vitel.cl', 225562646, 'Jennifer Calderon Villalobos', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76082923', '4', 'Dyntec Chile Spa', 'Camino Isla Norte S/N', 'ronald.jurgens@eco-dyntec.com', NULL, 'Ronald Jurgens', 1, 58);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78887880', 'k', 'Ecokorp Ltda.', 'Los Alamos 2394', 'ventas@ecokorp.cl', 227845431, 'Tamara Salinas', 2, 73);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('85541900', '9', 'Edapi S.A.', 'Chile España 414 Ñuñoa', 'aalarcon@edapi.cl', 223752600, 'Alicia Alarcon H.', 3, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76085401', '8', 'Eduardo Jose Fierro Plasticos Eirl', 'Quinahue 7116', 'msanz@angelplast.cl', NULL, 'Maria Jose Sanz', 2, 71);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('25270730', '1', 'Edwart Perez', NULL, 'edwartperez@gmail.com', NULL, 'Edwart Perez', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96896480', '1', 'Sonepar Chile SA', 'Av. Vicuña Mackenna 2301', 'eliseo.salazar@sonaepar.cl', 991624487, 'Eliseo Salazar', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80409800', '3', 'Electricidad Gobantes S.A.', 'Av. Matta 1195', 'contactenos@gobantes.cl', 226900000, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79748470', '9', 'Electricidad Guzman', 'Avda. Fresia 2196', 'r.gonzalez@guzman.cl', 223871111, 'Rebeca Gonzalez', 2, 94);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76371984', '7', 'Electronline', 'San Antonio 378, Of. 211', 'ventas@electronline.cl', 223023149, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('52003384', 'K', 'Evolta', 'Apoquindo 4100, Of 301, Piso 3', 'ventas@evolta.cl', 222429434, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76867361', '6', 'Extintores Malaga Spa', 'Radal 643', NULL, 22864254, 'Maria Chico', 2, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96863240', 'k', 'Fibro Chile SA', 'El Juncal 900 - Buenaventura', 'vpoblete@freevac.cl', NULL, NULL, 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83045600', '7', 'Galvez E Hijos Ltda', 'General Mackennna 1579', 'ventas@galvezehijos.cl', 22699339, 'Ximena Millar Soriano', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76842605', '8', 'Sociedad Comercial Rodastock Ltda', 'Vergara 38-40', 'ventas@rodastock.cl', 227841560, 'Monica Salas', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78377470', '4', 'Gmp', 'Cirujano Guzmán 131', 'ebocaz@gmp.cl', 223468182, 'Erika Bocaz C', 3, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76124702', '6', 'Hakansson Sawblades Chile Ltda', 'Avda. Einstein 760', 'fsalinas@hakanssonchile.cl', NULL, 'Francisco Salinas', 2, 93);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78627210', '6', 'Hipermercados Tottus S.A.', NULL, NULL, NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76753396', '9', 'Importadora Best Store Spa', 'Guardia Vieja 490 Oficina D', NULL, 223331673, NULL, 2, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83083700', '0', 'Importadora Dilaco SA', 'Perez Valenzuela 1138', 'azambrando@dilaco.com', 224029700, 'Alesandra Zambrano', 1, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76711569', '5', 'Importadora Rc Spa', 'Av. Americo Vespucio 2022', 'ventas@importadorarc.cl', NULL, 'Victor', 1, 97);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76129541', '1', 'Importadora Y Exportadora Jorge Bravo Eirl', 'Huerfanos 2204', 'jalyon.cia@tie.cl', 226994979, 'Miriam Colimil', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83297700', '4', 'Impresos Y Cartonajes Sa', 'Las Encinas 441', 'mpinero@imicar.cl', NULL, 'Manuel Piñero', 2, 61);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76150343', 'k', 'Indura S.A', 'Av. Las Americas 585, Cerrillos-Santiago', 'acorrea@indura.net', 6006003039, 'Alberto Luis Correa Quiro', 1, 61);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76452427', '6', 'Innovaprint Chile Spa', 'Av.Del Parque 5339 Of. 105 Ciudad Empresarial', 'ventas2@innovaprint.cl', 226047127, 'Maria Eugenia Idrogo', 3, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76732331', 'K', 'Inofliss', 'Avenida Apoquindo 6410 Of. 605', 'venta@inofliss.cl', 228147038, 'Carlos Bravo', 1, 76);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96582680', '7', 'Intermec Chile S.A.', 'Coronel 2330 Of 11', 'elias.moraga@intermec.cl', 222341419, 'Elias Moraga', 1, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76215357', '2', 'Karcher Chile Spa', 'Los Libertadores 16500', NULL, 223806100, 'Ariel Martinez', 1, 62);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80478200', '1', 'Lapiz Lopez', NULL, NULL, NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('5817368', '1', 'Laura Rosa Quevedo Alvarez', 'Simon Bolivar Casa 2 Parcela D-1', 'farepa.gac@gmail.com', NULL, 'Hans Quevedo', 2, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76134946', '5', 'Lider', NULL, NULL, NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76006708', '3', 'Luis Matta Armijo Servicio Refrigeracion Eirl', 'Segunda Avenida 376', 'friomatt@hotmail.com', 228111269, 'Luis Matta', 2, 84);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76720742', '5', 'Mantencion Y Reparacion Fricsotek Spa', 'Progreso 1309', 'r.salinas@fricsotek.cl', 56963685421, 'Ricardo Salinas', 2, 92);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('93320000', '0', 'Marienberg Y Cia', 'Santa Marta 1600', 'jgs@marienberg.cl', 229474000, 'Jaqueline Gonzalez', 2, 81);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76229937', '2', 'Masmauco Ltda', 'Avda. El Salto 4001 Of. 91', 'pedido@rentokil-initial.com', NULL, NULL, 2, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76490300', '5', 'Materias Primas Claudia Escobar Sa', 'Colombia 0390', NULL, NULL, 'Veronica Toro', 1, 93);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76875136', '6', 'Maxinnovation', NULL, NULL, NULL, 'David Hidalgo', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76854670', '3', 'Metalrome.I.R.L', 'Camino El Colera S7n Cerrillos', 'jr.metalrom@gmail.com', 72463447, 'Jonathan Roman A', 2, 61);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('9954930', '6', 'Multivac Chile Sa', 'Calle Rio Refugioi 9665', 'maximiliano.paninao@cl.multivac.com', 27996000, 'Maximiliano Paninao', 2, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76172535', '1', 'Nebulan', 'Av. Suecia 0155, Oficina 304', NULL, NULL, 'Gonzalo Campbell', 4, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77251280', '5', 'Newchem Technologies Ltda', 'Campo De Deportes 421', NULL, NULL, 'Claudina Plaza', 2, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('83017600', '4', 'Nibsa Sa', 'Juan Griego 4429999999999', 'trinidad.garcia@nibsa.com', 224898100, 'Trinidad Garcia', 1, 98);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('6682543', '4', 'Orlando Arcadio Diaz Diaz', 'Recreo 539', 'mecanizadosdiaz@yahoo.es', 227763392, 'Orlando Diaz Diaz', 2, 66);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76019839', '0', 'Patricio Salamanca Y Cia Ltda', 'Autipista 8360 Bloque Int.', 'jm.salamanca@forymar.cl', NULL, 'Juan Manuel Salamanca', 2,26);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78885550', '8', 'Pc Factory S.A', NULL, NULL, NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77507670', '4', 'Pinxcel Graphics Ltda.', 'Avda. Picarte 327, Módulo 26', 'ngarcia@pinxcel.cl', 632202042, 'Norma Garcia', 3, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96501500', '0', 'Plastigen Spa', 'Av Lo Boza 370', 'sbecerra@plastigen.cl', 223323900, 'Sandro Becerra', 2, 75);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96567010', '6', 'Politec Sa', 'Camino Coquimbo 16064', 'jdaniel.lozada@femoglas.com', 223947100, 'Daniel Lozada', 1, 62);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96980910', '9', 'Precision Sa', 'Avenida El Salto 4291', 'oc_cliente@precision.cl', NULL, 'Maria Eugenia Aguilera', 1, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76826870', '3', 'Pronto Comunicaciones', 'Av. Del Valle Sur 577', 'mrodriguez@prontoip.com', 228580678, 'Marcelo Rodriguez', 3, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96556940', '5', 'Proveedores Integrales Prisa S.A.', 'Las Rosas 5757', 'ytoberp@prisa.cl', 8206000, 'Yolanda Tobar', 3, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77949040', '8', 'Punto Hidraulico Ltda', 'San Isidro 1466', 'nestor@puntohidraulico.cl', 225541878, 'Nestor Castillo', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92556000', '6', 'Refrigeracion Y Repuestos S.A.C', 'Av. Condel 1064', 'ventas@ryrsac.cl', 229047724, 'Cristian Seguel', 1, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78421810', '4', 'Rodacenter', 'Av. Americo Vespucio 1391', 'murdaneta@rodacenter.cl', 226272727, 'Marcos Urdaneta', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('99510910', '7', 'Segurycel Industrial Celume Y Gonzalez', 'Avenida Ejercito Libertador 740', 'j.figueroa@segurycel.cl', 227075774, 'Jessica Figueroa', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('10935449', 'K', 'Servicarl Spa', 'Rosario', 'crivas@procesadoracrl.cl', 92401098, 'Cesar Rivas Liberona', 2, 112);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76709668', '2', 'Servicios De Saludarboroa Spa', 'Almarza #110', 'coordinadora@beatself.cl', 23591721, 'Maria Moreno Gaete', 2, 54);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('8906900', '5', 'Smc Pneumatics Chile Sa', 'Av La Montaña 1115', 'neris.acosta@smcchile.cl', 222708600, 'Neris Acosta', 2, 75);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77099530', '2', 'Soc Plasticos Tecnicos Spa', 'Camino Santa Ines', NULL, NULL, 'Manuel Espinola', 2, 60);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77990830', '5', 'Sociedad Comercial De Marketing M&V Spa', 'Americo Vespucio Norte 1385 Depto 34-35', 'ventas@exoset.cl', NULL, 'Diego Mellado', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76567567', '7', 'Sociedad Comercializadora Unifilm Ltda.', 'Marchant Pereira #3282', 'ventas@unifilm.cl', 222096350, 'Marcela Velasquez', 1, 83);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76214282', '1', 'Sociedad Muller SA', 'Camino La Montaña Sitio 56 Loteo', 'marlene.muller@interpanel.cl', NULL, 'Marlene Muller', 2, 62);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96792430', 'K', 'Sodimac S.A.', NULL, 'contactosodimac@sodimac.cl', NULL, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('77419950', '0', 'Sodiper Vivaceta Limitda', 'Fermin Vivaceta 660', 'jorge.jove@sodiper.cl', 227959283, 'Jorge Jove', 1, 68);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76589179', '5', 'Solucionesrg Reyes Limitada', 'Cayupil 0337', 'solucionesrgchile@gmail.com', 998132416, 'Ricardo Garcia', 2, 81);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76799430', '3', 'Sp Digital', 'Padre Mariano 356', NULL, 226567043, 'Elisa Santos', 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76333980', '7', 'Spartan De Chile Ltda', 'Cerro Santa Lucia 9873', 'ivan.marquez@spartan.cl', NULL, NULL, 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('9896306', '5', 'T & C Computer', 'San Diego 965 Local 12', 'ventas@tyccomputer.cl', 226628859, NULL, 1, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76764877', '4', 'Tecmetal Chile Spa', 'Calle Cerro San Cristobal', 'tecmetal@gmail.com', 967049200, 'Walter Aguirre', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('89769600', '3', 'Tecnilub Limitada', 'Alcalde Pedro Alarcon 726', 'aquevedo@tecnilub.cl', 227951300, 'Arturo Quevedo', 2, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('96542490', '3', 'Treck Sa', 'Santa Rosa 5220', 'paulina.cerda@treck.cl', 24909986, 'Paulina Cerda', 3, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78382590', '2', 'Valck Y Cia S.A.', 'Camino Fdo San Pedro 9600', 'ximena.valdes@valck.cl', 225523860, 'Ximena Valdes', 1, 90);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('82525800', '0', 'Veto Y Compañía Limitada', 'San Eugenio 567', 'ventas412@veto.cl', 223554400, 'Hernan Flores', 1, 83);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76741064', '6', 'Vp Servicios Generales Spa', 'Mac Iver 142 Oficina 411 - Santiago', 'ventas3@vpservicios.cl', 232305776, 'Melva Portales', 3, 100);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('92147000', '2', 'Wenco Sa', 'Av. Americo Vespucio 1125', 'silvana.leiva@wenco.cl', NULL, 'Silvana Leiva', 2, 67);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('78701740', '1', 'Wurth Chile Ltda', 'Coronel Santiago Buena 1345', 'lcodina@wurth.cl', NULL, 'Laura Codina', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('79961910', '5', 'Xylem Water Solutions Chile Sa', 'Alcalde Guzman 1480', 'mario.reyes@xyleminc.com', 225628600, 'Mario Reyes', 2, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('80565900', '9', 'Yolito Balart Hnos Ltda', 'Antillanca', 'rsolis@yolito.cl', 224820800, 'Richard Solis', 1, 91);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76057953', 'K', 'Greenclean Chile Ltda', 'Av. Condell 1470', 'contacto@greencleanchile.cl', 226656194, 'Bernardita Lira', 2, 89);
INSERT INTO Proveedor (rut, dv_rut, nombre, direccion, email, telefono, vendedor, TpVenta_cod_venta, Comuna_cod_comuna) VALUES ('76524695', '4', 'Manufacturas De Telas Spa', 'Avda Portugal 1357', 'erika.gatica.ca@gmail.com', NULL, 'Erika Gatica', 2, 100);