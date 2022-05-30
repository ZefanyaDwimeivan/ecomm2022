-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2022 at 07:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_orderentry`
--

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `prod_id` varchar(10) NOT NULL,
  `vend_id` char(4) NOT NULL,
  `prod_name` varchar(25) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`prod_id`, `vend_id`, `prod_name`, `prod_price`, `prod_desc`) VALUES
('tnt1', '101', 'mouse', 30000, NULL),
('tnt2', '102', 'keyboard', 150000, NULL);

--
-- Triggers `produk`
--
DELIMITER $$
CREATE TRIGGER `hapus_barang` AFTER DELETE ON `produk` FOR EACH ROW begin 
insert into produk_hapus set 
prod_id = old.prod_id,
vend_id = old.vend_id,
prod_name = old.prod_name,
prod_price = old.prod_price,
prod_desc = old.prod_desc,
tgl_hapus = NOW(),
user = CURRENT_USER;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk_hapus`
--

CREATE TABLE `produk_hapus` (
  `prod_id` varchar(10) NOT NULL,
  `vend_id` char(4) NOT NULL,
  `prod_name` varchar(25) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_desc` varchar(255) DEFAULT NULL,
  `tgl_hapus` date DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_hapus`
--

INSERT INTO `produk_hapus` (`prod_id`, `vend_id`, `prod_name`, `prod_price`, `prod_desc`, `tgl_hapus`, `user`) VALUES
('tnt3', '103', 'layar', 500000, NULL, '2022-05-10', 'root@localhost');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
