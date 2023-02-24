create database oil_sales_model;
use oil_sales_model;

-- tables
-- Table: SALE
CREATE TABLE SALE (
    id_sale int NOT NULL,
    id_client int NOT NULL,
    id_crude int NOT NULL,
    id_sale_concept int NOT NULL,
    id_destination int NOT NULL,
    id_transportation int NOT NULL,
    id_market int NOT NULL,
    sale_day date NOT NULL,
    price float NOT NULL,
    CONSTRAINT PK_SALE PRIMARY KEY (id_sale)
);

-- Table: COST
CREATE TABLE COST (
    id_cost int NOT NULL,
    id_supplier int NOT NULL,
    id_cost_concept int NOT NULL,
    manageable boolean NOT NULL,
    cost_day date NOT NULL,
    invoice_number VARCHAR(14) NOT NULL,
    CONSTRAINT PK_COST PRIMARY KEY (id_cost)
);

-- Table: COST_SALE
CREATE TABLE COST_SALE (
    id_cost int NOT NULL,
    id_sale int NOT NULL,
    CONSTRAINT PK_COST_SALE PRIMARY KEY (id_cost, id_sale)
);

-- Table: SALE_DETAIL
CREATE TABLE SALE_DETAIL (
    id_detail int NOT NULL,
    id_sale int NOT NULL,
    id_area int NOT NULL,
    volume float NOT NULL,
    CONSTRAINT PK_SALE_DETAIL PRIMARY KEY (id_detail)
);

-- Table: AREA
CREATE TABLE AREA (
    id_area int NOT NULL,
    area_name VARCHAR(20) NOT NULL,
    id_basin int NOT NULL,
    CONSTRAINT PK_AREA PRIMARY KEY (id_area)
);

-- Table: CLIENT
CREATE TABLE CLIENT (
    id_client int NOT NULL,
    client_name VARCHAR(20) NOT NULL,
    cuit int NOT NULL,
    CONSTRAINT PK_CLIENT PRIMARY KEY (id_client)
);

-- Table: SUPPLIER
CREATE TABLE SUPPLIER (
    id_supplier int NOT NULL,
    supplier_name VARCHAR(20) NOT NULL,
    cuit int NOT NULL,
    CONSTRAINT PK_SUPPLIER PRIMARY KEY (id_supplier)
);

-- Table: CRUDE
CREATE TABLE CRUDE (
    id_crude int NOT NULL,
    crude_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_CRUDE PRIMARY KEY (id_crude)
);

-- Table: SALE CONCEPT
CREATE TABLE SALE_CONCEPT (
    id_sale_concept int NOT NULL,
    sale_concept_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_SALE_CONCEPT PRIMARY KEY (id_sale_concept)
);

-- Table: MARKET
CREATE TABLE MARKET (
    id_market int NOT NULL,
    market_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_MARKET PRIMARY KEY (id_market)
);

-- Table: COST CONCEPT
CREATE TABLE COST_CONCEPT (
    id_cost_concept int NOT NULL,
    cost_concept_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_COST_CONCEPT PRIMARY KEY (id_cost_concept)
);

-- Table: DESTINATION
CREATE TABLE DESTINATION (
    id_destination int NOT NULL,
    destination_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_DESTINATION PRIMARY KEY (id_destination)
);

-- Table: BASIN
CREATE TABLE BASIN (
    id_basin int NOT NULL,
    basin_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_BASIN PRIMARY KEY (id_basin)
);

-- Table: TRANSPORTATION
CREATE TABLE TRANSPORTATION (
    id_transportation int NOT NULL,
    transportation_type VARCHAR(20) NOT NULL,
    CONSTRAINT PK_TRANSPORTATION PRIMARY KEY (id_transportation)
);

-- Table: BRENT
CREATE TABLE BRENT (
    id_brent int NOT NULL,
    brent_date date,
    brent_value float,
    CONSTRAINT PK_BRENT PRIMARY KEY (id_brent)
);

