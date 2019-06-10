-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 10 2019 г., 12:52
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
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Answer`
--

CREATE TABLE `Answer` (
  `id_answer` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(50) NOT NULL,
  `correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Answer`
--

INSERT INTO `Answer` (`id_answer`, `question_id`, `answer_text`, `correct`) VALUES
(1, 1, 'Первый ответ', 1),
(2, 1, 'Второй ответ', 0),
(3, 1, 'Третий ответ', 1),
(4, 1, 'Четвертый ответ', 0),
(5, 1, 'Даб', 0),
(6, 2, 'Раз ответ', 1),
(7, 2, 'Два ответ', 1),
(8, 2, 'Три ответ', 0),
(9, 3, 'Ответ раз', 1),
(10, 3, 'Ответ два', 0),
(11, 3, 'Ответ три', 0),
(12, 4, 'k', 1),
(13, 4, '[po', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Question`
--

CREATE TABLE `Question` (
  `id_question` int(11) NOT NULL,
  `question_text` varchar(200) NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Question`
--

INSERT INTO `Question` (`id_question`, `question_text`, `test_id`) VALUES
(1, 'Первый вопрос', 1),
(2, 'Второй вопрос', 1),
(3, 'Третий вопрос', 1),
(4, 'fsd', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Test`
--

CREATE TABLE `Test` (
  `id_test` int(11) NOT NULL,
  `test_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Test`
--

INSERT INTO `Test` (`id_test`, `test_name`) VALUES
(1, 'Тестовый тест'),
(2, 'fh');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Answer`
--
ALTER TABLE `Answer`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `question_answer` (`question_id`);

--
-- Индексы таблицы `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `test_id` (`test_id`);

--
-- Индексы таблицы `Test`
--
ALTER TABLE `Test`
  ADD PRIMARY KEY (`id_test`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Answer`
--
ALTER TABLE `Answer`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `Question`
--
ALTER TABLE `Question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Test`
--
ALTER TABLE `Test`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Answer`
--
ALTER TABLE `Answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id_question`);

--
-- Ограничения внешнего ключа таблицы `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `Test` (`id_test`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
