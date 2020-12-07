echo off
chcp 65001
Setlocal EnableDelayedExpansion

set schFile=*.sch
set tmpFile=tmp.txt
set symbFile=Symb.txt

del %symbFile%

::finder.bat tb_kifield.sch Symb.txt
for /f "delims=: tokens=3* usebackq" %%a in (`findstr /n /r /b L .* %schFile%`) do (
	echo %%a:%%b
)>>%tmpFile%

for /f "usebackq tokens=*" %%a in (%tmpFile%) do ( 
	for /f "tokens=2" %%i in ("%%a") do if Not Defined %%i Set %%i=*& @echo %%i
)>>%symbFile%

del %tmpFile%

::pause