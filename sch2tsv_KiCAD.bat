rem copy this file to     "D:\KiCAD_FIVE_LIBS\SCRIPT\sch2tsv_KiCAD.bat "%1""
rem Add    D:\KiCAD_FIVE_LIBS\SCRIPT\sch2tsv_KiCAD.bat "%1" to KiCAD->BOM

echo of
chcp 65001

call :file_name_from_path ExecDir %0
call :file_name_from_path SchDir %1

cd /d "%SchDir%" 

del Sch.tsv
bash -c "kifield -x *.sch -i Sch.tsv -nb -w"
set LANG=ru_RU.UTF-8
bash -c "sed -i -f \"%KICAD_SYMBOL_DIR%/../SCRIPT/sch2tsv.sed\" Sch.tsv"

bash -c "recode -f utf8/crlf..cp1251 <Sch.tsv | sponge Sch.tsv"

Sch.tsv

goto :eof

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~dp2"
    exit /b
)

:eof