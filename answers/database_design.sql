CREATE TABLE Teachers
(
    TeacherId INT IDENTITY(1,1) PRIMARY KEY,
    TeacherCode VARCHAR(20) NOT NULL UNIQUE,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email VARCHAR(255) NULL,
    Phone VARCHAR(30) NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Courses
(
    CourseId INT IDENTITY(1,1) PRIMARY KEY,
    CourseCode VARCHAR(20) NOT NULL UNIQUE,
    CourseName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(1000) NULL,
    TeacherId INT NOT NULL UNIQUE,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Courses_Teachers
        FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId)
);

CREATE TABLE Students
(
    StudentId INT IDENTITY(1,1) PRIMARY KEY,
    StudentCode VARCHAR(20) NOT NULL UNIQUE,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email VARCHAR(255) NULL,
    Phone VARCHAR(30) NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Enrollments
(
    EnrollmentId INT IDENTITY(1,1) PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    EnrolledAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    EnrollmentStatus VARCHAR(20) NOT NULL DEFAULT 'active',
    CONSTRAINT FK_Enrollments_Students
        FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    CONSTRAINT FK_Enrollments_Courses
        FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
    CONSTRAINT UQ_Enrollments_Student_Course UNIQUE (StudentId, CourseId),
    CONSTRAINT CK_Enrollments_Status
        CHECK (EnrollmentStatus IN ('active', 'completed', 'dropped'))
);

CREATE TABLE TeachingSessions
(
    SessionId INT IDENTITY(1,1) PRIMARY KEY,
    CourseId INT NOT NULL,
    TeacherId INT NOT NULL,
    SessionDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Topic NVARCHAR(300) NOT NULL,
    TeachingNote NVARCHAR(1000) NULL,
    CONSTRAINT FK_TeachingSessions_Courses
        FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
    CONSTRAINT FK_TeachingSessions_Teachers
        FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
    CONSTRAINT CK_TeachingSessions_Time CHECK (StartTime < EndTime)
);

CREATE TABLE Attendances
(
    AttendanceId INT IDENTITY(1,1) PRIMARY KEY,
    SessionId INT NOT NULL,
    StudentId INT NOT NULL,
    AttendanceStatus VARCHAR(20) NOT NULL,
    CheckedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Remark NVARCHAR(500) NULL,
    CONSTRAINT FK_Attendances_Sessions
        FOREIGN KEY (SessionId) REFERENCES TeachingSessions(SessionId),
    CONSTRAINT FK_Attendances_Students
        FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    CONSTRAINT UQ_Attendances_Session_Student UNIQUE (SessionId, StudentId),
    CONSTRAINT CK_Attendances_Status
        CHECK (AttendanceStatus IN ('present', 'late', 'absent', 'leave'))
);

CREATE INDEX IX_Courses_TeacherId ON Courses(TeacherId);
CREATE INDEX IX_Enrollments_CourseId ON Enrollments(CourseId);
CREATE INDEX IX_Enrollments_StudentId ON Enrollments(StudentId);
CREATE INDEX IX_TeachingSessions_CourseDate ON TeachingSessions(CourseId, SessionDate);
CREATE INDEX IX_TeachingSessions_TeacherDate ON TeachingSessions(TeacherId, SessionDate);
CREATE INDEX IX_Attendances_StudentId ON Attendances(StudentId);
CREATE INDEX IX_Attendances_Status ON Attendances(AttendanceStatus);
