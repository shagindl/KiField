bash -c "find ./ -name "*.dcm" -o -name "*.lib" -type f | while read file; do enca -L russian -x UTF-8 $file; done;"
bash -c "sed 's/(^F10 (["-]+) ([-\d]+) ([-\d]+) (\d+))/\580/g' ./lib/Capacity.lib"

pause