create table message (
    id integer not null auto_increment,
    user_id bigint,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    primary key (id)
)
create table user_role (
    user_id bigint not null,
    roles enum ('ADMIN','USER')
)
create table users (
    active bit not null,
    id bigint not null auto_increment,
    activation_code varchar(255),
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
)

alter table message
    add constraint message_user_fk
        foreign key (user_id) references users (id)
alter table user_role
    add constraint user_role_user_fk
        foreign key (user_id) references users (id)