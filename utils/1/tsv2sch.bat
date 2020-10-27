chcp 65001

bash -c "find ./ -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "sed -i -f tsv2sch.sed Sch.tsv"
bash -c "kifield -x Sch.tsv -i *.sch -w -nb"

del Sch.tsv

pause
