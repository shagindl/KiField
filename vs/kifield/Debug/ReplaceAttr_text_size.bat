rem test - https://regex101.com/r/prQADJ/1
rem bash -c "find ./ -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "sed -i 's/\(^F[0-9]\+ \".\+\" [0-9-]\+ [0-9-]\+ \)\([0-9]*\)/\180/g' ./lib/*.lib"

pause

rem sed 's/(^F10 ([\"-]+) ([-\d]+) ([-\d]+) (\d+))/\580/g' AC_DC.lib
rem sed 's/\(^F10 ["-]* [0-9-]* [0-9-]* \)\([0-9]*\)/\180/g' Capacity.lib
rem sed 's/\(^F10 \)\(["-]\+ \)\(.\+\).\+/\1\2TT\3/g' Capacity.lib