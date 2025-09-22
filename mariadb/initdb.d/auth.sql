-- --------------------------------------------------------
-- 호스트:                          hiedu.iptime.org
-- 서버 버전:                        11.8.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- auth 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `auth`;

-- 테이블 auth.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `service` int(11) DEFAULT NULL,
  `origin` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `mediaType` varchar(255) NOT NULL,
  `attachPath` varchar(100) NOT NULL,
  `useYn` char(1) NOT NULL,
  `regUserNo` bigint(20) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `modUserNo` bigint(20) DEFAULT NULL,
  `modDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK7yexcgh3aenmnslh2eum79xtj` (`modUserNo`),
  KEY `FKswjrfkup750ux9pej2aipkx2k` (`regUserNo`),
  CONSTRAINT `FK7yexcgh3aenmnslh2eum79xtj` FOREIGN KEY (`modUserNo`) REFERENCES `user` (`no`),
  CONSTRAINT `FKswjrfkup750ux9pej2aipkx2k` FOREIGN KEY (`regUserNo`) REFERENCES `user` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 auth.file:~0 rows (대략적) 내보내기

-- 테이블 auth.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `roleName` varchar(100) NOT NULL,
  `useYn` char(1) NOT NULL,
  `regUserNo` bigint(20) DEFAULT NULL,
  `regDate` timestamp NOT NULL,
  `modUserNo` bigint(20) DEFAULT NULL,
  `modDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`),
  UNIQUE KEY `UKbgeqjb5opmijvwc14fbtaj4xx` (`roleName`),
  KEY `FKbto9xc10l0exgm3pjhfduymsp` (`modUserNo`),
  KEY `FK2snyd1mb0layvt5gvy3td0oyl` (`regUserNo`),
  CONSTRAINT `FK2snyd1mb0layvt5gvy3td0oyl` FOREIGN KEY (`regUserNo`) REFERENCES `user` (`no`),
  CONSTRAINT `FKbto9xc10l0exgm3pjhfduymsp` FOREIGN KEY (`modUserNo`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 auth.role:~4 rows (대략적) 내보내기
INSERT INTO `role` (`no`, `name`, `roleName`, `useYn`, `regUserNo`, `regDate`, `modUserNo`, `modDate`) VALUES
	(1, 'ADMIN', '관리자', 'Y', 1, '2025-08-24 17:52:18', NULL, NULL),
	(2, 'PIXEL', '픽셀', 'Y', 1, '2025-08-24 17:52:12', NULL, NULL),
	(3, 'GOTHAM', '고담', 'Y', 1, '2025-08-24 17:52:32', NULL, NULL),
	(4, 'SOLO', '솔로', 'Y', 1, '2025-08-24 17:52:32', NULL, NULL);

-- 테이블 auth.role_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `role_user` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleNo` bigint(20) NOT NULL,
  `userNo` bigint(20) NOT NULL,
  `useYn` char(1) NOT NULL,
  `regUserNo` bigint(20) DEFAULT NULL,
  `regDate` timestamp NOT NULL,
  `modUserNo` bigint(20) DEFAULT NULL,
  `modDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FKlqwp8ouh55t59q5px4dxy22se` (`modUserNo`),
  KEY `FKlcar7ru5m30wxw2ifjnukccdc` (`regUserNo`),
  KEY `FKpstyufghuxfctfmwvfa70nfnx` (`userNo`),
  KEY `FKbln62h0v1wl2b58fxt9fg6ou` (`roleNo`),
  CONSTRAINT `FKbln62h0v1wl2b58fxt9fg6ou` FOREIGN KEY (`roleNo`) REFERENCES `role` (`no`),
  CONSTRAINT `FKlcar7ru5m30wxw2ifjnukccdc` FOREIGN KEY (`regUserNo`) REFERENCES `user` (`no`),
  CONSTRAINT `FKlqwp8ouh55t59q5px4dxy22se` FOREIGN KEY (`modUserNo`) REFERENCES `user` (`no`),
  CONSTRAINT `FKpstyufghuxfctfmwvfa70nfnx` FOREIGN KEY (`userNo`) REFERENCES `user` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 auth.role_user:~0 rows (대략적) 내보내기

-- 테이블 auth.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fileNo` bigint(20) DEFAULT NULL,
  `useYn` char(1) NOT NULL,
  `regUserNo` bigint(20) DEFAULT NULL,
  `regDate` timestamp NOT NULL,
  `modUserNo` bigint(20) DEFAULT NULL,
  `modDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  KEY `FKe16swo1dlpota1ce6dnpij9lg` (`modUserNo`),
  KEY `FKpmoyvo3dbu9sgcs8ms49eb0q5` (`regUserNo`),
  CONSTRAINT `FKe16swo1dlpota1ce6dnpij9lg` FOREIGN KEY (`modUserNo`) REFERENCES `user` (`no`),
  CONSTRAINT `FKpmoyvo3dbu9sgcs8ms49eb0q5` FOREIGN KEY (`regUserNo`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 auth.user:~1 rows (대략적) 내보내기
INSERT INTO `user` (`no`, `email`, `name`, `fileNo`, `useYn`, `regUserNo`, `regDate`, `modUserNo`, `modDate`) VALUES
	(1, 'admin@admin', '관리자', NULL, 'N', 1, '2025-08-21 21:46:55', 1, '2025-08-21 22:36:37');

-- 뷰 auth.v_files 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `v_files` (
	`cnt` DECIMAL(22,0) NULL
);

-- 뷰 auth.v_users 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `v_users` (
	`cnt` DECIMAL(22,0) NULL
);

-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `v_files`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_files` 
AS 
select IFNULL(sum(case when `file`.`service` = 2 then 1 else 0 END), 0) AS `cnt` from `file` 
union ALL 
select IFNULL(sum(case when `file`.`service` = 3 then 1 else 0 end), 0) AS `SUM(case when service = 3 then 1 ELSE 0 END)` from `file` 
union ALL 
select count(0) AS `COUNT(*)` from `file`;

-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `v_users`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_users` 
AS 
select sum(case when `user`.`useYn` = 'Y' then 1 else 0 end) AS `cnt` from `user` 
union ALL 
select count(0) AS `COUNT(*)` from `user`;

-- 프로시저 auth.p_files 구조 내보내기
DELIMITER //
CREATE PROCEDURE `p_files`()
BEGIN
	SELECT cnt FROM auth.v_files;
END//
DELIMITER ;

-- 프로시저 auth.p_users 구조 내보내기
DELIMITER //
CREATE PROCEDURE `p_users`()
BEGIN
	SELECT cnt FROM auth.v_users;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
