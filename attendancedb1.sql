/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : attendancedb1

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 27/10/2024 22:48:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_course
-- ----------------------------
DROP TABLE IF EXISTS `app_course`;
CREATE TABLE `app_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` tinyint(1) NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_course_department_id_493e149d_fk_app_department_id`(`department_id` ASC) USING BTREE,
  CONSTRAINT `app_course_department_id_493e149d_fk_app_department_id` FOREIGN KEY (`department_id`) REFERENCES `app_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_course
-- ----------------------------
INSERT INTO `app_course` VALUES (1, 'BSIT', 'Bachelor of Science in Information Technology', 1, 1);
INSERT INTO `app_course` VALUES (2, 'BSCS', 'Bachelor of Science in Computer Science', 1, 1);
INSERT INTO `app_course` VALUES (3, 'BS-PSYCH', 'Bachelor of Science in Psychology', 1, 6);

-- ----------------------------
-- Table structure for app_department
-- ----------------------------
DROP TABLE IF EXISTS `app_department`;
CREATE TABLE `app_department`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_department
-- ----------------------------
INSERT INTO `app_department` VALUES (1, 'CBIT', 'College of Business in Information Technology', 1);
INSERT INTO `app_department` VALUES (2, 'CEA', 'College of Engineering and Architecture', 1);
INSERT INTO `app_department` VALUES (4, 'CCJE', 'College of Criminal Justice Education', 1);
INSERT INTO `app_department` VALUES (5, 'CAS', 'College of Arts and Sciences', 1);
INSERT INTO `app_department` VALUES (6, 'CASE', 'College of Arts and Science Education', 1);

-- ----------------------------
-- Table structure for app_instructor
-- ----------------------------
DROP TABLE IF EXISTS `app_instructor`;
CREATE TABLE `app_instructor`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_instructor_department_id_cf384340_fk_app_department_id`(`department_id` ASC) USING BTREE,
  CONSTRAINT `app_instructor_department_id_cf384340_fk_app_department_id` FOREIGN KEY (`department_id`) REFERENCES `app_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_instructor
-- ----------------------------
INSERT INTO `app_instructor` VALUES (1, 'Juan Dela Cruz', 1, 1);
INSERT INTO `app_instructor` VALUES (2, 'John Doe', 1, 1);
INSERT INTO `app_instructor` VALUES (3, 'Joshua Garcia', 1, 1);
INSERT INTO `app_instructor` VALUES (4, 'Kael Santos', 1, 6);
INSERT INTO `app_instructor` VALUES (5, 'butchek', 1, 1);

-- ----------------------------
-- Table structure for app_student
-- ----------------------------
DROP TABLE IF EXISTS `app_student`;
CREATE TABLE `app_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `app_student_course_id_f414078e_fk_app_course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `app_student_course_id_f414078e_fk_app_course_id` FOREIGN KEY (`course_id`) REFERENCES `app_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_student
-- ----------------------------
INSERT INTO `app_student` VALUES (1, '2113780', 'Joshua Giducos', 1);
INSERT INTO `app_student` VALUES (3, '0123456', 'Rafael Mediado', 1);
INSERT INTO `app_student` VALUES (4, '7654321', 'Kent Charles Tolo', 2);
INSERT INTO `app_student` VALUES (6, '1234567', 'random', 2);
INSERT INTO `app_student` VALUES (7, '940302', 'maryan', 3);
INSERT INTO `app_student` VALUES (8, '0987654', 'jotjot', 3);
INSERT INTO `app_student` VALUES (9, '121212', 'emman', 1);

-- ----------------------------
-- Table structure for app_subject
-- ----------------------------
DROP TABLE IF EXISTS `app_subject`;
CREATE TABLE `app_subject`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `school_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department_id` bigint NOT NULL,
  `instructor_id` bigint NOT NULL,
  `school_year` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_subject_department_id_3f54a016_fk_app_department_id`(`department_id` ASC) USING BTREE,
  INDEX `app_subject_instructor_id_895e4ac2_fk_app_instructor_id`(`instructor_id` ASC) USING BTREE,
  CONSTRAINT `app_subject_department_id_3f54a016_fk_app_department_id` FOREIGN KEY (`department_id`) REFERENCES `app_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_subject_instructor_id_895e4ac2_fk_app_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `app_instructor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_subject
-- ----------------------------
INSERT INTO `app_subject` VALUES (1, 'IT-ELECT 4', '4th Year', 1, 1, '2024-2025');
INSERT INTO `app_subject` VALUES (2, 'CS-ELECT 4', '4th Year', 1, 1, '2024-2025');
INSERT INTO `app_subject` VALUES (3, 'test', '4th Year', 1, 3, '2024-2025');
INSERT INTO `app_subject` VALUES (4, 'STS', '3rd Year', 6, 4, '2024-2025');

