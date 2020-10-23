bash -c "find ./ -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "kifield -x Sch.tsv -i *.sch -w -nb"
pause
