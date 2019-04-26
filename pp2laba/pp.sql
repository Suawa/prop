-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 26 2019 г., 14:05
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pp`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `client_add` (IN `full_name` VARCHAR(100), IN `telephone` VARCHAR(11))  NO SQL
INSERT into Client(full_name,telephone) VALUES(full_name,telephone)$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_change` (IN `full_name` VARCHAR(100) CHARSET utf8, IN `telephone` VARCHAR(11), IN `id` INT)  NO SQL
UPDATE Client set full_name = full_name, telephone = telephone where id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_delete` (IN `id` INT)  NO SQL
DELETE from Client where id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_select` ()  NO SQL
SELECT * FROM Client$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_single` (IN `id` INT)  NO SQL
SELECT * from Client where id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_add` (IN `client_id` INT, IN `service_id` INT, IN `cnt` INT)  NO SQL
insert into Request(client_id,service_id,Request.count) VALUES(client_id,service_id,cnt)$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_change` (IN `cnt` INT, IN `id` INT)  NO SQL
update Request set Request.count = cnt where id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_delete` (IN `id` INT)  NO SQL
DELETE from Request where id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_select` ()  NO SQL
SELECT full_name,name,Request.count from Request inner join Client on client_id=id_client INNER join Service on service_id=id_service$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_single` (IN `id` INT)  NO SQL
SELECT full_name,name,Request.count from Request inner join Client on client_id=id_client INNER join Service on service_id=id_service where id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_add` (IN `name` VARCHAR(200), IN `price` DOUBLE)  NO SQL
INSERT into Service(name,price) VALUES(name,price)$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_change` (IN `name` VARCHAR(100) CHARSET utf8, IN `price` INT, IN `id` INT)  NO SQL
UPDATE Service set name = name,price = price where id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_delete` (IN `id` INT)  NO SQL
DELETE FROM Service where id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_select` ()  NO SQL
SELECT * from Service$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_single` (IN `id` INT)  NO SQL
select * from Service where id_service = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `Client`
--

CREATE TABLE `Client` (
  `id_client` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Client`
--

INSERT INTO `Client` (`id_client`, `full_name`, `telephone`) VALUES
(1, 'Петров', '381948'),
(2, 'Афанасий', '88005553535'),
(3, 'Измененный', '999999');

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--

CREATE TABLE `Request` (
  `id_request` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Request`
--

INSERT INTO `Request` (`id_request`, `client_id`, `service_id`, `count`) VALUES
(1, 1, 2, 200),
(2, 1, 3, 0),
(3, 2, 3, 0),
(4, 3, 1, 0),
(6, 2, 2, 111);

-- --------------------------------------------------------

--
-- Структура таблицы `Service`
--

CREATE TABLE `Service` (
  `id_service` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Service`
--

INSERT INTO `Service` (`id_service`, `name`, `price`) VALUES
(1, 'Донести пакеты', 200),
(2, 'Вставить дверь', 500),
(3, 'Починить потолок', 2000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Client`
--
ALTER TABLE `Client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `Service`
--
ALTER TABLE `Service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id_client`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `Service` (`id_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