-- foreign keys
-- Reference: FK_SALE_CLIENT (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_SALE_CLIENT FOREIGN KEY FK_SALE_CLIENT (id_client)
    REFERENCES CLIENT (id_client);

-- Reference: FK_SALE_CRUDE (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_SALE_CRUDE FOREIGN KEY FK_SALE_CRUDE (id_crude)
    REFERENCES CRUDE (id_crude);
    
-- Reference: FK_SALE_CONCEPT (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_SALE_CONCEPT FOREIGN KEY FK_SALE_CONCEPT (id_sale_concept)
    REFERENCES SALE_CONCEPT (id_sale_concept);
    
-- Reference: FK_DESTINATION (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_DESTINATION FOREIGN KEY FK_DESTINATION (id_destination)
    REFERENCES DESTINATION (id_destination);
    
-- Reference: FK_TRANSPORTATION (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_TRANSPORTATION FOREIGN KEY FK_TRANSPORTATION (id_transportation)
    REFERENCES TRANSPORTATION (id_transportation);
    
-- Reference: FK_MARKET (table: SALE)
ALTER TABLE SALE ADD CONSTRAINT FK_MARKET FOREIGN KEY FK_MARKET (id_market)
    REFERENCES MARKET (id_market);

-- Reference: FK_COST_SUPPLIER (table: COST)
ALTER TABLE COST ADD CONSTRAINT FK_COST_SUPPLIER FOREIGN KEY FK_COST_SUPPLIER (id_supplier)
    REFERENCES SUPPLIER (id_supplier);

-- Reference: FK_COST_CONCEPT(table: COST)
ALTER TABLE COST ADD CONSTRAINT FK_COST_CONCEPT FOREIGN KEY FK_COST_CONCEPT (id_cost_concept)
    REFERENCES COST_CONCEPT (id_cost_concept);

-- Reference: FK_COST_SALE (table: COST_SALE)
ALTER TABLE COST_SALE ADD CONSTRAINT FK_COST_SALE FOREIGN KEY FK_COST_SALE (id_sale)
    REFERENCES SALE (id_sale);
    
-- Reference: FK_COST_SALE (table: COST_SALE)
ALTER TABLE COST_SALE ADD CONSTRAINT FK_SALE_COST FOREIGN KEY FK_SALE_COST (id_cost)
    REFERENCES COST (id_cost);

-- Reference: FK_SALE_DETAIL_SALE (table: SALE_DETAIL)
ALTER TABLE SALE_DETAIL ADD CONSTRAINT FK_SALE_DETAIL_SALE FOREIGN KEY FK_SALE_DETAIL_SALE (id_sale)
    REFERENCES SALE (id_sale);
    
-- Reference: FK_SALE_DETAIL_AREA (table: SALE_DETAIL)
ALTER TABLE SALE_DETAIL ADD CONSTRAINT FK_SALE_DETAIL_AREA FOREIGN KEY FK_SALE_DETAIL_AREA (id_area)
    REFERENCES AREA (id_area);

-- Reference: FK_BASIN (table: AREA)
ALTER TABLE AREA ADD CONSTRAINT FK_BASIN FOREIGN KEY FK_BASIN (id_basin)
    REFERENCES BASIN (id_basin);

-- Population -- Table: BASIN
insert into BASIN (id_basin, basin_name) values (1, 'NOA');
insert into BASIN (id_basin, basin_name) values (2, 'NQN');
insert into BASIN (id_basin, basin_name) values (3, 'GSJ');

-- Population -- Table: AREA
insert into AREA (id_area, area_name, id_basin) values (1, 'Fortin de Piedra', 2);
insert into AREA (id_area, area_name, id_basin) values (2, 'Agua Salada', 2);
insert into AREA (id_area, area_name, id_basin) values (3, 'Los Bastos', 2);
insert into AREA (id_area, area_name, id_basin) values (4, 'Punta Senillosa', 2);
insert into AREA (id_area, area_name, id_basin) values (5, 'Los Toldos I Sur', 2);
insert into AREA (id_area, area_name, id_basin) values (6, 'Aguaragüe', 1);
insert into AREA (id_area, area_name, id_basin) values (7, 'Ramos', 1);
insert into AREA (id_area, area_name, id_basin) values (8, 'El Tordillo', 3);
insert into AREA (id_area, area_name, id_basin) values (9, 'Estancia La Mariposa', 3);

-- Population -- Table: CLIENT
insert into CLIENT (id_client, client_name, cuit) values (1, 'Trafigura', '21630');
insert into CLIENT (id_client, client_name, cuit) values (2, 'Refinor',   '88630');
insert into CLIENT (id_client, client_name, cuit) values (3, 'YPF',       '24734');

-- Population -- Table: SALE_CONCEPT
insert into SALE_CONCEPT (id_sale_concept, sale_concept_name) values (1, 'Producto');
insert into SALE_CONCEPT (id_sale_concept, sale_concept_name) values (2, 'Impuesto');

-- Population -- Table: COST_CONCEPT
insert into COST_CONCEPT (id_cost_concept, cost_concept_name) values (1, 'Embarque');
insert into COST_CONCEPT (id_cost_concept, cost_concept_name) values (2, 'Transporte');
insert into COST_CONCEPT (id_cost_concept, cost_concept_name) values (3, 'Inspección');
insert into COST_CONCEPT (id_cost_concept, cost_concept_name) values (4, 'Despachante');

-- Population -- Table: MARKET
insert into MARKET (id_market, market_name) values (1, 'Local');
insert into MARKET (id_market, market_name) values (2, 'Exportación');

-- Population -- Table: DESTINATION
insert into DESTINATION (id_destination, destination_name) values (1, 'Brazil');
insert into DESTINATION (id_destination, destination_name) values (2, 'USA');
insert into DESTINATION (id_destination, destination_name) values (3, 'Italy');
insert into DESTINATION (id_destination, destination_name) values (4, 'Argentina');

-- Population -- Table: BRENT
insert into BRENT (id_brent, brent_date, brent_value) values (1, '2022-10-01', 83);
insert into BRENT (id_brent, brent_date, brent_value) values (2, '2022-10-02', 82.4);
insert into BRENT (id_brent, brent_date, brent_value) values (3, '2022-10-03', 81);
insert into BRENT (id_brent, brent_date, brent_value) values (4, '2022-10-04', 82.1);
insert into BRENT (id_brent, brent_date, brent_value) values (5, '2022-10-05', 83.1);
insert into BRENT (id_brent, brent_date, brent_value) values (6, '2022-10-06', 83.9);
insert into BRENT (id_brent, brent_date, brent_value) values (7, '2022-10-07', 84.2);
insert into BRENT (id_brent, brent_date, brent_value) values (8, '2022-10-08', 86.7);
insert into BRENT (id_brent, brent_date, brent_value) values (9, '2022-10-09', 88.2);
insert into BRENT (id_brent, brent_date, brent_value) values (10, '2022-10-10', 84.2);

-- Population -- Table: TRANSPORTATION
insert into TRANSPORTATION (id_transportation, transportation_type) values (1, 'Oleducto');
insert into TRANSPORTATION (id_transportation, transportation_type) values (2, 'Barco');
insert into TRANSPORTATION (id_transportation, transportation_type) values (3, 'Camión');

-- Population -- Table: CRUDE
insert into CRUDE (id_crude, crude_name) values (1, 'Medanito');
insert into CRUDE (id_crude, crude_name) values (2, 'Escalante');
insert into CRUDE (id_crude, crude_name) values (3, 'Condensado');

-- Population -- Table: SUPPLIER
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (1, 'Schiaffino', '12345');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (2, 'SGS',        '12845');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (3, 'Ebytem',     '19345');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (4, 'Termap',     '12375');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (5, 'Oldelval',   '12645');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (6, 'OLCLP',      '19945');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (7, 'Exxon',      '13245');
insert into SUPPLIER (id_supplier, supplier_name, cuit) values (8, 'Bureau V',   '66645');

-- Population -- Table: SALE
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (1, 1, 1, 1, 2, 1, 2, '2022-10-06', 88);
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (2, 2, 2, 1, 1, 4, 1, '2022-10-18', 65);
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (3, 3, 3, 1, 2, 3, 2, '2022-10-23', 95);
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (4, 1, 1, 1, 1, 4, 1, '2022-11-05', 66);
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (5, 2, 2, 1, 1, 4, 3, '2022-11-15', 71);
insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (6, 3, 3, 1, 2, 2, 2, '2022-11-20', 83);

-- Population -- Table: SALE_DETAIL
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (1, 1, 1, 5000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (2, 1, 2, 3000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (3, 2, 3, 2000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (4, 2, 4, 9000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (5, 3, 7, 1000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (6, 4, 8, 8000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (7, 5, 1, 2000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (8, 5, 4, 3000);
insert into SALE_DETAIL (id_detail, id_sale, id_area, volume) values (9, 6, 1, 9000);

-- Population -- Table: COST
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (1, 3, 1, 0, '2022-10-01', '0002A00002211');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (2, 4, 1, 0, '2022-10-01', '0002A00002441');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (3, 5, 2, 0, '2022-10-01', '0002A00002991');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (4, 6, 2, 0, '2022-10-01', '0002A00008811');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (5, 7, 2, 0, '2022-10-01', '0002A00002761');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (6, 8, 3, 0, '2022-10-01', '0002A00002217');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (7, 1, 4, 0, '2022-10-01', '0002A00002551');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (8, 2, 3, 0, '2022-10-01', '0002A00002266');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (9, 3, 1, 0, '2022-10-01', '0002A00002271');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (10, 4, 1, 0, '2022-11-01', '0002A00004311');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (11, 5, 2, 0, '2022-11-01', '0002A00002486');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (12, 6, 3, 0, '2022-11-01', '0002A00002388');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (13, 6, 2, 0, '2022-11-01', '0002A00002288');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (14, 7, 2, 0, '2022-11-01', '0002A00002999');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (15, 8, 3, 0, '2022-11-01', '0002A00002777');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (16, 1, 4, 0, '2022-11-01', '0002A00002451');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (17, 2, 3, 0, '2022-11-01', '0002A00002512');
insert into COST (id_cost, id_supplier, id_cost_concept, manageable, cost_day, invoice_number) values (18, 3, 1, 0, '2022-11-01', '0002A00002276');


-- Population -- Table: COST_SALE
insert into COST_SALE (id_cost, id_sale) values (1, 1);
insert into COST_SALE (id_cost, id_sale) values (2, 2);
insert into COST_SALE (id_cost, id_sale) values (3, 1);
insert into COST_SALE (id_cost, id_sale) values (4, 2);
insert into COST_SALE (id_cost, id_sale) values (5, 3);
insert into COST_SALE (id_cost, id_sale) values (6, 1);
insert into COST_SALE (id_cost, id_sale) values (7, 2);
insert into COST_SALE (id_cost, id_sale) values (8, 3);
insert into COST_SALE (id_cost, id_sale) values (9, 3);
insert into COST_SALE (id_cost, id_sale) values (10, 4);
insert into COST_SALE (id_cost, id_sale) values (11, 5);
insert into COST_SALE (id_cost, id_sale) values (12, 4);
insert into COST_SALE (id_cost, id_sale) values (13, 4);
insert into COST_SALE (id_cost, id_sale) values (14, 6);
insert into COST_SALE (id_cost, id_sale) values (15, 5);
insert into COST_SALE (id_cost, id_sale) values (16, 6);
insert into COST_SALE (id_cost, id_sale) values (17, 6);
insert into COST_SALE (id_cost, id_sale) values (18, 6);

use oil_sales_model;

-- Views --
-- Lista de todos los costos --
CREATE OR REPLACE VIEW costs AS 
SELECT * FROM cost;

-- Ventas al cliente “Trafigura” --
CREATE OR REPLACE VIEW sales_trafigura AS
(SELECT * FROM sale
	WHERE id_client = 1
);

-- Ventas con precios superiores a 70 usd/bbl --
CREATE OR REPLACE VIEW sales_over70 AS
(SELECT s.sale_day, c.client_name, s.id_market, s.price
	FROM sale s
	JOIN client c
	ON s.id_client = c.id_client
    WHERE s.price > 70
);

-- Costos de las ventas al cliente “YPF” --
CREATE OR REPLACE VIEW costs_ypf AS
SELECT ccs.*, s.id_market, s.price, s.id_client
	FROM (SELECT c.id_cost_concept, c.invoice_number, c.cost_day, cs.id_sale
			FROM cost c
			JOIN cost_sale cs
			ON c.id_cost = cs.id_cost) ccs
	JOIN sale s
    ON ccs.id_sale = s.id_sale
    WHERE id_client = 3;

-- Ventas con nombre de cada cliente --
CREATE OR REPLACE VIEW sales_with_client_names AS
(SELECT c.client_name, s.sale_day, s.id_market, s.price
	FROM client c
	JOIN sale s
	ON s.id_client = c.id_client
);

select * from client;

-- Functions --
-- Función 'get_client_id': obtener el ID de un cliente determinado--
DELIMITER $$
CREATE FUNCTION `get_client_id` (name VARCHAR(20))
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE resultado INT;
    SET resultado = (SELECT id_client FROM client
    WHERE client_name LIKE name);
	RETURN resultado;
END $$

SELECT get_client_id("YPF");

-- Función 'get_client_name': obtener el nombre de un cliente a partir de su ID--
DELIMITER $$
CREATE FUNCTION `get_client_name` (id INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(20);
    SET resultado = (SELECT client_name FROM client
    WHERE id_client = id);
	RETURN resultado;
END $$

SELECT get_client_name(1);

-- Función 'get_crude_name': obtener el nombre de un crudo a partir de su ID--
DELIMITER $$
CREATE FUNCTION `get_crude_name` (id INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(20);
    SET resultado = (SELECT crude_name FROM crude
    WHERE id_crude = id);
	RETURN resultado;
END $$

-- Función 'get_market_name': obtener el mercado a partir de su ID--
DELIMITER $$
CREATE FUNCTION `get_market_name` (id INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(20);
    SET resultado = (SELECT market_name FROM market
    WHERE id_market = id);
	RETURN resultado;
END $$

-- Función 'get_transportation': obtener el transporte utilizado para la venta a partir de su ID--
DELIMITER $$
CREATE FUNCTION `get_transportation` (id INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(20);
    SET resultado = (SELECT transportation_type FROM transportation
    WHERE id_transportation = id);
	RETURN resultado;
END $$

-- Stored Procedures --
-- client_sales procedure --
USE oil_sales_model;
DROP PROCEDURE IF EXISTS `client_sales`;

USE oil_sales_model;
DELIMITER $$
CREATE PROCEDURE `client_sales`(IN client_name_input VARCHAR(20))
BEGIN
	DECLARE id_del_cliente INT;
	SET id_del_cliente = get_client_id(client_name_input);
	IF (id_del_cliente > 0) THEN
		SELECT 
			t.id_sale AS "ID de Venta", 
			get_client_name(t.id_client) AS "Cliente", 
			get_crude_name(t.id_crude) AS "Crudo", 
			get_market_name(t.id_market) AS "Mercado",
            get_transportation(t.id_transportation) AS "Transporte", 
			sum(volume) AS "Volumen", 
			sum(volume*price)/sum(volume) AS "Precio", 
			sum(volume*price) AS "Monto"
		FROM (SELECT s.*, d.volume
			FROM sale s
			JOIN sale_detail d
			ON s.id_sale = d.id_sale
			WHERE s.id_client = id_del_cliente) t
		GROUP BY id_sale;
	ELSE
		SELECT "El cliente no existe. Revise el nombre ingresado.";
	END IF;
END $$

USE oil_sales_model;
CALL client_sales ('Trafigura');

-- Order sales By [columna] --
USE oil_sales_model;
DROP PROCEDURE IF EXISTS `get_sales_order`;

USE oil_sales_model;
DELIMITER $$
CREATE PROCEDURE `get_sales_order`(IN field VARCHAR(20))
BEGIN
	IF field <> '' THEN
		SET @sale_order = concat('ORDER BY ', field);
	ELSE
		SET @sale_order = '';
	END IF;
SET @clausula = concat('SELECT * FROM sale ', @sale_order);
PREPARE runSQL FROM @clausula;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END $$

USE oil_sales_model;
CALL get_sales_order ('price');

-- Triggers --
-- Audit Table --
CREATE TABLE _audit (
	id_log INT PRIMARY KEY auto_increment,
    entity VARCHAR(100),
    entity_id INT,
    insert_dt datetime,
    created_by varchar(100),
    last_update_dt datetime,
    last_updated_by varchar(100)
);

-- Create Trigger Audit Sale Insertion --
CREATE TRIGGER `tr_insert_sale_aud`
AFTER INSERT ON `sale`
FOR EACH ROW
INSERT INTO `_audit` (
	entity,
    entity_id,
    insert_dt,
    created_by,
    last_update_dt,
    last_updated_by
    )
VALUES (
	'sale',
	NEW.id_sale,
	CURRENT_TIMESTAMP(),
	USER(),
	CURRENT_TIMESTAMP(),
	USER()
)

insert into SALE (id_sale, id_client, id_crude, id_sale_concept, id_market, id_destination, id_transportation, sale_day, price) values (7, 1, 1, 1, 2, 3, 2, '2022-12-04', 82);

SELECT * FROM _audit

USE oil_sales_model;
-- Create Trigger Audit Sale Update --
DROP TRIGGER IF EXISTS `tr_update_sale_aud`

USE oil_sales_model;
CREATE TRIGGER `tr_update_sale_aud`
AFTER UPDATE ON `sale`
FOR EACH ROW
UPDATE `_audit` SET  last_update_dt = CURRENT_TIMESTAMP(), last_updated_by = USER()
WHERE entity_id = OLD.id_sale

UPDATE SALE SET price = 105 WHERE id_sale = 7;

SELECT * FROM _audit