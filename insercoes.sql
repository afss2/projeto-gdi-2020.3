USE DevaneiosDB;

-- PESSOAS
INSERT INTO pessoa values ('11111111111', 'Katy', 'Hudson', "1984-10-25 00:0:00", '81111111111', null);
INSERT INTO pessoa values ('22222222222', 'Ariana', 'Grande-Butera', "1993-06-26 00:0:00", '81111111112', '81114111112');
INSERT INTO pessoa values ('34567890123', 'Shawn', 'Mendes', "1998-08-08 00:0:00", '81111111113', '81115111112');
INSERT INTO pessoa values ('09876543210', 'Beyoncé', 'Knowles-Carter', "1981-09-04 00:0:00", '81111111114', null);
INSERT INTO pessoa values ('61234543210', 'Shawn', 'Carter', "1969-12-04 00:0:00", '81111111115', null);
INSERT INTO pessoa values ('33333333333', 'Dua', 'Lipa', "1995-08-22 00:0:00", '81111111116', null);
INSERT INTO pessoa values ('44444444444', 'Miley', 'Cyrus', "1992-11-23 00:0:00", '81111111117', null);
INSERT INTO pessoa values ('55555555555', 'Stefani', 'Germanotta', "1986-03-28 00:0:00", '81111111118', null);
INSERT INTO pessoa values ('66666666666', 'Demetria', 'Lovato', "1992-08-20 00:0:00", '81111111119', null);
INSERT INTO pessoa values ('77777777777', 'Sia', 'Furler', "1975-12-18 00:0:00", '81111111120', null);
INSERT INTO pessoa values ('88888888888', 'Normani', 'Kordei', "1996-05-31 00:0:00", '81111111121', null);
INSERT INTO pessoa values ('99999999999', 'Rihanna', 'Fenty', "1988-02-20 00:0:00", '81111111122', null);
INSERT INTO pessoa values ('12345678901', 'Aubrey', 'Drake', "1986-10-24 00:0:00", '81111111123', null);
INSERT INTO pessoa values ('76543210987', 'Harry', 'Styles', "1994-02-01 00:0:00", '81111111123', null);
INSERT INTO pessoa values ('65432109876', 'Thomas', 'Pentz', "1978-11-10 00:0:00", '81111111125', null);
INSERT INTO pessoa values ('13579246802', 'Edward', 'Sheeran', "1991-02-17 00:0:00", '81111111126', null);
INSERT INTO pessoa values ('86420864208', 'Charlie', 'Puth', "1991-12-02 00:0:00", '81111111127', null);
INSERT INTO pessoa values ('97531975319', 'Meghan', 'Trainor', "1993-12-22 00:0:00", '81111111128', null);
INSERT INTO pessoa values ('19283746501', 'Nick', 'Jonas', "1992-09-16 00:0:00", '81111111129', null);
INSERT INTO pessoa values ('09870987098', 'Melissa', 'Jefferson', "1988-04-27 00:0:00", '81111111130', null);
INSERT INTO pessoa values ('76576576576', 'Phabullo', 'Silva', "1994-11-01 00:0:00", '81111111131', null);
INSERT INTO pessoa values ('43243243243', 'Abel', 'Tesfaye', "1990-02-16 00:0:00", '81111111132', null);
INSERT INTO pessoa values ('01020304050', 'Peter', 'Hernandez', "1985-10-08 00:0:00", '81111111133', null);
INSERT INTO pessoa values ('23456789123', 'Selena', 'Gomez', "1992-07-22 00:0:00", '81111111134', null);
INSERT INTO pessoa values ('12121212121', 'Gabrielle', 'Aplin', "1992-10-10 00:0:00", '81111111135', null);
INSERT INTO pessoa values ('01010101010', 'Taylor', 'Swift', "1989-10-13 00:0:00", '81111111136', null);
INSERT INTO pessoa values ('17171717171', 'Justin', 'Bieber', "1994-03-01 00:0:00", '81111111137', null);
INSERT INTO pessoa values ('17192125000', 'Adele', 'Adkins', "1988-05-05 00:0:00", '81111111138', null);
INSERT INTO pessoa values ('90909090909', 'Marquinhos', 'Bot', "1996-02-19 00:0:00", '81111111139', null);

