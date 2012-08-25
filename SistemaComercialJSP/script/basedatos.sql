/*
SQLyog Enterprise - MySQL GUI v5.25
Host - 5.0.89-community-nt : Database - siscom
*********************************************************************
Server version : 5.0.89-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `siscom`;

USE `siscom`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `acesso` */

DROP TABLE IF EXISTS `acesso`;

CREATE TABLE `acesso` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `comando` varchar(45) default NULL,
  `descripcion` varchar(60) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `acesso` */

insert  into `acesso`(`codigo`,`comando`,`descripcion`) values (1,'ingresoCliente','Registro de datos de clientes'),(2,'consultaCliente','Consulta de datos de clientes'),(3,'modificarCliente','Modificar datos de clientes'),(4,'editarCliente','Editar datos de clientes'),(5,'eliminarCliente','Eliminar datos de clientes'),(6,'ingresoFuncionario','Registro de datos de clientes'),(7,'editarFuncionario','Editar datos de funcionarios'),(8,'consultaFuncionario','Consultar datos de funcionarios'),(9,'modificaFuncionario','Modificar datos de funcionarios'),(10,'eliminaFuncionario','Eliminar datos de funcionarios');

/*Table structure for table `acesso_funcionario` */

DROP TABLE IF EXISTS `acesso_funcionario`;

CREATE TABLE `acesso_funcionario` (
  `funcionario_codigo` int(10) unsigned NOT NULL,
  `acesso_codigo` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`funcionario_codigo`,`acesso_codigo`),
  KEY `acesso_funcionario_FKIndex1` (`funcionario_codigo`),
  KEY `acesso_funcionario_FKIndex2` (`acesso_codigo`),
  CONSTRAINT `acesso_funcionario_ibfk_1` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `acesso_funcionario_ibfk_2` FOREIGN KEY (`acesso_codigo`) REFERENCES `acesso` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `acesso_funcionario` */

insert  into `acesso_funcionario`(`funcionario_codigo`,`acesso_codigo`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,8),(6,1),(6,2),(6,3),(6,4),(6,6),(6,7),(6,8),(6,9);

/*Table structure for table `banco` */

DROP TABLE IF EXISTS `banco`;

CREATE TABLE `banco` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `codbanco` int(10) unsigned default NULL,
  `nombre` varchar(50) default NULL,
  `agencia` int(10) unsigned default NULL,
  `conta` int(10) unsigned default NULL,
  `direccion` varchar(50) default NULL,
  `email` varchar(255) default NULL,
  `barrio` varchar(30) default NULL,
  `ciudad` varchar(30) default NULL,
  `cep` varchar(8) default NULL,
  `estado` char(2) default NULL,
  `telefono` varchar(10) default NULL,
  `celular` varchar(10) default NULL,
  `fax` varchar(10) default NULL,
  `gerente` varchar(20) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `banco` */

/*Table structure for table `c_cotacao` */

DROP TABLE IF EXISTS `c_cotacao`;

CREATE TABLE `c_cotacao` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `c_requisicao_codigo` int(10) unsigned NOT NULL,
  `datacot` date default NULL,
  `forn1` int(10) unsigned default NULL,
  `forn2` int(10) unsigned default NULL,
  `forn3` int(10) unsigned default NULL,
  `entrega1` varchar(20) default NULL,
  `entrega2` varchar(20) default NULL,
  `entrega3` varchar(20) default NULL,
  `condicao1` varchar(20) default NULL,
  `condicao2` varchar(20) default NULL,
  `condicao3` varchar(20) default NULL,
  `desconto1` double(9,2) default NULL,
  `desconto2` double(9,2) default NULL,
  `desconto3` double(9,2) default NULL,
  `total1` double(9,2) default NULL,
  `total2` double(9,2) default NULL,
  `total3` double(9,2) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `c_cotacao_FKIndex1` (`c_requisicao_codigo`),
  CONSTRAINT `c_cotacao_ibfk_1` FOREIGN KEY (`c_requisicao_codigo`) REFERENCES `c_requisicao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_cotacao` */

/*Table structure for table `c_nfe` */

