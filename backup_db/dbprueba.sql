-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2020 at 05:39 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbprueba`
--

-- --------------------------------------------------------

--
-- Table structure for table `art_i_articulo`
--

CREATE TABLE `art_i_articulo` (
  `art_idarticulo` int(11) NOT NULL,
  `ctg_idcategoria` int(11) NOT NULL,
  `art_codigo` varchar(50) NOT NULL,
  `art_nombre` varchar(100) NOT NULL,
  `art_stock` int(11) NOT NULL,
  `art_descripcion` varchar(512) NOT NULL,
  `art_imagen` varchar(50) NOT NULL,
  `art_condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ctg_i_categoria`
--

CREATE TABLE `ctg_i_categoria` (
  `ctg_idcategoria` int(11) NOT NULL,
  `ctg_nombre` varchar(70) NOT NULL,
  `ctg_descripcion` varchar(256) DEFAULT NULL,
  `ctg_condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ctg_i_categoria`
--

INSERT INTO `ctg_i_categoria` (`ctg_idcategoria`, `ctg_nombre`, `ctg_descripcion`, `ctg_condicion`) VALUES
(1, 'Hardware', NULL, 1),
(2, 'Software', NULL, 1),
(3, 'Accesorios', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dti_detalleingreso`
--

CREATE TABLE `dti_detalleingreso` (
  `dti_iddetalleingreso` int(11) NOT NULL,
  `igr_idingreso` int(11) DEFAULT NULL,
  `art_idarticulo` int(11) DEFAULT NULL,
  `dti_cantidad` int(11) NOT NULL,
  `dti_preciocompra` decimal(11,2) DEFAULT NULL,
  `dti_precioventa` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dvt_detalleventa`
--

CREATE TABLE `dvt_detalleventa` (
  `dvt_iddetalleventa` int(11) NOT NULL,
  `art_idarticulo` int(11) DEFAULT NULL,
  `vnt_idventa` int(11) DEFAULT NULL,
  `dvt_cantidad` int(11) DEFAULT NULL,
  `dvt_precioventa` decimal(11,2) DEFAULT NULL,
  `dvt_descuento` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `igr_i_ingreso`
--

CREATE TABLE `igr_i_ingreso` (
  `igr_idingreso` int(11) NOT NULL,
  `prs_idproveedor` int(11) DEFAULT NULL,
  `usu_idusuario` int(11) DEFAULT NULL,
  `igr_tipocomprobante` varchar(20) NOT NULL,
  `igr_seriecomprobante` varchar(7) NOT NULL,
  `igr_numerocomprobante` varchar(10) NOT NULL,
  `igr_fechahora` datetime DEFAULT NULL,
  `igr_impuesto` decimal(4,2) DEFAULT NULL,
  `igr_totalcompra` decimal(11,2) DEFAULT NULL,
  `igr_estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prm_i_permiso`
--

CREATE TABLE `prm_i_permiso` (
  `prm_idpermiso` int(11) NOT NULL,
  `prm_nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prs_i_persona`
--

CREATE TABLE `prs_i_persona` (
  `prs_idpersona` int(11) NOT NULL,
  `prs_tipopersona` varchar(20) NOT NULL,
  `prs_nombre` varchar(100) NOT NULL,
  `prs_tipodocumento` varchar(20) NOT NULL,
  `prs_nombredocumento` varchar(20) NOT NULL,
  `prs_direccion` varchar(70) NOT NULL,
  `prs_telefono` varchar(20) NOT NULL,
  `prs_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upr_usuariopermiso`
--

CREATE TABLE `upr_usuariopermiso` (
  `upr_idusuariopermiso` int(11) NOT NULL,
  `usu_idusuario` int(11) DEFAULT NULL,
  `prm_idpermiso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usu_i_usuario`
--

CREATE TABLE `usu_i_usuario` (
  `usu_idusuario` int(11) NOT NULL,
  `usu_nombre` varchar(100) NOT NULL,
  `usu_tipodocumento` varchar(20) NOT NULL,
  `usu_numerodocumento` varchar(20) NOT NULL,
  `usu_direccion` varchar(70) DEFAULT NULL,
  `usu_telefono` varchar(20) DEFAULT NULL,
  `usu_email` varchar(50) DEFAULT NULL,
  `usu_cargo` varchar(20) DEFAULT NULL,
  `usu_login` varchar(20) DEFAULT NULL,
  `usu_clave` varchar(64) DEFAULT NULL,
  `usu_condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vnt_p_venta`
--

CREATE TABLE `vnt_p_venta` (
  `vnt_idventa` int(11) NOT NULL,
  `prs_idcliente` int(11) DEFAULT NULL,
  `usu_idusuario` int(11) DEFAULT NULL,
  `vnt_tipocomprobante` varchar(20) NOT NULL,
  `vnt_seriecomprobante` varchar(7) DEFAULT NULL,
  `vnt_numerocomprobante` varchar(10) NOT NULL,
  `vnt_fechahora` datetime NOT NULL,
  `vnt_impuesto` decimal(4,2) DEFAULT NULL,
  `vnt_totalventea` decimal(11,2) DEFAULT NULL,
  `vnt_estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `art_i_articulo`
--
ALTER TABLE `art_i_articulo`
  ADD PRIMARY KEY (`art_idarticulo`),
  ADD KEY `ctg_idcategoria` (`ctg_idcategoria`);

--
-- Indexes for table `ctg_i_categoria`
--
ALTER TABLE `ctg_i_categoria`
  ADD PRIMARY KEY (`ctg_idcategoria`);

--
-- Indexes for table `dti_detalleingreso`
--
ALTER TABLE `dti_detalleingreso`
  ADD PRIMARY KEY (`dti_iddetalleingreso`),
  ADD KEY `art_idarticulo` (`art_idarticulo`),
  ADD KEY `igr_idingreso` (`igr_idingreso`);

--
-- Indexes for table `dvt_detalleventa`
--
ALTER TABLE `dvt_detalleventa`
  ADD PRIMARY KEY (`dvt_iddetalleventa`),
  ADD KEY `art_idarticulo` (`art_idarticulo`),
  ADD KEY `vnt_idventa` (`vnt_idventa`);

--
-- Indexes for table `igr_i_ingreso`
--
ALTER TABLE `igr_i_ingreso`
  ADD PRIMARY KEY (`igr_idingreso`),
  ADD KEY `prs_idproveedor` (`prs_idproveedor`),
  ADD KEY `usu_idusuario` (`usu_idusuario`);

--
-- Indexes for table `prm_i_permiso`
--
ALTER TABLE `prm_i_permiso`
  ADD PRIMARY KEY (`prm_idpermiso`);

--
-- Indexes for table `prs_i_persona`
--
ALTER TABLE `prs_i_persona`
  ADD PRIMARY KEY (`prs_idpersona`);

--
-- Indexes for table `upr_usuariopermiso`
--
ALTER TABLE `upr_usuariopermiso`
  ADD PRIMARY KEY (`upr_idusuariopermiso`),
  ADD KEY `usu_idusuario` (`usu_idusuario`),
  ADD KEY `prm_idpermiso` (`prm_idpermiso`);

--
-- Indexes for table `usu_i_usuario`
--
ALTER TABLE `usu_i_usuario`
  ADD PRIMARY KEY (`usu_idusuario`);

--
-- Indexes for table `vnt_p_venta`
--
ALTER TABLE `vnt_p_venta`
  ADD PRIMARY KEY (`vnt_idventa`),
  ADD KEY `prs_idcliente` (`prs_idcliente`),
  ADD KEY `usu_idusuario` (`usu_idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `art_i_articulo`
--
ALTER TABLE `art_i_articulo`
  MODIFY `art_idarticulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ctg_i_categoria`
--
ALTER TABLE `ctg_i_categoria`
  MODIFY `ctg_idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dti_detalleingreso`
--
ALTER TABLE `dti_detalleingreso`
  MODIFY `dti_iddetalleingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvt_detalleventa`
--
ALTER TABLE `dvt_detalleventa`
  MODIFY `dvt_iddetalleventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `igr_i_ingreso`
--
ALTER TABLE `igr_i_ingreso`
  MODIFY `igr_idingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prm_i_permiso`
--
ALTER TABLE `prm_i_permiso`
  MODIFY `prm_idpermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prs_i_persona`
--
ALTER TABLE `prs_i_persona`
  MODIFY `prs_idpersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upr_usuariopermiso`
--
ALTER TABLE `upr_usuariopermiso`
  MODIFY `upr_idusuariopermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usu_i_usuario`
--
ALTER TABLE `usu_i_usuario`
  MODIFY `usu_idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vnt_p_venta`
--
ALTER TABLE `vnt_p_venta`
  MODIFY `vnt_idventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `art_i_articulo`
--
ALTER TABLE `art_i_articulo`
  ADD CONSTRAINT `art_i_articulo_ibfk_1` FOREIGN KEY (`ctg_idcategoria`) REFERENCES `ctg_i_categoria` (`ctg_idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dti_detalleingreso`
--
ALTER TABLE `dti_detalleingreso`
  ADD CONSTRAINT `dti_detalleingreso_ibfk_1` FOREIGN KEY (`art_idarticulo`) REFERENCES `art_i_articulo` (`art_idarticulo`),
  ADD CONSTRAINT `dti_detalleingreso_ibfk_2` FOREIGN KEY (`igr_idingreso`) REFERENCES `igr_i_ingreso` (`igr_idingreso`);

--
-- Constraints for table `dvt_detalleventa`
--
ALTER TABLE `dvt_detalleventa`
  ADD CONSTRAINT `dvt_detalleventa_ibfk_1` FOREIGN KEY (`art_idarticulo`) REFERENCES `art_i_articulo` (`art_idarticulo`),
  ADD CONSTRAINT `dvt_detalleventa_ibfk_2` FOREIGN KEY (`vnt_idventa`) REFERENCES `vnt_p_venta` (`vnt_idventa`);

--
-- Constraints for table `igr_i_ingreso`
--
ALTER TABLE `igr_i_ingreso`
  ADD CONSTRAINT `igr_i_ingreso_ibfk_1` FOREIGN KEY (`prs_idproveedor`) REFERENCES `prs_i_persona` (`prs_idpersona`),
  ADD CONSTRAINT `igr_i_ingreso_ibfk_2` FOREIGN KEY (`usu_idusuario`) REFERENCES `usu_i_usuario` (`usu_idusuario`);

--
-- Constraints for table `upr_usuariopermiso`
--
ALTER TABLE `upr_usuariopermiso`
  ADD CONSTRAINT `upr_usuariopermiso_ibfk_1` FOREIGN KEY (`usu_idusuario`) REFERENCES `usu_i_usuario` (`usu_idusuario`),
  ADD CONSTRAINT `upr_usuariopermiso_ibfk_2` FOREIGN KEY (`prm_idpermiso`) REFERENCES `prm_i_permiso` (`prm_idpermiso`);

--
-- Constraints for table `vnt_p_venta`
--
ALTER TABLE `vnt_p_venta`
  ADD CONSTRAINT `vnt_p_venta_ibfk_1` FOREIGN KEY (`prs_idcliente`) REFERENCES `prs_i_persona` (`prs_idpersona`),
  ADD CONSTRAINT `vnt_p_venta_ibfk_2` FOREIGN KEY (`usu_idusuario`) REFERENCES `usu_i_usuario` (`usu_idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
