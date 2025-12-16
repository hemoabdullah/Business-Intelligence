-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2025 at 01:30 PM
-- Server version: 11.6.2-MariaDB
-- PHP Version: 8.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `northwind_dw`
--

-- --------------------------------------------------------

--
-- Structure for view `vw_sales_olap`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sales_olap`  AS SELECT `fs`.`sales_id` AS `sales_id`, `dt`.`full_date` AS `order_date`, `dt`.`year` AS `order_year`, `dt`.`month_name` AS `order_month`, `dt`.`quarter` AS `order_quarter`, `dp`.`product_name` AS `product_name`, `dc`.`company_name` AS `customer_name`, `de`.`employee_name` AS `employee_name`, `fs`.`quantity` AS `quantity`, `fs`.`unit_price` AS `unit_price`, `fs`.`total_sales` AS `total_sales` FROM ((((`fact_sales` `fs` left join `dim_time` `dt` on(`fs`.`date_id` = `dt`.`date_id`)) left join `dim_product` `dp` on(`fs`.`product_sk` = `dp`.`product_sk`)) left join `dim_customer` `dc` on(`fs`.`customer_sk` = `dc`.`customer_sk`)) left join `dim_employee` `de` on(`fs`.`employee_sk` = `de`.`employee_sk`))  ;

--
-- VIEW `vw_sales_olap`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
