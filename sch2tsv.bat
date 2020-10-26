echo of
chcp 65001

call :file_name_from_path ExecDir %0
call :file_name_from_path SchDir %1

rem cd /d "%SchDir%" | del Sch.tsv
cd /d "%SchDir%" 
bash -c "kifield -x *.sch -i Sch.tsv -nb -w"
rem set LANG=ru_RU.UTF-8
rem cd /d "%SchDir%" | bash -c "sed -i -f sch2tsv.sed Sch.tsv"

goto :eof

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~dp2"
    exit /b
)

:eof