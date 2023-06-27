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

-- ALTER SESSION SET CONTAINER = XEPDB1;
ALTER SESSION SET CURRENT_SCHEMA = doytowin;

create table t_user
(
    id             NUMBER(19) GENERATED ALWAYS AS IDENTITY,
    email          VARCHAR(255),
    mobile         VARCHAR(255),
    nickname       VARCHAR(255),
    password       VARCHAR(255),
    user_level     VARCHAR(255),
    username       VARCHAR(255),
    memo           VARCHAR(255),
    valid          NUMBER(1) DEFAULT 1,
    create_time    DATE      DEFAULT CURRENT_TIMESTAMP not null,
    create_user_id NUMBER(19),
    update_time    DATE,
    update_user_id NUMBER(19),
    PRIMARY KEY (ID)
);

create table t_user_detail
(
    id      NUMBER(19),
    address VARCHAR(255),
    primary key (id)
);

create table t_menu_01
(
    id             NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    create_time    DATE DEFAULT CURRENT_TIMESTAMP not null,
    create_user_id NUMBER(19),
    update_time    DATE,
    update_user_id NUMBER(19),
    platform       VARCHAR(15),
    memo           VARCHAR(255),
    menu_name      VARCHAR(255),
    parent_id      NUMBER(10),
    valid          NUMBER(1),
    PRIMARY KEY (ID)
);

create table t_menu
(
    id             NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    create_time    DATE DEFAULT CURRENT_TIMESTAMP not null,
    create_user_id NUMBER(19),
    update_time    DATE,
    update_user_id NUMBER(19),
    platform       VARCHAR(15),
    memo           VARCHAR(255),
    menu_name      VARCHAR(255),
    parent_id      NUMBER(10),
    valid          NUMBER(1),
    PRIMARY KEY (ID)
);

create table t_role
(
    id             NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    role_name      VARCHAR(100)                        not null,
    role_code      VARCHAR(100)                        not null,
    valid          NUMBER(1) DEFAULT 1,
    create_time    DATE      DEFAULT CURRENT_TIMESTAMP not null,
    create_user_id NUMBER(19),
    update_time    DATE,
    update_user_id NUMBER(19),
    PRIMARY KEY (ID)
);

create table a_user_and_role
(
    user_id        NUMBER(19,0),
    role_id        NUMBER(10,0),
    create_user_id NUMBER(19)
);
alter table a_user_and_role
    add constraint a_user_and_role_unique_constraint unique (user_id, role_id);

create table t_perm
(
    id        NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    perm_name VARCHAR(100)        not null,
    valid     NUMBER(1) DEFAULT 1 null,
    PRIMARY KEY (ID)
);

create table a_role_and_perm
(
    role_id NUMBER(10),
    perm_id NUMBER(10)
);
alter table a_role_and_perm
    add constraint a_role_and_perm_unique_constraint unique (role_id, perm_id);

create table a_perm_and_menu
(
    perm_id NUMBER(10),
    menu_id NUMBER(10)
);
alter table a_perm_and_menu
    add constraint a_perm_and_menu_unique_constraint unique (perm_id, menu_id);

