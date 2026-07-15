# คำอธิบาย Index

## Index ที่เกิดจาก Primary Key

| Table | Index | เหตุผล |
| --- | --- | --- |
| `Students` | `StudentId` | ใช้ค้นหานักเรียน 1 คนโดยรหัสหลัก และใช้เป็น FK จากตารางอื่น |
| `Teachers` | `TeacherId` | ใช้ค้นหาครู 1 คนโดยรหัสหลัก และใช้เชื่อมกับรายวิชา/ครั้งที่สอน |
| `Courses` | `CourseId` | ใช้ค้นหารายวิชา 1 วิชา และใช้เชื่อมกับการลงทะเบียน/ครั้งที่สอน |
| `Enrollments` | `EnrollmentId` | ใช้อ้างอิงข้อมูลการลงทะเบียนแต่ละรายการ |
| `TeachingSessions` | `SessionId` | ใช้อ้างอิงการสอนแต่ละครั้ง |
| `Attendances` | `AttendanceId` | ใช้อ้างอิงข้อมูลการเข้าเรียนแต่ละรายการ |

## Index ที่เกิดจาก Unique Key

| Table | Index | เหตุผล |
| --- | --- | --- |
| `Students` | `StudentCode` | ป้องกันรหัสนักเรียนซ้ำ และค้นหานักเรียนจากรหัสนักเรียนได้เร็ว |
| `Teachers` | `TeacherCode` | ป้องกันรหัสครูซ้ำ และค้นหาครูจากรหัสครูได้เร็ว |
| `Courses` | `CourseCode` | ป้องกันรหัสวิชาซ้ำ และค้นหารายวิชาจากรหัสวิชาได้เร็ว |
| `Courses` | `TeacherId` | บังคับความสัมพันธ์ครู 1 คนต่อ 1 รายวิชา และค้นหาว่าครูสอนวิชาอะไรได้เร็ว |
| `Enrollments` | `StudentId, CourseId` | ป้องกันนักเรียนลงทะเบียนวิชาเดิมซ้ำ และช่วยดูวิชาที่นักเรียนลงทะเบียน |
| `Attendances` | `SessionId, StudentId` | ป้องกันบันทึกการเข้าเรียนซ้ำในครั้งสอนเดียวกัน และช่วยดูรายชื่อเข้าเรียนตาม session |

## Index ที่เพิ่มเอง

| Index | Columns | เหตุผล |
| --- | --- | --- |
| `IX_Enrollments_CourseStatus` | `CourseId, EnrollmentStatus` | ใช้ดูรายชื่อนักเรียนในรายวิชา และกรองสถานะ เช่น กำลังเรียน/เรียนจบ/ถอนรายวิชา |
| `IX_TeachingSessions_CourseDate` | `CourseId, SessionDate` | ใช้ค้นหาว่าวิชานี้มีการสอนวันไหนบ้าง |
| `IX_TeachingSessions_TeacherDate` | `TeacherId, SessionDate` | ใช้ค้นหาตารางสอนของครูตามวันที่ |
| `IX_Attendances_StudentId` | `StudentId` | ใช้ดูประวัติการเข้าเรียนของนักเรียนแต่ละคน |
| `IX_Attendances_Status` | `AttendanceStatus` | ใช้ทำรายงานสถานะการเข้าเรียน เช่น มาเรียน มาสาย ขาดเรียน ลา |

