CREATE DATABASE examination_iti
ON PRIMARY (
    NAME = 'examination_iti_data',
    FILENAME = 'D:\ITI\ADVSQL\exam\examination_iti_data.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = 'examination_iti_log',
    FILENAME = 'D:\ITI\ADVSQL\exam\examination_iti_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB
);
GO

-- FG_Users
ALTER DATABASE examination_iti 
ADD FILEGROUP FG_Users;

ALTER DATABASE examination_iti 
ADD FILE (
    NAME = 'UsersDataFile',
    FILENAME = 'D:\ITI\ADVSQL\exam\UsersData.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
)
TO FILEGROUP FG_Users;

-- FG_Courses
ALTER DATABASE examination_iti 
ADD FILEGROUP FG_Courses;

ALTER DATABASE examination_iti 
ADD FILE (
    NAME = 'CoursesDataFile',
    FILENAME = 'D:\ITI\ADVSQL\exam\CoursesData.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
)
TO FILEGROUP FG_Courses;

-- FG_Admin
ALTER DATABASE examination_iti 
ADD FILEGROUP FG_Admin;

ALTER DATABASE examination_iti 
ADD FILE (
    NAME = 'AdminDataFile',
    FILENAME = 'D:\ITI\ADVSQL\exam\AdminData.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
)
TO FILEGROUP FG_Admin;
GO



SELECT 
    data_space_id,
    name AS FileGroupName,
    type_desc AS Type,
    is_default AS IsDefault
FROM 
    sys.filegroups;
