-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 02 2020 г., 01:51
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id12371116_dbpizzatask`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client_order`
--

CREATE TABLE `client_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `photo`) VALUES
(1, 'Pizza Margherita', 'Tomato sauce, mozzarella cheese, tomatoes, oregano', 5, 'margherita-pizza.jpg'),
(2, 'Pizza Pepperoni', 'Tomato sauce, mozzarella cheese, pepperoni\r\n', 7, 'pepperoni-pizza.jpg'),
(3, 'Pizza Diablo', 'Tomato sauce, mozzarella cheese, salami, mushrooms', 4, 'diablo-pizza.jpg'),
(4, 'Pizza Four cheese', 'Tomato sauce, mozzarella cheese, soft young cheese, blue cheese, Reganito cheese, oregano', 6, '4cheese-pizza.jpg'),
(6, 'Pizza Napoletana', 'Anchovies, capers, chivis onion, garlic, mozzarella\r\n', 9, 'napoletana-pizza.jpg'),
(7, 'Pizza Bolognese', 'Beef, pork, tomatoes, carrots, celery, onions, parmesan, mozzarella', 8, 'bolognese-pizza.jpg'),
(8, 'Pizza Vegetariana', 'Oyster mushrooms, bell pepper, eggplant, zucchini, spinach, onions', 8, 'vegetariana-pizza.jpg'),
(9, 'Pizza Carbonara', 'Pork, chicken egg, parmesan cheese, mozzarella, parsley', 6, 'carbonara-pizza.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client_order`
--
ALTER TABLE `client_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client_order`
--
ALTER TABLE `client_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `client_order` (`id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
