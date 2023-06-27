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

INSERT INTO t_user (username, mobile, email, nickname, password, user_level, valid, create_user_id) VALUES ('f0rb', '17778888881', 'f0rb@163.com', '测试1', '123456', '高级', 1, 1);
INSERT INTO t_user (username, mobile, email, nickname, password, user_level, valid, create_user_id) VALUES ('user2', '17778888882', 'test2@qq.com', '测试2', '123456', '普通', 0, 1);
INSERT INTO t_user (username, mobile, email, nickname, password, user_level, memo, valid, create_user_id) VALUES ('user3', '17778888883', 'test3@qq.com', '测试3', '123456', '普通', 'memo', 1, 2);
INSERT INTO t_user (username, mobile, email, nickname, password, user_level, valid, create_user_id) VALUES ('user4', '17778888884', 'test4@qq.com', '测试4', '123456', '普通', 1, 2);

INSERT INTO t_menu_01 (platform, parent_id, menu_name, memo, valid) VALUES ('01', 0, 'root', 'root menu', 1);
INSERT INTO t_menu_01 (platform, parent_id, menu_name, memo, valid) VALUES ('01', 1, 'first', 'first menu', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 0, 'root', 'root menu', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 1, 'User Management', 'Menu for User Management', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 1, 'Role Management', 'Menu for Role Management', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 1, 'Permission Management', 'Menu for Permission Management', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 1, 'Menu Management', 'Menu for Menu Management', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 2, 'User List', 'Menu for User List', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 3, 'Role List', 'Menu for Role List', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 4, 'Permission List', 'Menu for Permission List', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('02', 0, 'root', 'root menu', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 4, 'Permission Op1', 'Menu for Permission Op1', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 4, 'Permission Op2', 'Menu for Permission Op2', 1);
INSERT INTO t_menu (platform, parent_id, menu_name, memo, valid) VALUES ('00', 4, 'Permission Op3', 'Menu for Permission Op3', 0);

INSERT INTO t_role (role_name, role_code, create_user_id) VALUES ('admin', 'ADMIN', 1);
INSERT INTO t_role (role_name, role_code, create_user_id) VALUES ('vip', 'VIP', 2);
INSERT INTO t_role (role_name, role_code, create_user_id) VALUES ('vip2', 'VIP2', 2);
INSERT INTO t_role (role_name, role_code, create_user_id) VALUES ('vip3', 'VIP3', 0);
INSERT INTO t_role (role_name, role_code) VALUES ('vip4', 'VIP4');

INSERT INTO a_user_and_role (user_id, role_id) VALUES (1, 1);
INSERT INTO a_user_and_role (user_id, role_id) VALUES (1, 2);
INSERT INTO a_user_and_role (user_id, role_id) VALUES (3, 1);
INSERT INTO a_user_and_role (user_id, role_id) VALUES (4, 1);
INSERT INTO a_user_and_role (user_id, role_id) VALUES (4, 2);

INSERT INTO t_perm (perm_name, valid) VALUES ('user:list', 1);
INSERT INTO t_perm (perm_name, valid) VALUES ('user:get', 1);
INSERT INTO t_perm (perm_name, valid) VALUES ('user:update', 1);
INSERT INTO t_perm (perm_name, valid) VALUES ('user:delete', 1);
INSERT INTO t_perm (perm_name, valid) VALUES ('role:list', 1);
INSERT INTO t_perm (perm_name, valid) VALUES ('perm:list', 1);

INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (1, 1);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (1, 3);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (2, 3);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (2, 5);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (2, 6);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (5, 1);
INSERT INTO a_role_and_perm (role_id, perm_id) VALUES (5, 4);

INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (1, 1);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (1, 2);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (1, 6);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (5, 1);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (5, 3);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (5, 7);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (6, 1);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (6, 4);
INSERT INTO a_perm_and_menu (perm_id, menu_id) VALUES (6, 8);

commit;
