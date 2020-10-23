chcp 65001

del Sch.tsv
bash -c "find ./ -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "kifield -x *.sch -i Sch.tsv -nb -w"
set LANG=ru_RU.UTF-8
bash -c "sed -i -f sch2tsv.sed Sch.tsv"

pause

rem bash -c "kifield -x ./lib/*.dcm ./lib/*.lib -i Dcm.Lib.csv -nb -w -d 100"
rem bash -c "kifield -x *.dcm *.lib -i AC_DC.dcm.lib.csv -nb -w -d 100"
rem bash -c "sed -e 's/Refs/Поз.обозначение/; s/value/Наименование/' Sch.tsv"
rem bash -c "export LANG="ru_RU.UTF-8" | sed -i -e 's/Refs/Поз.обозначение/; s/value/Наименование/' Sch.tsv"