-- ----------------------------
-- Table structure for app_subject_students
-- ----------------------------
DROP TABLE IF EXISTS `app_subject_students`;
CREATE TABLE `app_subject_students`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_subject_students_subject_id_student_id_b8d77a0e_uniq`(`subject_id` ASC, `student_id` ASC) USING BTREE,
  INDEX `app_subject_students_student_id_0814294c_fk_app_student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `app_subject_students_student_id_0814294c_fk_app_student_id` FOREIGN KEY (`student_id`) REFERENCES `app_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_subject_students_subject_id_c104aced_fk_app_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `app_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_subject_students
-- ----------------------------
INSERT INTO `app_subject_students` VALUES (1, 1, 1);
INSERT INTO `app_subject_students` VALUES (5, 3, 1);
INSERT INTO `app_subject_students` VALUES (6, 3, 3);
INSERT INTO `app_subject_students` VALUES (14, 4, 7);
INSERT INTO `app_subject_students` VALUES (15, 4, 8);
INSERT INTO `app_subject_students` VALUES (18, 4, 9);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add course', 7, 'add_course');
INSERT INTO `auth_permission` VALUES (26, 'Can change course', 7, 'change_course');
INSERT INTO `auth_permission` VALUES (27, 'Can delete course', 7, 'delete_course');
INSERT INTO `auth_permission` VALUES (28, 'Can view course', 7, 'view_course');
INSERT INTO `auth_permission` VALUES (29, 'Can add department', 8, 'add_department');
INSERT INTO `auth_permission` VALUES (30, 'Can change department', 8, 'change_department');
INSERT INTO `auth_permission` VALUES (31, 'Can delete department', 8, 'delete_department');
INSERT INTO `auth_permission` VALUES (32, 'Can view department', 8, 'view_department');
INSERT INTO `auth_permission` VALUES (33, 'Can add student', 9, 'add_student');
INSERT INTO `auth_permission` VALUES (34, 'Can change student', 9, 'change_student');
INSERT INTO `auth_permission` VALUES (35, 'Can delete student', 9, 'delete_student');
INSERT INTO `auth_permission` VALUES (36, 'Can view student', 9, 'view_student');
INSERT INTO `auth_permission` VALUES (37, 'Can add instructor', 10, 'add_instructor');
INSERT INTO `auth_permission` VALUES (38, 'Can change instructor', 10, 'change_instructor');
INSERT INTO `auth_permission` VALUES (39, 'Can delete instructor', 10, 'delete_instructor');
INSERT INTO `auth_permission` VALUES (40, 'Can view instructor', 10, 'view_instructor');
INSERT INTO `auth_permission` VALUES (41, 'Can add subject', 11, 'add_subject');
INSERT INTO `auth_permission` VALUES (42, 'Can change subject', 11, 'change_subject');
INSERT INTO `auth_permission` VALUES (43, 'Can delete subject', 11, 'delete_subject');
INSERT INTO `auth_permission` VALUES (44, 'Can view subject', 11, 'view_subject');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$870000$vmsKBa4E9DbWWccHRt3b3Q$lk3uFKHk0Ws6a6RIMz0CdFbkjsvYD1WKk7U/5duRLYo=', '2024-10-26 04:53:25.180519', 1, 'admin', '', '', '', 1, 1, '2024-10-24 02:15:53.049006');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'course');
INSERT INTO `django_content_type` VALUES (8, 'app', 'department');
INSERT INTO `django_content_type` VALUES (10, 'app', 'instructor');
INSERT INTO `django_content_type` VALUES (9, 'app', 'student');
INSERT INTO `django_content_type` VALUES (11, 'app', 'subject');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-10-24 02:15:29.198948');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-10-24 02:15:33.106380');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-10-24 02:15:34.216092');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-10-24 02:15:34.247350');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-24 02:15:34.262981');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-10-24 02:15:34.653726');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-10-24 02:15:34.872540');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-10-24 02:15:34.919428');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-10-24 02:15:34.950688');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-10-24 02:15:35.294547');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-10-24 02:15:35.310172');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-24 02:15:35.325802');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-10-24 02:15:35.482100');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-24 02:15:35.669655');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-10-24 02:15:35.747804');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-10-24 02:15:35.779063');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-24 02:15:35.997880');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2024-10-24 02:15:36.154177');
INSERT INTO `django_migrations` VALUES (19, 'app', '0001_initial', '2024-10-24 04:06:36.838021');
INSERT INTO `django_migrations` VALUES (20, 'app', '0002_subject_students', '2024-10-24 07:46:10.281657');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('sgx4v656jza1py2nigz6ao80bxhd3rxt', '.eJxVjMsOwiAQRf-FtSHAgIBL9_0GwmNGqgaS0q6M_65NutDtPefcFwtxW2vYBi5hLuzCJDv9binmB7YdlHtst85zb-syJ74r_KCDT73g83q4fwc1jvqtLVgqoJyWJIojLZP2ShSTCMCjRWO9hKyApDMCz-ApKUsxq6wFktDs_QHLijd4:1t4Ynl:WIFs5yRAM-TP0SSzcWJ2VMOr60FvI4YgiWiC79VPyWU', '2024-11-09 04:53:25.229495');

SET FOREIGN_KEY_CHECKS = 1;
