use doytowin;

create table t_user
(
    id             bigint auto_increment primary key unique,
    email          varchar(255),
    mobile         varchar(255),
    nickname       varchar(255),
    password       varchar(255),
    user_level     varchar(255),
    username       varchar(255),
    memo           varchar(255),
    valid          boolean            DEFAULT TRUE,
    create_time    timestamp not null DEFAULT CURRENT_TIMESTAMP,
    create_user_id bigint,
    update_time    timestamp,
    update_user_id bigint
) collate utf8mb4_general_ci;

create table t_user_detail
(
    id      bigint,
    address varchar(255),
    primary key (id)
);

create table t_menu_01
(
    id             int auto_increment primary key unique,
    create_time    timestamp,
    create_user_id bigint,
    update_time    timestamp,
    update_user_id bigint,
    platform       varchar(15),
    memo           varchar(255),
    menu_name      varchar(255),
    parent_id      integer,
    valid          boolean
);

create table t_menu
(
    id             int auto_increment primary key unique,
    create_time    timestamp,
    create_user_id bigint,
    update_time    timestamp,
    update_user_id bigint,
    platform       varchar(15),
    memo           varchar(255),
    menu_name      varchar(255),
    parent_id      integer,
    valid          boolean
);

create table t_role
(
    id             int auto_increment primary key unique,
    role_name      varchar(100) not null,
    role_code      varchar(100) not null,
    valid          boolean               DEFAULT TRUE,
    create_time    timestamp    not null DEFAULT CURRENT_TIMESTAMP,
    create_user_id bigint,
    update_time    timestamp,
    update_user_id bigint
);

create table a_user_and_role
(
    user_id        bigint,
    role_id        int,
    create_user_id bigint
);
alter table a_user_and_role
    add constraint a_user_and_role_unique_constraint unique (user_id, role_id);

create table t_perm
(
    id        int auto_increment primary key unique,
    perm_name varchar(100)         not null,
    valid     tinyint(1) DEFAULT 1 null
);

create table a_role_and_perm
(
    role_id int,
    perm_id int
);
alter table a_role_and_perm
    add constraint a_role_and_perm_unique_constraint unique (role_id, perm_id);

create table a_perm_and_menu
(
    perm_id int,
    menu_id int
);
alter table a_perm_and_menu
    add constraint a_perm_and_menu_unique_constraint unique (perm_id, menu_id);

