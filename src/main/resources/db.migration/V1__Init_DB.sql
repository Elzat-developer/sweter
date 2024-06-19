-- Таблица пользователей
create table users (
        id bigint not null auto_increment,
        username varchar(255) not null,
        password varchar(255) not null,
        active bit not null,
        activation_code varchar(255),
        email varchar(255),
        primary key (id)
);
-- Таблица ролей пользователей
create table user_role (
        user_id bigint not null,
        roles enum ('ADMIN', 'USER'),
        primary key (user_id, roles)
);
-- Таблица сообщений
create table message (
        id bigint not null auto_increment,
        user_id bigint,
        filename varchar(255),
        tag varchar(255),
        text varchar(255) not null,--2048
        primary key (id),
        constraint message_user_fk foreign key (user_id) references users (id)
);

-- Ограничения внешнего ключа
alter table user_role
    add constraint user_role_user_fk
        foreign key (user_id) references users (id);