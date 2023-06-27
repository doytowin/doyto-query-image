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

-- ALTER SESSION SET container = XEPDB1;
-- CREATE TABLESPACE DOYTOWIN datafile '/opt/oracle/oradata/XE/doytowin01.dbf' size 1m;
CREATE USER doytowin IDENTIFIED BY doytowin;

GRANT CONNECT,RESOURCE TO doytowin CONTAINER=CURRENT;
GRANT CREATE SESSION TO doytowin CONTAINER=CURRENT;

ALTER USER doytowin QUOTA 2m ON USERS;

commit;
