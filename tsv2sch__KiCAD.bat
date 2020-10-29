echo of
chcp 65001

call :file_name_from_path ExecDir %0
call :file_name_from_path SchDir %1

cd /d "%SchDir%" 

bash -c "recode -f cp1251..utf8/crlf <Sch.tsv | sponge Sch.tsv"
bash -c "sed -i -f \"%KICAD_SYMBOL_DIR%/../SCRIPT/tsv2sch\".sed Sch.tsv"
bash -c "kifield -x Sch.tsv -i *.sch -w -nb"

del Sch.tsv

goto :eof

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~dp2"
    exit /b
)

:eof