DROP TABLE IF EXISTS `c_nfe`;

CREATE TABLE `c_nfe` (
  `numero` int(10) unsigned NOT NULL,
  `cfop_codigo` int(4) unsigned NOT NULL,
  `fornecedor_codigo` int(10) unsigned NOT NULL,
  `emissao` date default NULL,
  `entrada` date default NULL,
  `total` double(9,2) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`numero`),
  KEY `c_nfe_FKIndex1` (`fornecedor_codigo`),
  KEY `c_nfe_FKIndex2` (`cfop_codigo`),
  CONSTRAINT `c_nfe_ibfk_1` FOREIGN KEY (`fornecedor_codigo`) REFERENCES `proveedor` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_nfe_ibfk_2` FOREIGN KEY (`cfop_codigo`) REFERENCES `cfop` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_nfe` */

/*Table structure for table `c_pedido` */

DROP TABLE IF EXISTS `c_pedido`;

CREATE TABLE `c_pedido` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `c_requisicao_codigo` int(10) unsigned NOT NULL,
  `c_cotacao_codigo` int(10) unsigned NOT NULL,
  `dataped` date default NULL,
  `entrega` varchar(50) default NULL,
  `cobranca` varchar(50) default NULL,
  `valor` double(9,2) default NULL,
  `desconto` double(9,2) default NULL,
  `total` double(9,2) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `c_pedido_FKIndex1` (`c_cotacao_codigo`),
  KEY `c_pedido_FKIndex2` (`c_requisicao_codigo`),
  CONSTRAINT `c_pedido_ibfk_1` FOREIGN KEY (`c_cotacao_codigo`) REFERENCES `c_cotacao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_pedido_ibfk_2` FOREIGN KEY (`c_requisicao_codigo`) REFERENCES `c_requisicao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_pedido` */

/*Table structure for table `c_requisicao` */

DROP TABLE IF EXISTS `c_requisicao`;

CREATE TABLE `c_requisicao` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `departamento_codigo` int(10) unsigned NOT NULL,
  `funcionario_codigo` int(10) unsigned NOT NULL,
  `datareq` date default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `c_requisicao_FKIndex1` (`funcionario_codigo`),
  KEY `c_requisicao_FKIndex2` (`departamento_codigo`),
  CONSTRAINT `c_requisicao_ibfk_1` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_requisicao_ibfk_2` FOREIGN KEY (`departamento_codigo`) REFERENCES `departamento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_requisicao` */

/*Table structure for table `c_venda` */

DROP TABLE IF EXISTS `c_venda`;

CREATE TABLE `c_venda` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `funcionario_codigo` int(10) unsigned NOT NULL,
  `tipo_pgto_codigo` int(10) unsigned NOT NULL,
  `cfop_codigo` int(4) unsigned NOT NULL,
  `cliente_codigo` int(10) unsigned NOT NULL,
  `cartao_codigo` int(10) unsigned NOT NULL,
  `datavenda` date default NULL,
  `valor` double(9,2) default NULL,
  `desconto` double(9,2) default NULL,
  `total` double(9,2) default NULL,
  `numparcelas` int(10) unsigned default NULL,
  `privenc` date default NULL,
  `numnota` int(10) unsigned default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `c_venda_FKIndex1` (`cartao_codigo`),
  KEY `c_venda_FKIndex2` (`cliente_codigo`),
  KEY `c_venda_FKIndex3` (`cfop_codigo`),
  KEY `c_venda_FKIndex4` (`tipo_pgto_codigo`),
  KEY `c_venda_FKIndex5` (`funcionario_codigo`),
  CONSTRAINT `c_venda_ibfk_1` FOREIGN KEY (`cartao_codigo`) REFERENCES `cartao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_venda_ibfk_2` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_venda_ibfk_3` FOREIGN KEY (`cfop_codigo`) REFERENCES `cfop` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_venda_ibfk_4` FOREIGN KEY (`tipo_pgto_codigo`) REFERENCES `tipo_pgto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c_venda_ibfk_5` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_venda` */

/*Table structure for table `cartao` */

DROP TABLE IF EXISTS `cartao`;

