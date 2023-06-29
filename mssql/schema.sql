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

create table doytowin.t_user
(
    id             bigint identity constraint t_user_pk primary key,
    email          varchar(255),
    mobile         varchar(255),
    nickname       nvarchar(255),
    password       varchar(255),
    user_level     nvarchar(255),
    username       nvarchar(255),
    memo           nvarchar(255),
    valid          bit             DEFAULT 1,
    create_time    datetime not null DEFAULT CURRENT_TIMESTAMP,
    create_user_id bigint,
    update_time    datetime,
    update_user_id bigint
);

create table doytowin.t_user_detail
(
    id      bigint,
    address nvarchar(255),
    primary key (id)
);

create table doytowin.t_menu_01
(
    id             int identity constraint t_menu_01_pk primary key,
    create_time    datetime,
    create_user_id bigint,
    update_time    datetime,
    update_user_id bigint,
    platform       varchar(15),
    memo           nvarchar(255),
    menu_name      nvarchar(255),
    parent_id      integer,
    valid          bit
);

create table doytowin.t_menu
(
    id             int identity constraint t_menu_pk primary key,
    create_time    datetime,
    create_user_id bigint,
    update_time    datetime,
    update_user_id bigint,
    platform       varchar(15),
    memo           nvarchar(255),
    menu_name      nvarchar(255),
    parent_id      integer,
    valid          bit
);

create table doytowin.t_role
(
    id             int identity constraint t_role_pk primary key,
    role_name      nvarchar(100) not null,
    role_code      varchar(100) not null,
    valid          bit                   DEFAULT 1,
    create_time    datetime    not null DEFAULT CURRENT_TIMESTAMP,
    create_user_id bigint,
    update_time    datetime,
    update_user_id bigint
);

create table doytowin.a_user_and_role
(
    user_id        bigint,
    role_id        int,
    create_user_id bigint
);
alter table doytowin.a_user_and_role
    add constraint a_user_and_role_unique_constraint unique (user_id, role_id)
        with (ignore_dup_key = ON);

create table doytowin.t_perm
(
    id        int identity constraint t_perm_pk primary key,
    perm_name nvarchar(100)         not null,
    valid     bit DEFAULT 1 null
);

create table doytowin.a_role_and_perm
(
    role_id int,
    perm_id int
);
alter table doytowin.a_role_and_perm
    add constraint a_role_and_perm_unique_constraint unique (role_id, perm_id)
        with (ignore_dup_key = ON);

create table doytowin.a_perm_and_menu
(
    perm_id int,
    menu_id int
);
alter table doytowin.a_perm_and_menu
    add constraint a_perm_and_menu_unique_constraint unique (perm_id, menu_id)
        with (ignore_dup_key = ON);