-- DATA-IDADE
INSERT INTO data_idade values ('11111111111', 36);
INSERT INTO data_idade values ('22222222222', 27);
INSERT INTO data_idade values ('34567890123', 22);
INSERT INTO data_idade values ('09876543210', 39);
INSERT INTO data_idade values ('61234543210', 50);
INSERT INTO data_idade values ('33333333333', 25);
INSERT INTO data_idade values ('44444444444', 27);
INSERT INTO data_idade values ('55555555555', 34);
INSERT INTO data_idade values ('66666666666', 28);
INSERT INTO data_idade values ('77777777777', 44);
INSERT INTO data_idade values ('88888888888', 24);
INSERT INTO data_idade values ('99999999999', 32);
INSERT INTO data_idade values ('12345678901', 34);
INSERT INTO data_idade values ('76543210987', 26);
INSERT INTO data_idade values ('65432109876', 42);
INSERT INTO data_idade values ('13579246802', 29);
INSERT INTO data_idade values ('86420864208', 28);
INSERT INTO data_idade values ('97531975319', 26);
INSERT INTO data_idade values ('19283746501', 28);
INSERT INTO data_idade values ('09870987098', 32);
INSERT INTO data_idade values ('76576576576', 26);
INSERT INTO data_idade values ('43243243243', 30);
INSERT INTO data_idade values ('01020304050', 35);
INSERT INTO data_idade values ('23456789123', 28);
INSERT INTO data_idade values ('12121212121', 28);
INSERT INTO data_idade values ('01010101010', 30);
INSERT INTO data_idade values ('17171717171', 26);
INSERT INTO data_idade values ('17192125000', 32);
INSERT INTO data_idade values ('90909090909', 24);

-- FAXINEIROS
-- Selena Gomez, Justin Bieber e Shawn Mendes
INSERT INTO funcionario value ('23456789123', '1045', 'M', '2');
INSERT INTO faxineiro value ('23456789123');
INSERT INTO funcionario value ('34567890123', '1045', 'T', '2');
INSERT INTO faxineiro value ('34567890123');
INSERT INTO funcionario value ('17171717171', '1300', 'N', '2');
INSERT INTO faxineiro value ('17171717171');

-- RECEPCIONISTAS
-- Gabrielle Aplin, Normani Kordei e Katy Hudson
INSERT INTO funcionario value ('12121212121', '2500', 'M', '4');
INSERT INTO recepcionista value ('12121212121');
INSERT INTO funcionario value ('11111111111', '2500', 'T', '4');
INSERT INTO recepcionista value ('11111111111');
INSERT INTO funcionario value ('88888888888', '2000', 'N', '4');
INSERT INTO recepcionista value ('88888888888');

-- SEGURANÇAS
-- Phabullo Silva, Miley Cyrus e Thomas Pentz
INSERT INTO funcionario value ('65432109876', '2500', 'M', '3');
INSERT INTO seguranca value ('65432109876');
INSERT INTO funcionario value ('76576576576', '3500', 'T', '3');
INSERT INTO seguranca value ('76576576576');
INSERT INTO funcionario value ('44444444444', '3500', 'N', '3');
INSERT INTO seguranca value ('44444444444');

-- SÓCIOS
-- Stefani Germanotta, Adele Adkins, Ariana Grande-Butera, Beyoncé Knowles, Rihanna Fenty, Shawn Carter e Marquinhos Bot
INSERT INTO socio value ('17192125000', 10);
INSERT INTO socio value ('55555555555', 10);
INSERT INTO socio value ('22222222222', 10);
INSERT INTO socio value ('09876543210', 10);
INSERT INTO socio value ('99999999999', 10);
INSERT INTO socio value ('61234543210', 10);
INSERT INTO socio value ('90909090909', 40);

-- GERENTES
-- Stefani Germanotta, Ariana Grande-Butera e Sia Furler
INSERT INTO funcionario value ('55555555555', '4500', 'N', '1');
INSERT INTO funcionario value ('22222222222', '4500', DEFAULT, '1');
INSERT INTO funcionario value ('77777777777', '4500', DEFAULT, '1');
INSERT INTO gerente value ('55555555555', '2', 1);
INSERT INTO gerente value ('22222222222', '4', 2);
INSERT INTO gerente value ('77777777777', '3', 3);

-- MOTEL
INSERT INTO motel value (1, '55555555555', 'Av. Caxangá');
INSERT INTO motel value (2, '22222222222', 'Av. Boa Viagem');
INSERT INTO motel value (3, '77777777777', 'Av. Getúlio Vargas');

-- RESERVA
INSERT INTO hospede value ('12345678901', '400');
INSERT INTO reserva value (1, '88888888888', '12345678901');
INSERT INTO atributos_reserva value (1, 10, 200, DEFAULT);
INSERT INTO quarto value (101, 1, 100, 'Padrão');
INSERT INTO acompanhante value ('12345678901', 'Rihanna');

INSERT INTO hospede value ('97531975319', '200');
INSERT INTO reserva value (2, '11111111111', '97531975319');
INSERT INTO atributos_reserva value (2, 8, 400, DEFAULT);
INSERT INTO quarto value (102, 2, 200, 'Prime');
INSERT INTO acompanhante value ('97531975319', 'Charlie');

INSERT INTO hospede value ('19283746501', '340');
INSERT INTO reserva value (3, '12121212121', '19283746501');
INSERT INTO atributos_reserva value (3, 9, 900, DEFAULT);
INSERT INTO quarto value (103, 3, 300, 'Devaneios VIP');
INSERT INTO acompanhante value ('19283746501', 'Priyanka');

-- EXTRAS
INSERT INTO HOSPEDE value ('65432109876', '2534.6');
INSERT INTO MOTEL value (4, '55555555555', 'Av. Recife');