CREATE TABLE `cartao` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(20) default NULL,
  `taxa` double(3,2) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cartao` */

/*Table structure for table `cfop` */

DROP TABLE IF EXISTS `cfop`;

CREATE TABLE `cfop` (
  `codigo` int(4) unsigned NOT NULL,
  `descricao` varchar(255) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cfop` */

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(100) default NULL,
  `direccion` varchar(50) default NULL,
  `email` varchar(255) default NULL,
  `barrio` varchar(30) default NULL,
  `ciudad` varchar(30) default NULL,
  `dni` varchar(20) default NULL,
  `estado` varchar(20) default NULL,
  `telefono` varchar(20) default NULL,
  `celular` varchar(20) default NULL,
  `cpf` varchar(20) default NULL,
  `obs` varchar(255) default NULL,
  `provincia` varchar(20) default NULL,
  `localidad` varchar(10) default NULL,
  `nacimiento` date default NULL,
  `desde` date default NULL,
  `cnpj` varchar(20) default NULL,
  `insest` varchar(20) default NULL,
  `sexo` varchar(20) default NULL,
  `profesion` varchar(50) default NULL,
  `empresa` varchar(50) default NULL,
  `telempresa` varchar(20) default NULL,
  `ingreso` double(9,2) default NULL,
  `referencia` varchar(50) default NULL,
  `teleref` varchar(20) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

insert  into `cliente`(`codigo`,`nombre`,`direccion`,`email`,`barrio`,`ciudad`,`dni`,`estado`,`telefono`,`celular`,`cpf`,`obs`,`provincia`,`localidad`,`nacimiento`,`desde`,`cnpj`,`insest`,`sexo`,`profesion`,`empresa`,`telempresa`,`ingreso`,`referencia`,`teleref`,`auditoria`) values (1,'Ariel Duarte','Molinas 852','arielpy@gmail.com','Mototo Aurelio','San Fernando','31431944','S','249010','3624249010','1','Developer','Chaco','Resistenci',NULL,NULL,'No se','3143194420','M','Analista de Sistemas','Globant','1110001112',3500.00,'Virginia','0011154788',NULL),(2,'Ivan Duarte','Molinas','ivanpy@gmail.com','nose','nose','31777444','S','11','111','111','nose','nose','San',NULL,NULL,'2','F','','Masa','Ecom','22',5000.00,'Pomelo','222',NULL),(4,'Miguel Majisto','Frodisi 844','m@xxx.xom','Molinares','Resistencia','3934444','S','777','888','777','No tiene','Chaco','Las cruces',NULL,NULL,'CC','36666','M','Developer','Globant','777',5000.00,'Virginia  S','444',NULL),(5,'Miguel Majisto','Frodisi 844','m@xxx.xom','Molinares','Resistencia','3934444','S','777','888','777','No tiene','Chaco','Las cruces',NULL,NULL,'CC','36666','M','Developer','Globant','777',5000.00,'Virginia  S','444',NULL),(6,'Miguel Majisto','Frodisi 844','m@xxx.xom','Molinares','Resistencia','3934444','S','777','888','777','No tiene','Chaco','Las cruces',NULL,NULL,'CC','36666','M','Developer','Globant','777',5000.00,'Virginia  S','444',NULL),(9,'Shasa gary','Mologato 444','rebfap@xxx.com','San Luis','Madrid','45666','Soltera','555','333','Espa?ola','Representante','Madrid','Tutujam',NULL,NULL,'Member Private','33','F','Empresaria','Yo Rebeca','222',10000.00,'Sasha Grey','333',NULL);

/*Table structure for table `d_cotacao` */

DROP TABLE IF EXISTS `d_cotacao`;

