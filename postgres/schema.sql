/*
 * Copyright © 2019-2023 Forb Yuan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

\c doytowin

create table t_user
(
    id             bigint generated always as identity
        primary key,
    email          varchar(255),
    mobile         varchar(255),
    nickname       varchar(255),
    password       varchar(255),
    user_level     varchar(255),
    username       varchar(255),
    memo           varchar(255),
    valid          boolean   default true,
    create_time    timestamp default CURRENT_TIMESTAMP not null,
    create_user_id bigint,
    update_time    timestamp,
    update_user_id bigint
);

create table t_user_detail
(
    id      bigint,
    address varchar(255),
    primary key (id)
);

create table t_menu_01
(
    ID             SERIAL PRIMARY KEY,
    create_time    timestamp default CURRENT_TIMESTAMP not null,
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
    id             SERIAL PRIMARY KEY,
    create_time    timestamp default CURRENT_TIMESTAMP not null,
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
    id             SERIAL PRIMARY KEY,
    role_name      varchar(100)                        not null,
    role_code      varchar(100)                        not null,
    valid          boolean   DEFAULT TRUE,
    create_time    timestamp default CURRENT_TIMESTAMP not null,
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
    id        SERIAL PRIMARY KEY,
    perm_name varchar(100)         not null,
    valid     boolean DEFAULT TRUE null
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

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO doytowin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO doytowin;
