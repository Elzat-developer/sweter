
--
-- База данных: `sweter`
--
--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
                                       `id` bigint auto_increment primary key,
                                       `username` varchar(255) DEFAULT NULL,
                                       `password` varchar(255) NOT NULL,
                                       `active` bit(1) NOT NULL,
                                       `email` varchar(255) NOT NULL,
                                       `activation_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
                            `id` bigint auto_increment primary key,
                            `text` varchar(2048) NOT NULL,
                            `tag` varchar(255) NOT NULL,
                            `filename` varchar(255) DEFAULT NULL,
                            `user_id` bigint DEFAULT NULL,
                            CONSTRAINT message_user_fk FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

CREATE TABLE IF NOT EXISTS user_role (
                         `user_id` BIGINT NOT NULL,
                         `roles` enum('ADMIN','USER') DEFAULT NULL,
                        CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