CREATE TABLE `d_cotacao` (
  `c_requisicao_codigo` int(10) unsigned NOT NULL,
  `c_cotacao_codigo` int(10) unsigned NOT NULL,
  `qtde` int(10) unsigned default NULL,
  `unit1` double(9,2) default NULL,
  `unit2` double(9,2) default NULL,
  `unit3` double(9,2) default NULL,
  `total1` double(9,2) default NULL,
  `total2` double(9,2) default NULL,
  `total3` double(9,2) default NULL,
  KEY `d_cotacao_FKIndex1` (`c_cotacao_codigo`),
  KEY `d_cotacao_FKIndex2` (`c_requisicao_codigo`),
  CONSTRAINT `d_cotacao_ibfk_1` FOREIGN KEY (`c_cotacao_codigo`) REFERENCES `c_cotacao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_cotacao_ibfk_2` FOREIGN KEY (`c_requisicao_codigo`) REFERENCES `c_requisicao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `d_cotacao` */

/*Table structure for table `d_nfe` */

DROP TABLE IF EXISTS `d_nfe`;

CREATE TABLE `d_nfe` (
  `produto_codigo` int(10) unsigned NOT NULL,
  `c_nfe_numero` int(10) unsigned NOT NULL,
  `qtde` int(11) default NULL,
  `vlrunitario` double(9,2) default NULL,
  `vlrtotal` double(9,2) default NULL,
  KEY `d_nfe_FKIndex1` (`c_nfe_numero`),
  KEY `d_nfe_FKIndex2` (`produto_codigo`),
  CONSTRAINT `d_nfe_ibfk_1` FOREIGN KEY (`c_nfe_numero`) REFERENCES `c_nfe` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_nfe_ibfk_2` FOREIGN KEY (`produto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `d_nfe` */

/*Table structure for table `d_pedido` */

DROP TABLE IF EXISTS `d_pedido`;

CREATE TABLE `d_pedido` (
  `produto_codigo` int(10) unsigned NOT NULL,
  `c_requisicao_codigo` int(10) unsigned NOT NULL,
  `c_cotacao_codigo` int(10) unsigned NOT NULL,
  `c_pedido_codigo` int(10) unsigned NOT NULL,
  `qtde` int(11) default NULL,
  `vlrunitario` double(9,2) default NULL,
  `vlrtotal` double(9,2) default NULL,
  KEY `d_pedido_FKIndex1` (`c_pedido_codigo`),
  KEY `d_pedido_FKIndex2` (`c_cotacao_codigo`),
  KEY `d_pedido_FKIndex3` (`c_requisicao_codigo`),
  KEY `d_pedido_FKIndex4` (`produto_codigo`),
  CONSTRAINT `d_pedido_ibfk_1` FOREIGN KEY (`c_pedido_codigo`) REFERENCES `c_pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_pedido_ibfk_2` FOREIGN KEY (`c_cotacao_codigo`) REFERENCES `c_cotacao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_pedido_ibfk_3` FOREIGN KEY (`c_requisicao_codigo`) REFERENCES `c_requisicao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_pedido_ibfk_4` FOREIGN KEY (`produto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `d_pedido` */

/*Table structure for table `d_requisicao` */

DROP TABLE IF EXISTS `d_requisicao`;

CREATE TABLE `d_requisicao` (
  `produto_codigo` int(10) unsigned NOT NULL,
  `c_requisicao_codigo` int(10) unsigned NOT NULL,
  `qtde` int(11) default NULL,
  `vlrunitario` double(9,2) default NULL,
  `vlrtotal` double(9,2) default NULL,
  KEY `d_requisicao_FKIndex1` (`c_requisicao_codigo`),
  KEY `d_requisicao_FKIndex2` (`produto_codigo`),
  CONSTRAINT `d_requisicao_ibfk_1` FOREIGN KEY (`c_requisicao_codigo`) REFERENCES `c_requisicao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_requisicao_ibfk_2` FOREIGN KEY (`produto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `d_requisicao` */

/*Table structure for table `d_venda` */

DROP TABLE IF EXISTS `d_venda`;

CREATE TABLE `d_venda` (
  `produto_codigo` int(10) unsigned NOT NULL,
  `c_venda_codigo` int(10) unsigned NOT NULL,
  `qtde` int(11) default NULL,
  `vlrunitario` double(9,2) default NULL,
  `vlrtotal` double(9,2) default NULL,
  KEY `d_venda_FKIndex1` (`c_venda_codigo`),
  KEY `d_venda_FKIndex2` (`produto_codigo`),
  CONSTRAINT `d_venda_ibfk_1` FOREIGN KEY (`c_venda_codigo`) REFERENCES `c_venda` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `d_venda_ibfk_2` FOREIGN KEY (`produto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `d_venda` */

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `gerente` varchar(20) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `departamento` */

insert  into `departamento`(`codigo`,`nombre`,`gerente`) values (1,'Informatica','Ariel Duarte'),(2,'Contabilidad','Pedro Gomez'),(3,'Marketing','Veronica Flecher'),(4,'Finanzas','Florecia Russo');

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `departamento_codigo` int(10) unsigned NOT NULL,
  `nombre` varchar(50) default NULL,
  `direccion` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `barrio` varchar(50) default NULL,
  `ciudad` varchar(50) default NULL,
  `dni` varchar(10) default NULL,
  `estado` varchar(10) default NULL,
  `telefono` varchar(30) default NULL,
  `celular` varchar(30) default NULL,
  `provincia` varchar(50) default NULL,
  `nacionalidad` varchar(50) default NULL,
  `profesion` varchar(50) default NULL,
  `fechanacimiento` date default NULL,
  `cargo` varchar(50) default NULL,
  `sueldo` double(10,2) default NULL,
  `login` varchar(10) default NULL,
  `pass` varchar(10) default NULL,
  `auditoria` varchar(50) default NULL,
  `actotal` char(1) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `funcionario_FKIndex1` (`departamento_codigo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`departamento_codigo`) REFERENCES `departamento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `funcionario` */

insert  into `funcionario`(`codigo`,`departamento_codigo`,`nombre`,`direccion`,`email`,`barrio`,`ciudad`,`dni`,`estado`,`telefono`,`celular`,`provincia`,`nacionalidad`,`profesion`,`fechanacimiento`,`cargo`,`sueldo`,`login`,`pass`,`auditoria`,`actotal`) values (1,1,'Ariel Duarte','Molinas 852','arielpy@gmail.com','Urunday','Resistencia','31431944','Soltero','3624249010','3624249010','Chaco','Argentina','Developer',NULL,'Automation',3500.00,'ariel','123',NULL,'S'),(3,1,'Miguel Trmm','Julio Rocca','miguellillo@gmail.com','Burzum','Cordoba','48885557','Soltero','333','3333','Cordoba','Argentina','Ingeniero',NULL,'Developer',2550.00,'mr','123',NULL,'S'),(4,1,'Betina Almada','San Juan 855','ba@hotmail.com','Las Malvinas','Buenos Aires','36666988','Soltero','888','888','Buenos Aires','Argentina','Quality Enginner',NULL,'QC',5500.00,'beti','123',NULL,'N'),(6,1,'Ivan Duarte','Molinas 852','ivanpy@gmail.com','San Fernando','Resistencia','4555669','Casado','03624852741','0362455555','Chaco','Argentina','Analista de Sistemas',NULL,'Programador',10000.00,'ivan','ivan',NULL,'N');

/*Table structure for table `pagamento` */

DROP TABLE IF EXISTS `pagamento`;

CREATE TABLE `pagamento` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `tipo_pgto_codigo` int(10) unsigned NOT NULL,
  `banco_codigo` int(10) unsigned NOT NULL,
  `plano_conta_codigo` int(4) unsigned NOT NULL,
  `c_pedido_codigo` int(10) unsigned NOT NULL,
  `fornecedor_codigo` int(10) unsigned NOT NULL,
  `numdoc` varchar(20) default NULL,
  `vltotal` double(9,2) default NULL,
  `juro` double(9,2) default NULL,
  `multa` double(9,2) default NULL,
  `desconto` double(9,2) default NULL,
  `vlrpago` double(9,2) default NULL,
  `cheque` varchar(6) default NULL,
  `nominal` varchar(50) default NULL,
  `lancamento` date default NULL,
  `emissao` date default NULL,
  `recebimento` date default NULL,
  `vencimento` date default NULL,
  `datacheque` date default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `pagamento_FKIndex1` (`fornecedor_codigo`),
  KEY `pagamento_FKIndex2` (`c_pedido_codigo`),
  KEY `pagamento_FKIndex3` (`plano_conta_codigo`),
  KEY `pagamento_FKIndex4` (`banco_codigo`),
  KEY `pagamento_FKIndex5` (`tipo_pgto_codigo`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`fornecedor_codigo`) REFERENCES `proveedor` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`c_pedido_codigo`) REFERENCES `c_pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagamento_ibfk_3` FOREIGN KEY (`plano_conta_codigo`) REFERENCES `plano_conta` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagamento_ibfk_4` FOREIGN KEY (`banco_codigo`) REFERENCES `banco` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagamento_ibfk_5` FOREIGN KEY (`tipo_pgto_codigo`) REFERENCES `tipo_pgto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pagamento` */

/*Table structure for table `plano_conta` */

DROP TABLE IF EXISTS `plano_conta`;

CREATE TABLE `plano_conta` (
  `codigo` int(4) unsigned NOT NULL,
  `descricao` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plano_conta` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `unidade_codigo` int(10) unsigned NOT NULL,
  `fornecedor_codigo` int(10) unsigned NOT NULL,
  `descricao` varchar(50) default NULL,
  `vlrcompra` double(9,2) default NULL,
  `vlrvenda` double(9,2) default NULL,
  `estoque` int(10) unsigned default NULL,
  `critico` int(10) unsigned default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `produto_FKIndex1` (`fornecedor_codigo`),
  KEY `produto_FKIndex2` (`unidade_codigo`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`fornecedor_codigo`) REFERENCES `proveedor` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`unidade_codigo`) REFERENCES `unidade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(100) default NULL,
  `direccion` varchar(50) default NULL,
  `email` varchar(255) default NULL,
  `barrio` varchar(30) default NULL,
  `ciudad` varchar(30) default NULL,
  `cep` varchar(8) default NULL,
  `estado` char(2) default NULL,
  `telefono` varchar(10) default NULL,
  `celular` varchar(10) default NULL,
  `cpf` varchar(11) default NULL,
  `obs` varchar(255) default NULL,
  `rg` varchar(20) default NULL,
  `orgaorg` varchar(10) default NULL,
  `desde` date default NULL,
  `cnpj` varchar(14) default NULL,
  `insest` varchar(20) default NULL,
  `fax` varchar(10) default NULL,
  `contacto` varchar(20) default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor` */

/*Table structure for table `recebimento` */

DROP TABLE IF EXISTS `recebimento`;

CREATE TABLE `recebimento` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `cliente_codigo` int(10) unsigned NOT NULL,
  `banco_codigo` int(10) unsigned NOT NULL,
  `tipo_pgto_codigo` int(10) unsigned NOT NULL,
  `numdoc` varchar(20) default NULL,
  `vltotal` double(9,2) default NULL,
  `juro` double(9,2) default NULL,
  `multa` double(9,2) default NULL,
  `desconto` double(9,2) default NULL,
  `vlrecebido` double(9,2) default NULL,
  `lancamento` date default NULL,
  `emissao` date default NULL,
  `recebimento` date default NULL,
  `vencimento` date default NULL,
  `auditoria` varchar(50) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `recebimento_FKIndex1` (`tipo_pgto_codigo`),
  KEY `recebimento_FKIndex2` (`banco_codigo`),
  KEY `recebimento_FKIndex3` (`cliente_codigo`),
  CONSTRAINT `recebimento_ibfk_1` FOREIGN KEY (`tipo_pgto_codigo`) REFERENCES `tipo_pgto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recebimento_ibfk_2` FOREIGN KEY (`banco_codigo`) REFERENCES `banco` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recebimento_ibfk_3` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recebimento` */

/*Table structure for table `tipo_pgto` */

DROP TABLE IF EXISTS `tipo_pgto`;

CREATE TABLE `tipo_pgto` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `descricao` varchar(20) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_pgto` */

/*Table structure for table `unidade` */

DROP TABLE IF EXISTS `unidade`;

CREATE TABLE `unidade` (
  `codigo` int(10) unsigned NOT NULL auto_increment,
  `descricao` varchar(10) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unidade` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
