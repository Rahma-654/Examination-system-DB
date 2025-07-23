CREATE DATABASE Examination
ON 
PRIMARY (
    NAME = 'Examination',
    FILENAME = 'D:\final project\Examination.mdf',
    SIZE = 10MB,
    FILEGROWTH = 2MB,
    MAXSIZE = 100MB
),
FILEGROUP users_FG (
    NAME = 'users',
    FILENAME = 'D:\final project\users.ndf',
    SIZE = 10MB,
    FILEGROWTH = 2MB,
    MAXSIZE = 100MB
),
FILEGROUP branch_FG (
    NAME = 'branch',
    FILENAME = 'D:\final project\branch.ndf',
    SIZE = 10MB,
    FILEGROWTH = 2MB,
    MAXSIZE = 100MB
),
FILEGROUP material_FG (
    NAME = 'material',
    FILENAME = 'D:\final project\material.ndf',
    SIZE = 10MB,
    FILEGROWTH = 2MB,
    MAXSIZE = 100MB
)
LOG ON (
    NAME = 'Examination_log',
    FILENAME = 'D:\final project\Examination_log.ldf',
    SIZE = 5MB,
    FILEGROWTH = 1MB,
    MAXSIZE = 25MB
)
