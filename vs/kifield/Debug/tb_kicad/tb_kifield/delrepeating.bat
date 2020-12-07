echo off

Setlocal EnableDelayedExpansion

Set File1=Symb.txt
Set File2=LogWithoutRepeating.txt

del %File2%
for /f "usebackq tokens=*" %%a in (%File1%) do ( 
	for /f "tokens=2" %%i in ("%%a") do if Not Defined %%i Set %%i=*& @echo %%i
)>>"%File2%"

set

::FOR /F "tokens=2 delims= " %i in ("L Capacity:PCAP C4 ") do echo %i

::@<"1.txt">"2.txt" (for /f "delims=" %%i in ('more') do @if not defined %%i (echo %%i& set %%i=*))
::@<"1.txt">"2.txt" (for /f "delims=" %i in ('more') do @if not defined %i (echo %i& set %i=*))