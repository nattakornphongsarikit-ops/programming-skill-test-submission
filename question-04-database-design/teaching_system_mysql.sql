DROP DATABASE IF EXISTS teaching_system;
CREATE DATABASE teaching_system
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE teaching_system;

CREATE TABLE Teachers (
  TeacherId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของครู',
  TeacherCode VARCHAR(20) NOT NULL UNIQUE COMMENT 'รหัสครู',
  FirstName VARCHAR(100) NOT NULL COMMENT 'ชื่อครู',
  LastName VARCHAR(100) NOT NULL COMMENT 'นามสกุลครู',
  Email VARCHAR(255) NULL COMMENT 'อีเมลครู',
  Phone VARCHAR(30) NULL COMMENT 'เบอร์โทรครู',
  CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่สร้างข้อมูลครู'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลครู';

CREATE TABLE Students (
  StudentId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของนักเรียน',
  StudentCode VARCHAR(20) NOT NULL UNIQUE COMMENT 'รหัสนักเรียน',
  FirstName VARCHAR(100) NOT NULL COMMENT 'ชื่อนักเรียน',
  LastName VARCHAR(100) NOT NULL COMMENT 'นามสกุลนักเรียน',
  Email VARCHAR(255) NULL COMMENT 'อีเมลนักเรียน',
  Phone VARCHAR(30) NULL COMMENT 'เบอร์โทรนักเรียน',
  CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่สร้างข้อมูลนักเรียน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลนักเรียน';

CREATE TABLE Courses (
  CourseId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของรายวิชา',
  CourseCode VARCHAR(20) NOT NULL UNIQUE COMMENT 'รหัสรายวิชา',
  CourseName VARCHAR(200) NOT NULL COMMENT 'ชื่อรายวิชา',
  Description VARCHAR(1000) NULL COMMENT 'รายละเอียดรายวิชา',
  TeacherId INT NOT NULL UNIQUE COMMENT 'รหัสครูผู้สอน',
  CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่สร้างข้อมูลรายวิชา',
  CONSTRAINT FK_Courses_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลรายวิชา';

CREATE TABLE Enrollments (
  EnrollmentId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของการลงทะเบียน',
  StudentId INT NOT NULL COMMENT 'รหัสนักเรียนที่ลงทะเบียน',
  CourseId INT NOT NULL COMMENT 'รหัสรายวิชาที่ลงทะเบียน',
  EnrolledAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่ลงทะเบียน',
  EnrollmentStatus TINYINT NOT NULL DEFAULT 1 COMMENT 'สถานะการลงทะเบียน: 1=กำลังเรียน, 2=เรียนจบ, 3=ถอนรายวิชา',
  CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
  CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
  CONSTRAINT UQ_Enrollments_Student_Course UNIQUE (StudentId, CourseId),
  INDEX IX_Enrollments_CourseStatus (CourseId, EnrollmentStatus)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลการลงทะเบียนเรียน';

CREATE TABLE TeachingSessions (
  SessionId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของครั้งที่สอน',
  CourseId INT NOT NULL COMMENT 'รหัสรายวิชาที่สอน',
  TeacherId INT NOT NULL COMMENT 'รหัสครูผู้สอน',
  SessionDate DATE NOT NULL COMMENT 'วันที่สอน',
  StartTime TIME NOT NULL COMMENT 'เวลาเริ่มสอน',
  EndTime TIME NOT NULL COMMENT 'เวลาเลิกสอน',
  Topic VARCHAR(300) NOT NULL COMMENT 'หัวข้อที่สอน',
  TeachingNote VARCHAR(1000) NULL COMMENT 'หมายเหตุการสอน',
  CONSTRAINT FK_TeachingSessions_Courses FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
  CONSTRAINT FK_TeachingSessions_Teachers FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
  INDEX IX_TeachingSessions_CourseDate (CourseId, SessionDate),
  INDEX IX_TeachingSessions_TeacherDate (TeacherId, SessionDate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลรายละเอียดการสอนแต่ละครั้ง';

CREATE TABLE Attendances (
  AttendanceId INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสหลักของการเข้าเรียน',
  SessionId INT NOT NULL COMMENT 'รหัสครั้งที่สอน',
  StudentId INT NOT NULL COMMENT 'รหัสนักเรียน',
  AttendanceStatus TINYINT NOT NULL COMMENT 'สถานะการเข้าเรียน: 1=มาเรียน, 2=มาสาย, 3=ขาดเรียน, 4=ลา',
  CheckedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่บันทึกการเข้าเรียน',
  Remark VARCHAR(500) NULL COMMENT 'หมายเหตุการเข้าเรียน',
  CONSTRAINT FK_Attendances_Sessions FOREIGN KEY (SessionId) REFERENCES TeachingSessions(SessionId),
  CONSTRAINT FK_Attendances_Students FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
  CONSTRAINT UQ_Attendances_Session_Student UNIQUE (SessionId, StudentId),
  INDEX IX_Attendances_StudentId (StudentId),
  INDEX IX_Attendances_Status (AttendanceStatus)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลการเข้าเรียนของนักเรียน';

INSERT INTO Teachers (TeacherId, TeacherCode, FirstName, LastName, Email, Phone)
VALUES (1, 'T001', 'สมชาย', 'ใจดี', 'somchai@example.com', '0800000001');

INSERT INTO Students (StudentId, StudentCode, FirstName, LastName, Email, Phone)
VALUES
  (1, 'S001', 'อนันต์', 'สุขใจ', 'anan@example.com', '0810000001'),
  (2, 'S002', 'มาลี', 'ดีมาก', 'malee@example.com', '0810000002');

INSERT INTO Courses (CourseId, CourseCode, CourseName, Description, TeacherId)
VALUES (1, 'C001', 'การออกแบบฐานข้อมูล', 'วิชาพื้นฐานการออกแบบฐานข้อมูล', 1);

INSERT INTO Enrollments (EnrollmentId, StudentId, CourseId, EnrollmentStatus)
VALUES
  (1, 1, 1, 1),
  (2, 2, 1, 1);

INSERT INTO TeachingSessions (SessionId, CourseId, TeacherId, SessionDate, StartTime, EndTime, Topic, TeachingNote)
VALUES (1, 1, 1, CURDATE(), '09:00:00', '12:00:00', 'ER Diagram และความสัมพันธ์ของตาราง', 'ตัวอย่างข้อมูลการสอน');

INSERT INTO Attendances (AttendanceId, SessionId, StudentId, AttendanceStatus, Remark)
VALUES
  (1, 1, 1, 1, 'เข้าเรียนตรงเวลา'),
  (2, 1, 2, 2, 'มาสาย 10 นาที');
