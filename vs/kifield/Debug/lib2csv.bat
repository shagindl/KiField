del Dcm.Lib.csv
bash -c "find ./ -maxdepth 1 -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "kifield -x ./lib/*.dcm ./lib/*.lib -i Dcm.Lib.csv -nb -w"

rem bash -c "kifield -x ./lib/*.dcm ./lib/*.lib -i Dcm.Lib.csv -nb -w -d 100"
rem bash -c "kifield -x *.dcm *.lib -i AC_DC.dcm.lib.csv -nb -w -d 100"
