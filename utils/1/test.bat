@echo off
set name=%0
set myPath=C:\Somewhere\Somewhere\SomeFile.txt

call :file_name_from_path result %0
echo %result%
goto :eof

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~dp2"
    exit /b
)

:eof