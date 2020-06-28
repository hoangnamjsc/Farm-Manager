BEGIN TRANSACTION;
DROP TABLE IF EXISTS "dashboard_book";
CREATE TABLE IF NOT EXISTS "dashboard_book" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(50) NOT NULL,
	"publication_date"	date,
	"author"	varchar(30) NOT NULL,
	"price"	decimal NOT NULL,
	"pages"	integer,
	"book_type"	varchar(120) NOT NULL
);
DROP TABLE IF EXISTS "dashboard_warehouse";
CREATE TABLE IF NOT EXISTS "dashboard_warehouse" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(100) NOT NULL,
	"amount"	integer NOT NULL,
	"farm_id_id"	integer NOT NULL,
	"product_name"	varchar(150) NOT NULL,
	FOREIGN KEY("farm_id_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "dashboard_staff";
CREATE TABLE IF NOT EXISTS "dashboard_staff" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"staff_name"	varchar(250) NOT NULL,
	"staff_phone"	varchar(10) NOT NULL,
	"staff_email"	varchar(70) NOT NULL,
	"farm_id_id"	integer NOT NULL,
	"staff_position"	varchar(100) NOT NULL,
	FOREIGN KEY("farm_id_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "dashboard_calendar";
CREATE TABLE IF NOT EXISTS "dashboard_calendar" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"chunhat"	varchar(100) NOT NULL,
	"farm_id_id"	integer NOT NULL,
	"thu2"	varchar(100) NOT NULL,
	"thu3"	varchar(100) NOT NULL,
	"thu4"	varchar(100) NOT NULL,
	"thu5"	varchar(100) NOT NULL,
	"thu6"	varchar(100) NOT NULL,
	"thu7"	varchar(100) NOT NULL,
	"time"	varchar(100) NOT NULL,
	FOREIGN KEY("farm_id_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_session";
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
DROP TABLE IF EXISTS "homepage_userprofile";
CREATE TABLE IF NOT EXISTS "homepage_userprofile" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL UNIQUE,
	"farm_name"	varchar(250) NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "dashboard_book" VALUES (2,'Nguyen Tuan Anh','2020-06-10','Tuan Anh',55,55,'E-book');
INSERT INTO "dashboard_book" VALUES (3,'Tran Manh Cuong','2020-06-10','nam',12,233,'Paperback');
INSERT INTO "dashboard_book" VALUES (5,'Vu Thi Van Anh','2016-02-04','nam',20,12,'Paperback');
INSERT INTO "dashboard_book" VALUES (6,'Nguyen Van Truong','2020-06-20','Truong',23,20,'Hardcover');
INSERT INTO "dashboard_warehouse" VALUES (2,'a',1,1,'Rau cải xanh');
INSERT INTO "dashboard_warehouse" VALUES (3,'b',20,1,'Trứng gà');
INSERT INTO "dashboard_warehouse" VALUES (4,'c',11,1,'Phân bón NPK');
INSERT INTO "dashboard_warehouse" VALUES (5,'c',2,1,'Xẻng đào');
INSERT INTO "dashboard_warehouse" VALUES (6,'d',200,1,'Bí đỏ');
INSERT INTO "dashboard_warehouse" VALUES (7,'a',50,1,'Cà rốt củ');
INSERT INTO "dashboard_warehouse" VALUES (8,'a',20,1,'Cà chua bi');
INSERT INTO "dashboard_warehouse" VALUES (9,'c',30,1,'Phân đạm');
INSERT INTO "dashboard_warehouse" VALUES (10,'b',500,1,'Củ su hào');
INSERT INTO "dashboard_warehouse" VALUES (11,'b',300,1,'Trứng vịt');
INSERT INTO "dashboard_warehouse" VALUES (12,'b',30,1,'Dưa hấu');
INSERT INTO "dashboard_staff" VALUES (1,'Hoàng Văn Nam','0000000000','email0@gmail.com',1,'b');
INSERT INTO "dashboard_staff" VALUES (2,'Đoàn Thùy Trang','0000000001','mail@email.com',1,'a');
INSERT INTO "dashboard_staff" VALUES (3,'Vũ Thị Vân Anh','000000002','mail@vananh.com',1,'b');
INSERT INTO "dashboard_staff" VALUES (4,'Hoàng Thu Hương','0000000003','thuhuowng@gmail.com',1,'a');
INSERT INTO "dashboard_staff" VALUES (5,'Nguyễn Quỳnh Hoa','0312446203','quynhhoa@tuananh.com',1,'c');
INSERT INTO "dashboard_staff" VALUES (6,'Châu Quỳnh Mai','0000123146','mail@email.com',1,'a');
INSERT INTO "dashboard_staff" VALUES (7,'Trần Gia Sport','01234555512','trangia@sport.com',1,'b');
INSERT INTO "dashboard_staff" VALUES (8,'Nguyen Van Truong','0123333664','truong@group.com',1,'c');
INSERT INTO "dashboard_staff" VALUES (9,'Oanh Nguyên','03336664489','oanhnguyen@gmail.com',1,'d');
INSERT INTO "dashboard_staff" VALUES (10,'Vũ Thị Vân Anh','4512045132','651246531@gsghdbns.com',1,'a');
INSERT INTO "dashboard_staff" VALUES (11,'Hồ Nam','0129645132','gfgca@gmail.com',1,'d');
INSERT INTO "dashboard_staff" VALUES (12,'Vũ Thị Vân Anh','0122222','mail@email.com',1,'c');
INSERT INTO "dashboard_calendar" VALUES (2,'a',1,'d','c','c','b','b','a','a');
INSERT INTO "dashboard_calendar" VALUES (3,'c',1,'b','b','a','a','c','c','b');
INSERT INTO "django_session" VALUES ('c4oovt00cxhypep3ghacp8oh35ewxjjg','MzA3ZDYwNWMwNjQwZWY5ZjhlYzVkYjg3NGJiODJkZDAwOTEzZjZmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmIyODk3MDEwNDU1NmZhYWZiOTgzYTU0MTA4NWY1Y2Q1OGFlZDJmIn0=','2020-06-23 11:15:19.981300');
INSERT INTO "homepage_userprofile" VALUES (1,1,'Farm_name');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$180000$blGtcmtWmV57$TdzN71LcFR43CFT1XXPv6BKPcsWnIuiaq05l1/e/Sv8=','2020-06-09 11:15:19.971999',1,'admin','Nam','hoangnam921@gmail.com',1,1,'2020-06-09 11:14:54.089756','Hoang');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_userprofile','Can add user profile');
INSERT INTO "auth_permission" VALUES (26,7,'change_userprofile','Can change user profile');
INSERT INTO "auth_permission" VALUES (27,7,'delete_userprofile','Can delete user profile');
INSERT INTO "auth_permission" VALUES (28,7,'view_userprofile','Can view user profile');
INSERT INTO "auth_permission" VALUES (29,8,'add_warehouse','Can add warehouse');
INSERT INTO "auth_permission" VALUES (30,8,'change_warehouse','Can change warehouse');
INSERT INTO "auth_permission" VALUES (31,8,'delete_warehouse','Can delete warehouse');
INSERT INTO "auth_permission" VALUES (32,8,'view_warehouse','Can view warehouse');
INSERT INTO "auth_permission" VALUES (33,9,'add_staff','Can add staff');
INSERT INTO "auth_permission" VALUES (34,9,'change_staff','Can change staff');
INSERT INTO "auth_permission" VALUES (35,9,'delete_staff','Can delete staff');
INSERT INTO "auth_permission" VALUES (36,9,'view_staff','Can view staff');
INSERT INTO "auth_permission" VALUES (37,10,'add_calendar','Can add calendar');
INSERT INTO "auth_permission" VALUES (38,10,'change_calendar','Can change calendar');
INSERT INTO "auth_permission" VALUES (39,10,'delete_calendar','Can delete calendar');
INSERT INTO "auth_permission" VALUES (40,10,'view_calendar','Can view calendar');
INSERT INTO "auth_permission" VALUES (41,11,'add_book','Can add book');
INSERT INTO "auth_permission" VALUES (42,11,'change_book','Can change book');
INSERT INTO "auth_permission" VALUES (43,11,'delete_book','Can delete book');
INSERT INTO "auth_permission" VALUES (44,11,'view_book','Can view book');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'homepage','userprofile');
INSERT INTO "django_content_type" VALUES (8,'dashboard','warehouse');
INSERT INTO "django_content_type" VALUES (9,'dashboard','staff');
INSERT INTO "django_content_type" VALUES (10,'dashboard','calendar');
INSERT INTO "django_content_type" VALUES (11,'dashboard','book');
INSERT INTO "django_admin_log" VALUES (1,'2020-06-09 11:16:39.290784','1','a','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2020-06-09 11:16:46.257295','1','a','',8,1,3);
INSERT INTO "django_admin_log" VALUES (3,'2020-06-09 11:17:16.798435','1','Calendar object (1)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2020-06-09 11:27:10.386035','1','Calendar object (1)','',10,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2020-06-09 11:28:12.028660','1','Calendar object (1)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2020-06-09 11:32:33.901430','1','Calendar object (1)','',10,1,3);
INSERT INTO "django_admin_log" VALUES (7,'2020-06-09 11:34:02.880450','2','Calendar object (2)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2020-06-09 11:36:50.669356','3','Calendar object (3)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2020-06-09 12:39:56.385331','1','a','',8,1,3);
INSERT INTO "django_admin_log" VALUES (10,'2020-06-10 04:11:14.882045','1','a','[{"added": {}}]',11,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2020-06-10 04:11:32.468582','2','b','[{"added": {}}]',11,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2020-06-09 11:14:30.301770');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2020-06-09 11:14:30.338051');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2020-06-09 11:14:30.359513');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2020-06-09 11:14:30.382451');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-06-09 11:14:30.403944');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2020-06-09 11:14:30.435406');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2020-06-09 11:14:30.453950');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2020-06-09 11:14:30.474203');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2020-06-09 11:14:30.495284');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2020-06-09 11:14:30.516534');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2020-06-09 11:14:30.526175');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-06-09 11:14:30.548942');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2020-06-09 11:14:30.570893');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-06-09 11:14:30.591816');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2020-06-09 11:14:30.610421');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2020-06-09 11:14:30.632569');
INSERT INTO "django_migrations" VALUES (17,'dashboard','0001_initial','2020-06-09 11:14:30.661380');
INSERT INTO "django_migrations" VALUES (18,'dashboard','0002_auto_20200516_1429','2020-06-09 11:14:30.708513');
INSERT INTO "django_migrations" VALUES (19,'dashboard','0003_auto_20200516_1445','2020-06-09 11:14:30.728595');
INSERT INTO "django_migrations" VALUES (20,'dashboard','0004_auto_20200516_1600','2020-06-09 11:14:30.773639');
INSERT INTO "django_migrations" VALUES (21,'dashboard','0005_auto_20200516_1604','2020-06-09 11:14:30.810489');
INSERT INTO "django_migrations" VALUES (22,'dashboard','0006_cruduser','2020-06-09 11:14:30.822457');
INSERT INTO "django_migrations" VALUES (23,'dashboard','0007_auto_20200609_1811','2020-06-09 11:14:30.866338');
INSERT INTO "django_migrations" VALUES (24,'homepage','0001_initial','2020-06-09 11:14:30.889281');
INSERT INTO "django_migrations" VALUES (25,'homepage','0002_delete_userprofile','2020-06-09 11:14:30.899251');
INSERT INTO "django_migrations" VALUES (26,'homepage','0003_userprofile','2020-06-09 11:14:30.923189');
INSERT INTO "django_migrations" VALUES (27,'homepage','0004_delete_userprofile','2020-06-09 11:14:30.933421');
INSERT INTO "django_migrations" VALUES (28,'homepage','0005_userprofile','2020-06-09 11:14:30.955123');
INSERT INTO "django_migrations" VALUES (29,'homepage','0006_auto_20200418_2100','2020-06-09 11:14:30.989478');
INSERT INTO "django_migrations" VALUES (30,'homepage','0007_auto_20200418_2102','2020-06-09 11:14:31.022886');
INSERT INTO "django_migrations" VALUES (31,'homepage','0008_auto_20200418_2104','2020-06-09 11:14:31.056522');
INSERT INTO "django_migrations" VALUES (32,'homepage','0009_auto_20200419_0056','2020-06-09 11:14:31.076789');
INSERT INTO "django_migrations" VALUES (33,'homepage','0010_nongtrai','2020-06-09 11:14:31.090489');
INSERT INTO "django_migrations" VALUES (34,'homepage','0011_auto_20200419_2214','2020-06-09 11:14:31.135204');
INSERT INTO "django_migrations" VALUES (35,'homepage','0012_auto_20200419_2221','2020-06-09 11:14:31.157266');
INSERT INTO "django_migrations" VALUES (36,'homepage','0013_auto_20200419_2316','2020-06-09 11:14:31.182353');
INSERT INTO "django_migrations" VALUES (37,'homepage','0014_auto_20200421_1150','2020-06-09 11:14:31.209311');
INSERT INTO "django_migrations" VALUES (38,'homepage','0015_auto_20200421_1152','2020-06-09 11:14:31.226532');
INSERT INTO "django_migrations" VALUES (39,'homepage','0016_auto_20200421_1153','2020-06-09 11:14:31.254170');
INSERT INTO "django_migrations" VALUES (40,'homepage','0017_auto_20200421_1255','2020-06-09 11:14:31.292389');
INSERT INTO "django_migrations" VALUES (41,'homepage','0018_auto_20200421_1300','2020-06-09 11:14:31.315859');
INSERT INTO "django_migrations" VALUES (42,'homepage','0019_auto_20200509_1438','2020-06-09 11:14:31.346321');
INSERT INTO "django_migrations" VALUES (43,'homepage','0020_auto_20200509_1441','2020-06-09 11:14:31.385433');
INSERT INTO "django_migrations" VALUES (44,'homepage','0021_auto_20200509_1454','2020-06-09 11:14:31.416432');
INSERT INTO "django_migrations" VALUES (45,'homepage','0022_auto_20200509_1546','2020-06-09 11:14:31.445582');
INSERT INTO "django_migrations" VALUES (46,'homepage','0023_auto_20200509_1620','2020-06-09 11:14:31.505416');
INSERT INTO "django_migrations" VALUES (47,'homepage','0024_auto_20200509_1622','2020-06-09 11:14:31.532103');
INSERT INTO "django_migrations" VALUES (48,'homepage','0025_auto_20200509_1643','2020-06-09 11:14:31.574968');
INSERT INTO "django_migrations" VALUES (49,'homepage','0026_auto_20200509_2226','2020-06-09 11:14:31.600007');
INSERT INTO "django_migrations" VALUES (50,'sessions','0001_initial','2020-06-09 11:14:31.611943');
INSERT INTO "django_migrations" VALUES (51,'dashboard','0008_auto_20200609_1827','2020-06-09 11:27:50.353566');
INSERT INTO "django_migrations" VALUES (52,'dashboard','0009_auto_20200609_1832','2020-06-09 11:32:20.607741');
INSERT INTO "django_migrations" VALUES (53,'dashboard','0010_auto_20200610_1049','2020-06-10 03:50:10.006151');
INSERT INTO "django_migrations" VALUES (54,'dashboard','0011_book','2020-06-10 04:09:55.728885');
DROP INDEX IF EXISTS "dashboard_warehouse_farm_id_id_e8baa5e6";
CREATE INDEX IF NOT EXISTS "dashboard_warehouse_farm_id_id_e8baa5e6" ON "dashboard_warehouse" (
	"farm_id_id"
);
DROP INDEX IF EXISTS "dashboard_staff_farm_id_id_478df783";
CREATE INDEX IF NOT EXISTS "dashboard_staff_farm_id_id_478df783" ON "dashboard_staff" (
	"farm_id_id"
);
DROP INDEX IF EXISTS "dashboard_calendar_farm_id_id_259fff32";
CREATE INDEX IF NOT EXISTS "dashboard_calendar_farm_id_id_259fff32" ON "dashboard_calendar" (
	"farm_id_id"
);
DROP INDEX IF EXISTS "django_session_expire_date_a5c62663";
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_2f476e4b";
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
DROP INDEX IF EXISTS "django_content_type_app_label_model_76bd3d3b_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
DROP INDEX IF EXISTS "django_admin_log_user_id_c564eba6";
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
DROP INDEX IF EXISTS "django_admin_log_content_type_id_c4bce8eb";
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_a95ead1b";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_groups_group_id_97559544";
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_6a12ed8b";
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_permission_id_84c5c92e";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_group_id_b120cbf9";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
