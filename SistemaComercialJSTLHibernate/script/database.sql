/*
SQLyog Enterprise - MySQL GUI v5.25
Host - 5.0.89-community-nt : Database - dbalfaccweb
*********************************************************************
Server version : 5.0.89-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `dbalfaccweb`;

USE `dbalfaccweb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `ajuste` */

DROP TABLE IF EXISTS `ajuste`;

CREATE TABLE `ajuste` (
  `ajuste_nro` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `mtacodigo` int(11) default NULL,
  `ajfecha` date NOT NULL,
  `ajcantidad` int(11) default NULL,
  PRIMARY KEY  (`ajuste_nro`,`dep_codigo`,`suc_codigo`,`art_codigo`),
  KEY `ajuste_FKIndex2` (`suc_codigo`),
  KEY `ajuste_ibfk_4` (`dep_codigo`),
  KEY `art_codigo` (`art_codigo`,`suc_codigo`,`dep_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  KEY `mtacodigo` (`mtacodigo`),
  CONSTRAINT `ajuste_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `ajuste_ibfk_2` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `ajuste_ibfk_3` FOREIGN KEY (`mtacodigo`) REFERENCES `motivoajuste` (`mtacodigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `apercierre` */

DROP TABLE IF EXISTS `apercierre`;

CREATE TABLE `apercierre` (
  `ope_nro` int(11) NOT NULL,
  `ope_fecha` date default NULL,
  `ope_cajero` varchar(50) NOT NULL,
  `caj_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `ape_fec_hor` datetime default NULL,
  `cie_fec_hor` datetime default NULL,
  `montoaper` double(20,2) default NULL,
  `montocierre` double(20,2) default NULL,
  `estado` varchar(1) default NULL,
  PRIMARY KEY  (`ope_nro`),
  KEY `apercierre_FKIndex1` (`caj_codigo`),
  KEY `apercierre_FKIndex2` (`suc_codigo`),
  CONSTRAINT `apercierre_ibfk_1` FOREIGN KEY (`caj_codigo`) REFERENCES `caja` (`caj_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `apercierre_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `articulo` */

DROP TABLE IF EXISTS `articulo`;

CREATE TABLE `articulo` (
  `art_codigo` int(11) NOT NULL,
  `artbarra` varchar(50) default NULL,
  `gru_codigo` int(11) default NULL,
  `tg_codigo` int(11) default NULL,
  `artnomreal` varchar(80) default NULL,
  `artnomfact` varchar(80) default NULL,
  `artcodorigen` varchar(50) default NULL,
  `artnropieza` varchar(50) default NULL,
  `mar_codigo` int(11) default NULL,
  `codigomarca` varchar(50) default NULL,
  `pais_codigo` int(11) default NULL,
  `artprecact` double(20,3) default NULL,
  `artpreant` double(20,3) default NULL,
  `artpreventa` double(20,3) default NULL,
  `arttpiva` varchar(7) default NULL,
  `ubica_codigo` int(11) default NULL,
  `artstockmin` int(11) default NULL,
  `artobs` varchar(200) default NULL,
  `artivaporc` int(11) default NULL,
  PRIMARY KEY  (`art_codigo`),
  KEY `articulo_FKIndex3` (`mar_codigo`),
  KEY `articulo_FKIndex5` (`gru_codigo`),
  KEY `articulo_FKIndex6` (`tg_codigo`),
  KEY `articulo_FKIndex4` (`pais_codigo`),
  KEY `articulo_FKIndex7` (`ubica_codigo`),
  CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`gru_codigo`) REFERENCES `grupo` (`gru_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`mar_codigo`) REFERENCES `marca` (`mar_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`pais_codigo`) REFERENCES `pais` (`pais_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `articulo_ibfk_4` FOREIGN KEY (`tg_codigo`) REFERENCES `tipo_grupo` (`tg_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `articulo_ibfk_5` FOREIGN KEY (`ubica_codigo`) REFERENCES `ubicacion` (`ubica_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asignacion_ff` */

DROP TABLE IF EXISTS `asignacion_ff`;

CREATE TABLE `asignacion_ff` (
  `asig_nro` int(11) NOT NULL,
  `resp_codigo` int(11) default NULL,
  `fon_codigo` int(11) default NULL,
  `asig_fecha` date default NULL,
  `asig_monto` double(20,2) default NULL,
  `asig_saldo` double(20,2) default NULL,
  PRIMARY KEY  (`asig_nro`),
  KEY `FK_asignacion_ff` (`fon_codigo`),
  KEY `resp_codigo` (`resp_codigo`),
  CONSTRAINT `asignacion_ff_ibfk_1` FOREIGN KEY (`fon_codigo`) REFERENCES `fondo_fijo` (`fon_codigo`),
  CONSTRAINT `asignacion_ff_ibfk_2` FOREIGN KEY (`resp_codigo`) REFERENCES `responsable_ff` (`resp_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `audi_stock` */

DROP TABLE IF EXISTS `audi_stock`;

CREATE TABLE `audi_stock` (
  `nueart_codigo` int(11) default NULL,
  `viart_codigo` int(11) default NULL,
  `nusuc_codigo` int(11) default NULL,
  `visuc_codigo` int(11) default NULL,
  `nudep_codigo` int(11) default NULL,
  `videp_codigo` int(11) default NULL,
  `nust_existencia` int(11) default NULL,
  `vist_existencia` int(11) default NULL,
  `fec_hor_oper` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `usuario` varchar(50) default NULL,
  `operacion` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `banco` */

DROP TABLE IF EXISTS `banco`;

CREATE TABLE `banco` (
  `ban_codigo` int(11) NOT NULL,
  `ban_nombre` varchar(50) NOT NULL,
  `ban_direccion` varchar(50) NOT NULL,
  `ban_telef` varchar(30) NOT NULL,
  PRIMARY KEY  (`ban_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `caj_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `caj_nombre` varchar(30) NOT NULL,
  PRIMARY KEY  (`caj_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cajero` */

DROP TABLE IF EXISTS `cajero`;

CREATE TABLE `cajero` (
  `caje_codigo` int(11) NOT NULL,
  `caje_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`caje_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `cat_codigo` int(11) NOT NULL,
  `cat_nombre` varchar(50) default NULL,
  `cat_porce_ganancia` double(10,2) default NULL,
  `cat_porce_descuento` double(10,2) default NULL,
  PRIMARY KEY  (`cat_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cheque_e` */

DROP TABLE IF EXISTS `cheque_e`;

CREATE TABLE `cheque_e` (
  `che_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `cta_cte_nro` varchar(50) NOT NULL,
  `titu_codigo` int(11) NOT NULL,
  `tp_cheq` int(10) unsigned NOT NULL,
  `che_monto` double(20,3) default NULL,
  `che_fec_emi` date default NULL,
  `che_fec_ven` date default NULL,
  `mon_codigo` int(11) NOT NULL,
  PRIMARY KEY  (`che_nro`,`ban_codigo`,`cta_cte_nro`),
  KEY `cta_cte_nro` (`cta_cte_nro`,`ban_codigo`),
  KEY `tp_cheq` (`tp_cheq`),
  KEY `titu_codigo` (`titu_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `cheque_e_ibfk_1` FOREIGN KEY (`cta_cte_nro`, `ban_codigo`) REFERENCES `cta_cte` (`cta_cte_nro`, `ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_2` FOREIGN KEY (`tp_cheq`) REFERENCES `tipo_cheque` (`tp_cheq`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_3` FOREIGN KEY (`titu_codigo`) REFERENCES `titular` (`titu_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cheque_r` */

DROP TABLE IF EXISTS `cheque_r`;

CREATE TABLE `cheque_r` (
  `che_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `cta_cte_nro` varchar(50) NOT NULL,
  `tp_cheq` int(10) unsigned NOT NULL,
  `che_fec_r` date default NULL,
  `che_fec_v` date default NULL,
  `che_monto` double(20,2) default NULL,
  `mon_codigo` int(11) NOT NULL,
  `titular` varchar(50) NOT NULL,
  PRIMARY KEY  (`che_nro`,`ban_codigo`),
  KEY `tp_cheq` (`tp_cheq`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `cheque_r_ibfk_1` (`ban_codigo`),
  CONSTRAINT `cheque_r_ibfk_1` FOREIGN KEY (`ban_codigo`) REFERENCES `banco` (`ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_r_ibfk_2` FOREIGN KEY (`tp_cheq`) REFERENCES `tipo_cheque` (`tp_cheq`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_r_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `ciu_codigo` int(11) NOT NULL,
  `ciu_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`ciu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `clie_codigo` int(11) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `clie_razon` varchar(50) NOT NULL,
  `clie_direcc` varchar(70) default NULL,
  `clie_telef` varchar(30) default NULL,
  `clie_movil` varchar(30) default NULL,
  `clie_ruc` varchar(30) default NULL,
  `clie_correo` varchar(70) default NULL,
  `clie_comen` varchar(100) default NULL,
  `clie_cip` varchar(30) default NULL,
  `cat_codigo` int(11) default NULL,
  PRIMARY KEY  (`clie_codigo`),
  KEY `cliente_FKIndex1` (`ciu_codigo`),
  KEY `FK_cliente` (`cat_codigo`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cat_codigo`) REFERENCES `categoria` (`cat_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ciu_codigo`) REFERENCES `ciudad` (`ciu_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cobranza` */

DROP TABLE IF EXISTS `cobranza`;

CREATE TABLE `cobranza` (
  `ven_nro` int(10) unsigned NOT NULL,
  `fecha_pago` date NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `cuo_nro` int(11) NOT NULL,
  `monto_cobrar` double(20,2) NOT NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  PRIMARY KEY  (`ven_nro`,`fecha_pago`,`clie_codigo`,`forc_codigo`,`cuo_nro`,`monto_cobrar`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `clie_codigo` (`clie_codigo`,`ven_nro`),
  KEY `mon_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_cobranza` (`suc_codigo`),
  CONSTRAINT `cobranza_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_2` FOREIGN KEY (`clie_codigo`, `ven_nro`) REFERENCES `cta_a_cobrar` (`clie_codigo`, `ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_3` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_5` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cobro` */

DROP TABLE IF EXISTS `cobro`;

CREATE TABLE `cobro` (
  `cob_nro` int(11) NOT NULL,
  `ven_nro` int(11) NOT NULL,
  `ope_nro` int(11) default NULL,
  `cob_fecha` date default NULL,
  `suc_codigo` int(11) default NULL,
  `tipo_operacion` varchar(70) default NULL,
  PRIMARY KEY  (`cob_nro`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `ope_nro` (`ope_nro`),
  KEY `ven_nro` (`ven_nro`),
  CONSTRAINT `cobro_ibfk_1` FOREIGN KEY (`ope_nro`) REFERENCES `apercierre` (`ope_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobro_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `com_nro` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `pro_codigo` int(11) NOT NULL,
  `com_fact_nro` varchar(30) default NULL,
  `com_fecha` date default NULL,
  `com_exe` double(20,3) default NULL,
  `com_gra` double(20,3) default NULL,
  `com_iva` double(20,3) default NULL,
  `com_desc` double(20,3) default NULL,
  `com_recar` double(20,3) default NULL,
  `com_total` double(20,3) default NULL,
  `com_cond` varchar(7) default NULL,
  `com_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`com_nro`),
  KEY `compra_FKIndex1` (`pro_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cotizacion` */

DROP TABLE IF EXISTS `cotizacion`;

CREATE TABLE `cotizacion` (
  `cot_fecha` date NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `cot_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`cot_fecha`,`mon_codigo`),
  KEY `cotizacion_FKIndex1` (`mon_codigo`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cta_a_cobrar` */

DROP TABLE IF EXISTS `cta_a_cobrar`;

CREATE TABLE `cta_a_cobrar` (
  `clie_codigo` int(11) NOT NULL,
  `ven_nro` int(10) unsigned NOT NULL,
  `monto_cobrar` double(10,2) default NULL,
  `monto_pago` double(10,2) default NULL,
  `fecha_pago` date default NULL,
  `estado_cta` varchar(1) NOT NULL,
  `cuo_nro` int(11) NOT NULL,
  `can_cuo` int(11) default NULL,
  `fec_vto` date default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `total_deuda` double(20,2) default NULL,
  PRIMARY KEY  (`clie_codigo`,`ven_nro`,`cuo_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `ven_nro` (`ven_nro`),
  KEY `suc_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_cta_a_cobrar` (`suc_codigo`),
  CONSTRAINT `cta_a_cobrar_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_2` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_4` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cta_a_pagar` */

DROP TABLE IF EXISTS `cta_a_pagar`;

CREATE TABLE `cta_a_pagar` (
  `com_nro` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `can_cuota` int(11) NOT NULL,
  `total_deuda` double(20,3) default NULL,
  `nro_cuota` int(11) NOT NULL,
  `fecha_vto` date default NULL,
  `fecha_pago` date default NULL,
  `monto_cuota` double(20,3) default NULL,
  `pago_cuota` double(20,3) default NULL,
  `estado_cta` varchar(1) default NULL,
  PRIMARY KEY  (`com_nro`,`mon_codigo`,`suc_codigo`,`pro_codigo`,`can_cuota`,`nro_cuota`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `cta_a_pagar_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_4` FOREIGN KEY (`com_nro`) REFERENCES `compra` (`com_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cta_cte` */

DROP TABLE IF EXISTS `cta_cte`;

CREATE TABLE `cta_cte` (
  `cta_cte_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `titu_codigo` int(11) NOT NULL,
  `fec_aper_cta` date default NULL,
  `fec_cierr_cta` date default NULL,
  PRIMARY KEY  (`cta_cte_nro`,`ban_codigo`),
  KEY `ban_codigo` (`ban_codigo`),
  KEY `titu_codigo` (`titu_codigo`),
  CONSTRAINT `cta_cte_ibfk_1` FOREIGN KEY (`ban_codigo`) REFERENCES `banco` (`ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_cte_ibfk_2` FOREIGN KEY (`titu_codigo`) REFERENCES `titular` (`titu_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `dep_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_nombre` varchar(30) default NULL,
  PRIMARY KEY  (`dep_codigo`,`suc_codigo`),
  KEY `deposito_FKIndex1` (`suc_codigo`),
  CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_compra` */

DROP TABLE IF EXISTS `det_compra`;

CREATE TABLE `det_compra` (
  `com_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `det_com_can` int(11) default NULL,
  `det_com_pre` double(20,3) default NULL,
  `det_com_exe` double(20,3) default NULL,
  `det_com_gra10` double(20,3) default NULL,
  `det_com_gra5` double(20,3) default NULL,
  `det_com_sub` double(20,3) default NULL,
  `det_com_porc` double(10,2) default NULL,
  PRIMARY KEY  (`com_nro`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `det_compra_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_compra_ibfk_2` FOREIGN KEY (`com_nro`) REFERENCES `compra` (`com_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_devolucion` */

DROP TABLE IF EXISTS `det_devolucion`;

CREATE TABLE `det_devolucion` (
  `devo_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detd_can` int(11) default NULL,
  `detd_pre` double(20,3) default NULL,
  `detd_exe` double(20,3) default NULL,
  `det_gra5` double(20,3) default NULL,
  `detd_gra10` double(20,3) default NULL,
  PRIMARY KEY  (`art_codigo`,`devo_nro`),
  KEY `art_codigo` (`art_codigo`),
  KEY `devo_nro` (`devo_nro`),
  CONSTRAINT `det_devolucion_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_devolucion_ibfk_2` FOREIGN KEY (`devo_nro`) REFERENCES `devolucion` (`devo_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_importacion` */

DROP TABLE IF EXISTS `det_importacion`;

CREATE TABLE `det_importacion` (
  `imp_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `det_imp_can` int(10) unsigned default NULL,
  `det_imp_pre` double(20,3) default NULL,
  `det_imp_exc` double(20,3) default NULL,
  `det_imp_gra` double(20,3) default NULL,
  `det_imp_sub` double(20,3) default NULL,
  `det_imp_porc` int(10) unsigned default NULL,
  PRIMARY KEY  (`art_codigo`,`imp_nro`),
  KEY `imp_nro` (`imp_nro`),
  CONSTRAINT `det_importacion_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_importacion_ibfk_2` FOREIGN KEY (`imp_nro`) REFERENCES `importacion` (`imp_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_notacredito` */

DROP TABLE IF EXISTS `det_notacredito`;

CREATE TABLE `det_notacredito` (
  `nc_codigo` int(11) default NULL,
  `art_codigo` int(11) default NULL,
  `detnc_can` int(11) default NULL,
  `detnc_pre` double(20,2) default NULL,
  `detnc_exe` double(20,2) default NULL,
  `detnc_gra5` double(20,2) default NULL,
  `detnc_gra10` double(20,2) default NULL,
  KEY `nc_codigo` (`nc_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `det_notacredito_ibfk_1` FOREIGN KEY (`nc_codigo`) REFERENCES `nota_credito` (`nc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_notacredito_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_pedcliente` */

DROP TABLE IF EXISTS `det_pedcliente`;

CREATE TABLE `det_pedcliente` (
  `pedclie_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detped_can` int(11) default NULL,
  `detped_pre` double(20,2) default NULL,
  `detped_exe` double(20,2) default NULL,
  `detped_gra10` double(20,2) default NULL,
  `detped_gra5` double(20,2) default NULL,
  `detped_sub` double(20,2) default NULL,
  PRIMARY KEY  (`pedclie_nro`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `FK_det_pedcliente` FOREIGN KEY (`pedclie_nro`) REFERENCES `pedido_cliente` (`pedclie_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `det_presupuesto` */

DROP TABLE IF EXISTS `det_presupuesto`;

CREATE TABLE `det_presupuesto` (
  `presu_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detpre_can` int(11) default NULL,
  `detpre_pre` double(20,3) default NULL,
  `detpre_exe` double(20,3) default NULL,
  `detpre_gra10` double(20,3) default NULL,
  `detpre_gra5` double(20,3) default NULL,
  `detpre_sub` double(20,3) default NULL,
  PRIMARY KEY  (`presu_nro`,`art_codigo`),
  KEY `FK_det_presupuesto` (`art_codigo`),
  CONSTRAINT `det_presupuesto_ibfk_1` FOREIGN KEY (`presu_nro`) REFERENCES `presupuesto` (`presu_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `det_presupuesto_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `det_venta` */

DROP TABLE IF EXISTS `det_venta`;

CREATE TABLE `det_venta` (
  `ven_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `det_ven_can` int(10) default NULL,
  `det_ven_pre` double(10,3) default NULL,
  `det_ven_exe` double(10,3) default NULL,
  `det_ven_gra10` double(10,3) default NULL,
  `det_ven_gra5` double(20,3) default NULL,
  `det_ven_sub` double(20,3) default NULL,
  `det_iva_porc` double(10,2) default NULL,
  PRIMARY KEY  (`art_codigo`,`ven_nro`),
  KEY `art_codigo` (`art_codigo`),
  KEY `ven_nro` (`ven_nro`),
  CONSTRAINT `det_venta_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_venta_ibfk_2` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_cobro` */

DROP TABLE IF EXISTS `detalle_cobro`;

CREATE TABLE `detalle_cobro` (
  `cob_nro` int(11) default NULL,
  `forc_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `tipo_operacion` varchar(70) default NULL,
  `monto_cobrado` double(20,2) default NULL,
  KEY `cob_nro` (`cob_nro`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `detalle_cobro_ibfk_1` FOREIGN KEY (`cob_nro`) REFERENCES `cobro` (`cob_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detalle_cobro_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `detalle_cobro_ibfk_3` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_pedep` */

DROP TABLE IF EXISTS `detalle_pedep`;

CREATE TABLE `detalle_pedep` (
  `peded_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detp_cant` int(10) unsigned default NULL,
  `detp_codorig` varchar(50) default NULL,
  PRIMARY KEY  (`peded_nro`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `detalle_pedep_ibfk_1` FOREIGN KEY (`peded_nro`) REFERENCES `pedido_dep` (`peded_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalle_pedep_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `detord_compra` */

DROP TABLE IF EXISTS `detord_compra`;

CREATE TABLE `detord_compra` (
  `ordc_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detordc_can` int(11) default NULL,
  `detordc_pre` double(20,3) default NULL,
  `detordc_exe` double(20,3) default NULL,
  `detordc_gra10` double(20,3) default NULL,
  `detordc_gra5` double(20,3) default NULL,
  `detordc_sub` double(20,3) default NULL,
  PRIMARY KEY  (`ordc_nro`,`art_codigo`),
  KEY `FK_detord_compra` (`art_codigo`),
  CONSTRAINT `detord_compra_ibfk_1` FOREIGN KEY (`ordc_nro`) REFERENCES `orden_compra` (`ordc_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detord_compra_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `detord_pago` */

DROP TABLE IF EXISTS `detord_pago`;

CREATE TABLE `detord_pago` (
  `ord_pago_nro` int(11) NOT NULL,
  `com_nro` int(11) NOT NULL,
  `can_cuota` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `nro_cuota` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `detord_monto` double(20,3) NOT NULL,
  `detord_estado` varchar(1) default NULL,
  `detord_fecvto` date default NULL,
  PRIMARY KEY  (`ord_pago_nro`,`com_nro`,`nro_cuota`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `com_nro` (`com_nro`,`mon_codigo`,`suc_codigo`,`pro_codigo`,`can_cuota`,`nro_cuota`),
  CONSTRAINT `detord_pago_ibfk_1` FOREIGN KEY (`ord_pago_nro`) REFERENCES `ord_pago` (`ord_pago_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detord_pago_ibfk_2` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `devolucion` */

DROP TABLE IF EXISTS `devolucion`;

CREATE TABLE `devolucion` (
  `devo_nro` int(11) NOT NULL,
  `ven_nro` int(11) unsigned NOT NULL,
  `clie_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `devo_fecha` date NOT NULL,
  `devo_monto` double(20,3) default NULL,
  `devo_tipo` varchar(3) default NULL,
  `devo_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`devo_nro`),
  KEY `ven_nro` (`ven_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_4` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_5` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `emp_codigo` int(11) NOT NULL,
  `emp_nombre` varchar(50) default NULL,
  `emp_direcc` varchar(50) default NULL,
  `emp_telef` varchar(30) default NULL,
  `emp_ruc` varchar(50) default NULL,
  `emp_iva` int(11) default NULL,
  PRIMARY KEY  (`emp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `fact_anulado` */

DROP TABLE IF EXISTS `fact_anulado`;

CREATE TABLE `fact_anulado` (
  `fanu_nro` int(11) NOT NULL,
  `ven_nro` int(10) unsigned NOT NULL,
  `fanu_fecha` date default NULL,
  `fanu_motivo` varchar(100) default NULL,
  PRIMARY KEY  (`ven_nro`,`fanu_nro`),
  CONSTRAINT `fact_anulado_ibfk_1` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `fondo_fijo` */

DROP TABLE IF EXISTS `fondo_fijo`;

CREATE TABLE `fondo_fijo` (
  `fon_codigo` int(11) NOT NULL,
  `fon_nombre` varchar(50) default NULL,
  `suc_codigo` int(11) default NULL,
  PRIMARY KEY  (`fon_codigo`),
  KEY `fon_codigo` (`fon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `fondo_fijo_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `forma_cobro` */

DROP TABLE IF EXISTS `forma_cobro`;

CREATE TABLE `forma_cobro` (
  `forc_codigo` int(11) NOT NULL,
  `forc_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`forc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `gasto_fon_fijo` */

DROP TABLE IF EXISTS `gasto_fon_fijo`;

CREATE TABLE `gasto_fon_fijo` (
  `gas_codigo` int(11) NOT NULL,
  `asig_nro` int(11) NOT NULL,
  `tdoc_codigo` int(11) default NULL,
  `gas_fecha` date default NULL,
  `gas_fecha_rend` date default NULL,
  `gas_monto` double(20,2) default NULL,
  PRIMARY KEY  (`gas_codigo`),
  KEY `tdoc_codigo` (`tdoc_codigo`),
  KEY `asig_nro` (`asig_nro`),
  CONSTRAINT `gasto_fon_fijo_ibfk_2` FOREIGN KEY (`tdoc_codigo`) REFERENCES `tipo_documento` (`tdoc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `gasto_fon_fijo_ibfk_3` FOREIGN KEY (`asig_nro`) REFERENCES `asignacion_ff` (`asig_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `gru_codigo` int(11) NOT NULL,
  `gru_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`gru_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `importacion` */

DROP TABLE IF EXISTS `importacion`;

CREATE TABLE `importacion` (
  `imp_nro` int(10) unsigned NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `imp_nrodespacho` varchar(50) NOT NULL,
  `imp_nrofact` varchar(50) default NULL,
  `imp_fecha` date default NULL,
  `imp_exe` double(20,3) default NULL,
  `imp_gra` double(20,3) default NULL,
  `imp_total` double(20,3) default NULL,
  `imp_cond` varchar(7) default NULL,
  `imp_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`imp_nro`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  CONSTRAINT `importacion_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_3` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_4` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `mar_codigo` int(11) NOT NULL,
  `mar_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`mar_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `moneda` */

DROP TABLE IF EXISTS `moneda`;

CREATE TABLE `moneda` (
  `mon_codigo` int(11) NOT NULL,
  `mon_nombre` varchar(50) default NULL,
  `mon_simbolo` varchar(3) default NULL,
  PRIMARY KEY  (`mon_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `motivoajuste` */

DROP TABLE IF EXISTS `motivoajuste`;

CREATE TABLE `motivoajuste` (
  `mtacodigo` int(11) NOT NULL,
  `mtanombre` varchar(50) default NULL,
  PRIMARY KEY  (`mtacodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `mov_caja` */

DROP TABLE IF EXISTS `mov_caja`;

CREATE TABLE `mov_caja` (
  `ope_nro` int(11) NOT NULL,
  `forc_codigo` int(11) default NULL,
  `ope_fecha` datetime default NULL,
  `ope_monto` double(20,2) default NULL,
  `ope_tipo` varchar(50) default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  KEY `mov_caja_FKIndex1` (`forc_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `ope_nro` (`ope_nro`),
  KEY `mon_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_mov_caja` (`suc_codigo`),
  CONSTRAINT `mov_caja_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_2` FOREIGN KEY (`ope_nro`) REFERENCES `apercierre` (`ope_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_4` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `nota_credito` */

DROP TABLE IF EXISTS `nota_credito`;

CREATE TABLE `nota_credito` (
  `nc_codigo` int(11) NOT NULL,
  `devo_nro` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `clie_codigo` int(11) default NULL,
  `nc_fecha` date default NULL,
  `nc_motivo` varchar(50) NOT NULL,
  `nc_monto` double(20,3) NOT NULL,
  `c_nc_estado` varchar(1) default NULL,
  PRIMARY KEY  (`nc_codigo`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `nota_credito_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `nota_credito_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ord_pago` */

DROP TABLE IF EXISTS `ord_pago`;

CREATE TABLE `ord_pago` (
  `ord_pago_nro` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) default NULL,
  `ord_pago_fecha` date NOT NULL,
  `ord_pago_monto` double(20,3) NOT NULL,
  `ord_estado` varchar(7) default NULL,
  PRIMARY KEY  (`ord_pago_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `ord_pago_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `ord_pago_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `orden_compra` */

DROP TABLE IF EXISTS `orden_compra`;

CREATE TABLE `orden_compra` (
  `ordc_nro` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `ordc_fec_elab` date default NULL,
  `ordc_exe` double(20,3) default NULL,
  `ordc_gra` double(20,3) default NULL,
  `ordc_iva` double(20,3) default NULL,
  `ordc_total` double(20,3) default NULL,
  `ordc_cond` varchar(7) default NULL,
  `ordc_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`ordc_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_4` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_5` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `orden_pago` */

DROP TABLE IF EXISTS `orden_pago`;

CREATE TABLE `orden_pago` (
  `ord_pago_nro` int(10) unsigned NOT NULL auto_increment,
  `pro_codigo` int(11) NOT NULL,
  `com_nro` int(11) NOT NULL,
  `ord_pago_fecha` date default NULL,
  `ord_pago_monto` double(20,3) default NULL,
  `ord_estado` varchar(1) default NULL,
  PRIMARY KEY  (`ord_pago_nro`),
  KEY `com_nro` (`com_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  CONSTRAINT `orden_pago_ibfk_1` FOREIGN KEY (`com_nro`) REFERENCES `cta_a_pagar` (`com_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orden_pago_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `pag_nro` int(10) unsigned NOT NULL,
  `ord_pago_nro` int(10) unsigned default NULL,
  `forc_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `pag_fecha` date default NULL,
  `pag_monto` double(20,3) default NULL,
  `pag_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`pag_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `ord_pago_nro` (`ord_pago_nro`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_4` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_5` FOREIGN KEY (`ord_pago_nro`) REFERENCES `orden_pago` (`ord_pago_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `pais_codigo` int(11) NOT NULL,
  `pais_nombre` varchar(50) default NULL,
  `pais_gentilicio` varchar(50) default NULL,
  PRIMARY KEY  (`pais_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pedido_cliente` */

DROP TABLE IF EXISTS `pedido_cliente`;

CREATE TABLE `pedido_cliente` (
  `pedclie_nro` int(11) NOT NULL,
  `clie_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `pedclie_fecha` date default NULL,
  `pedclie_exe` double(20,2) default NULL,
  `pedclie_gra` double(20,2) default NULL,
  `pedclie_iva` double(10,2) default NULL,
  `pedclie_total` double(20,2) default NULL,
  `pedclie_cond` varchar(7) default NULL,
  PRIMARY KEY  (`pedclie_nro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pedido_dep` */

DROP TABLE IF EXISTS `pedido_dep`;

CREATE TABLE `pedido_dep` (
  `peded_nro` int(10) unsigned NOT NULL auto_increment,
  `pdep_fecha` date default NULL,
  PRIMARY KEY  (`peded_nro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `presupuesto` */

DROP TABLE IF EXISTS `presupuesto`;

CREATE TABLE `presupuesto` (
  `presu_nro` int(11) NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `presu_fecha` date NOT NULL,
  `presu_exe` double(20,3) default NULL,
  `presu_gra` double(20,3) default NULL,
  `presu_iva` double(20,3) default NULL,
  `presu_total` double(20,3) default NULL,
  `presu_cond` varchar(7) default NULL,
  PRIMARY KEY  (`presu_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_2` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `privilegios` */

DROP TABLE IF EXISTS `privilegios`;

CREATE TABLE `privilegios` (
  `usuario` varchar(16) default NULL COMMENT 'USUARIO DEL SISTEMA',
  `password` varchar(70) default NULL COMMENT 'LOGIN DEL USUARIO',
  `m_archivo` int(1) default NULL COMMENT 'MENU ARCHIVO',
  `m_archivo_1` int(1) default NULL COMMENT 'MENU COMERCIALES',
  `m_archivo_2` int(1) default NULL COMMENT 'MENU FINANCIEROS',
  `m_archivo_3` int(1) default NULL COMMENT 'MENU ARTICULOS',
  `m_archivo_4` int(1) default NULL COMMENT 'MENU MOVIMIENTOS',
  `m_archivo_5` int(1) default NULL COMMENT 'MENU EMPRESA',
  `m_compra` int(1) default NULL COMMENT 'MENU COMPRA',
  `m_compra_1` int(1) default NULL COMMENT 'MENU ORDEN DE COMPRAS',
  `m_compra_2` int(1) default NULL COMMENT 'MENU COMPRAS',
  `m_compra_3` int(1) default NULL COMMENT 'MENU NOTA DE CREDITO',
  `m_compra_4` int(1) default NULL,
  `m_venta` int(1) default NULL COMMENT 'MENU VENTA',
  `m_venta_1` int(1) default NULL COMMENT 'MENU PRESUPUESTO',
  `m_venta_2` int(1) default NULL COMMENT 'MENU PEDIDO DE CLIENTE',
  `m_venta_3` int(1) default NULL COMMENT 'MENU VENTAS',
  `m_venta_4` int(1) default NULL COMMENT 'MENU DEVOLUCIONES',
  `m_venta_5` int(1) default NULL COMMENT 'MENU ANULAR VENTAS',
  `m_cobranza` int(1) default NULL COMMENT 'MENU COBRANZA',
  `m_cobro_1` int(1) default NULL COMMENT 'MENU APERTURA CIERRE',
  `m_cobro_2` int(1) default NULL COMMENT 'MENU COBRO DE VENTAS',
  `m_cobro_3` int(1) default NULL COMMENT 'MENU COBRO DE VENTAS',
  `m_cobro_4` int(1) default NULL COMMENT 'MENU RECAUDACIONES DE A DEPOSITAR',
  `m_tesoreria` int(1) default NULL COMMENT 'MENU TESORERIA',
  `m_tesoreria_1` int(1) default NULL COMMENT 'MENU DE CARGA DE FACTURAS',
  `m_tesoreria_2` int(1) default NULL COMMENT 'MENU ORDEN DE PAGO',
  `m_tesoreria_3` int(1) default NULL COMMENT 'MENU ASIGNACION DE FONDO FIJO',
  `m_tesoreria_4` int(1) default NULL COMMENT 'MENU GASTOS DE FONDO FIJO',
  `m_tesoreria_5` int(1) default NULL COMMENT 'MENU RENDIR FONDO FIJO',
  `m_tesoreria_6` int(1) default NULL COMMENT 'MENU CONCIALIACION BANCARIA',
  `m_tesoreria_7` int(1) default NULL COMMENT 'MENU CARGA DE OTROS CREDITOS Y DEBITOS',
  `m_tesoreria_8` int(1) default NULL COMMENT 'MENU DEPOSITO BANCARIO',
  `m_inventario` int(1) default NULL COMMENT 'MENU INVENTARIO',
  `m_inventario_1` int(1) default NULL COMMENT 'MENU PEDIDO DE COMPRAS',
  `m_inventario_2` int(1) default NULL COMMENT 'MENU AJUSTE DE INVENTARIO',
  `m_inventario_3` int(1) default NULL COMMENT 'MENU TRANSFERENCIAS ',
  `m_inventario_4` int(1) default NULL COMMENT 'MENU LISTADO PARA INVETARIO',
  `m_informe` int(1) default NULL COMMENT 'MENU INFORMES',
  `m_informe_1` int(1) default NULL COMMENT 'MENU INFORME VARIOS',
  `m_informe_2` int(1) default NULL COMMENT 'MENU INFORME COMPRAS',
  `m_informe_3` int(1) default NULL COMMENT 'MENU INFORME VENTAS',
  `m_informe_4` int(1) default NULL COMMENT 'MENU INFORME COBRANZAS',
  `m_informe_5` int(1) default NULL COMMENT 'MENU INFORME TESORERIA',
  `m_informe_6` int(1) default NULL COMMENT 'MENU INFORME INVENTARIO',
  `m_herraminetas` int(1) default NULL COMMENT 'MENU HERRAMIENTAS',
  `m_calc_1` int(1) default NULL COMMENT 'CALCULADORA',
  `m_cont_2` int(1) default NULL COMMENT 'OUTLOOK',
  `m_agen_3` int(1) default NULL COMMENT 'AGENDA',
  `m_backup_4` int(1) default NULL COMMENT 'BACKUP DE DATOS',
  `m_impresora` int(1) default NULL COMMENT 'CONFIGURACION DE IMPRESORA',
  `m_pdf_5` int(1) default NULL COMMENT 'INSTALAR IMPRESORA PDF',
  `m_internet_6` int(1) default NULL COMMENT 'NAVEGAR CON INTERNET EXPLORER DEL SISTEMA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `pro_codigo` int(11) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `pro_razon` varchar(50) default NULL,
  `pro_ruc` varchar(50) default NULL,
  `pro_direc` varchar(50) default NULL,
  `pro_telef` varchar(30) default NULL,
  `pro_fax` varchar(50) default NULL,
  `pro_mail` varchar(50) default NULL,
  `pro_iva` int(11) default NULL,
  `pais_codigo` int(11) default NULL,
  PRIMARY KEY  (`pro_codigo`),
  KEY `proveedor_FKIndex1` (`ciu_codigo`),
  KEY `pais_codigo` (`pais_codigo`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`ciu_codigo`) REFERENCES `ciudad` (`ciu_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`pais_codigo`) REFERENCES `pais` (`pais_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `rendicion_ff` */

DROP TABLE IF EXISTS `rendicion_ff`;

CREATE TABLE `rendicion_ff` (
  `rend_nro` int(11) NOT NULL auto_increment,
  `asig_nro` int(11) default NULL,
  `rend_fecha` date default NULL,
  `rend_monto_asig` double(20,2) default NULL,
  `rend_monto_rendido` double(20,2) default NULL,
  `rend_saldo` double(20,2) default NULL,
  PRIMARY KEY  (`rend_nro`),
  UNIQUE KEY `rend_nro` (`rend_nro`),
  KEY `asig_nro` (`asig_nro`),
  CONSTRAINT `rendicion_ff_ibfk_1` FOREIGN KEY (`asig_nro`) REFERENCES `asignacion_ff` (`asig_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `responsable_ff` */

DROP TABLE IF EXISTS `responsable_ff`;

CREATE TABLE `responsable_ff` (
  `resp_codigo` int(11) NOT NULL,
  `resp_cip` varchar(30) default NULL,
  `resp_nombre` varchar(50) default NULL,
  `resp_apellido` varchar(50) default NULL,
  PRIMARY KEY  (`resp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `art_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `st_existencia` int(11) default NULL,
  PRIMARY KEY  (`art_codigo`,`suc_codigo`,`dep_codigo`),
  KEY `stock_FKIndex1` (`art_codigo`),
  KEY `stock_FKIndex2` (`dep_codigo`,`suc_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `suc_codigo` int(11) NOT NULL,
  `suc_nombre` varchar(30) default NULL,
  `suc_direccion` varchar(30) default NULL,
  `suc_telefono` varchar(30) default NULL,
  `caj_ultinro` int(11) default NULL,
  PRIMARY KEY  (`suc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_cheque` */

DROP TABLE IF EXISTS `tipo_cheque`;

CREATE TABLE `tipo_cheque` (
  `tp_cheq` int(10) unsigned NOT NULL auto_increment,
  `tp_cheqnombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`tp_cheq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_documento` */

DROP TABLE IF EXISTS `tipo_documento`;

CREATE TABLE `tipo_documento` (
  `tdoc_codigo` int(11) NOT NULL,
  `tdoc_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`tdoc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_grupo` */

DROP TABLE IF EXISTS `tipo_grupo`;

CREATE TABLE `tipo_grupo` (
  `tg_codigo` int(11) NOT NULL,
  `gru_codigo` int(11) NOT NULL,
  `tg_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`tg_codigo`),
  KEY `tipo_articulo_FKIndex1` (`gru_codigo`),
  CONSTRAINT `tipo_grupo_ibfk_1` FOREIGN KEY (`gru_codigo`) REFERENCES `grupo` (`gru_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `titular` */

DROP TABLE IF EXISTS `titular`;

CREATE TABLE `titular` (
  `titu_codigo` int(11) NOT NULL,
  `titu_nombre` varchar(50) NOT NULL,
  `titu_cpi` varchar(50) default '<RAZÃ“N SOCIAL>',
  `titu_direccion` varchar(50) default '<DESCONOCIDO>',
  `titu_telef` varchar(30) default '<DESCONOCIDO>',
  PRIMARY KEY  (`titu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `transferproduc` */

DROP TABLE IF EXISTS `transferproduc`;

CREATE TABLE `transferproduc` (
  `art_codigo` int(11) default NULL,
  `tranfecha` datetime default NULL,
  `tran_cantidad` int(11) default NULL,
  `tran_d_suc` int(11) default NULL,
  `tran_a_suc` int(11) default NULL,
  `tran_d_dep` int(11) default NULL,
  `tran_a_dep` int(11) default NULL,
  KEY `art_codigo` (`art_codigo`),
  KEY `tran_d_suc` (`tran_d_suc`),
  KEY `tran_a_suc` (`tran_a_suc`),
  KEY `tran_d_dep` (`tran_d_dep`),
  KEY `tran_a_dep` (`tran_a_dep`),
  CONSTRAINT `transferproduc_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_2` FOREIGN KEY (`tran_a_suc`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_3` FOREIGN KEY (`tran_d_suc`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_4` FOREIGN KEY (`tran_a_dep`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_5` FOREIGN KEY (`tran_d_dep`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ubicacion` */

DROP TABLE IF EXISTS `ubicacion`;

CREATE TABLE `ubicacion` (
  `ubica_codigo` int(11) NOT NULL,
  `ubica_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`ubica_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `ven_nro` int(10) unsigned NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `ven_fecha` date default NULL,
  `ven_fac_nro` int(11) default NULL,
  `ven_exe` double(20,3) default NULL,
  `ven_gra` double(20,3) default NULL,
  `ven_iva` double(20,3) default NULL,
  `ven_desc` double(10,3) default NULL,
  `ven_recar` double(20,3) default NULL,
  `ven_total` double(20,3) default NULL,
  `ven_cond` varchar(7) default NULL,
  `ven_can_cuo` int(11) default NULL,
  `ven_entrega` double(10,3) default NULL,
  `ven_cambio` int(10) default '0',
  `ven_estanu` varchar(2) default NULL,
  PRIMARY KEY  (`ven_nro`),
  KEY `venta_FKIndex2` (`clie_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
