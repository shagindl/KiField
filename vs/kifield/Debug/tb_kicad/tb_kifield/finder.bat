::----------input------------
::������� ���� � ������
set lgfl=%~1
::������� �������� ���� (���� ����������)
set nwlg=%~2
::������� ���-�� ������ ����� �� �������
set num1=0
::������� ���-�� ������ ����� ����� �������
set num2=0
::������� ������� ������
:: set word=.*����������� �������: {.*}.*
set word=L .*

cls

@echo lgfl=%lgfl%
@echo nwlg=%nwlg%
@echo word=%word%

@echo off
setlocal EnableDelayedExpansion
if Not DEFINED %1 set lgfl=%1 2>nul
if Not DEFINED %2 set nwlg=%2 2>nul
:: if Not DEFINED %3 set num1=%3 2>nul
:: if Not DEFINED %4 set num2=%4 2>nul
:: if Not DEFINED %5 set word=%5 2>nul
 
:: set /p lgfl=���� � ������(������� �������� %lgfl%):
:: set /p nwlg=�������� ����(������� �������� %nwlg%):
:: set /p num1=���-�� ������ ����� �� �������(������� �������� %num1%):
:: set /p num2=���-�� ������ ����� ����� �������(������� �������� %num2%):
:: set /p word=������� ������(������� �������� %word%):
 
::----------����� ������� �����------------
::for /f "delims=: tokens=2 usebackq" %%a in (`findstr /n/r/b %word% %lgfl%`) do (call :pars %%a)
for /f "delims=: tokens=3* usebackq" %%a in (`findstr /n /r /b %word% %lgfl%`) do (
	@echo %%a:%%b
	echo %%a:%%b>>%nwlg%
)
pause
exit /b
 
:pars
:: ��������� ������ ������ � ���������� ���������� ������������ ����� �� � �����
set /a isum=%num1%+%num2%+1
if %num1% lss %1 (
    set /a num=%1-%num1%-1
    set "skp=skip=!num! "
    ) else (
    set "skp="
    set /a isum=%num2%+%1
    )
:: ����� �� ����� � ������ � ����
echo ------------------------%1------------------------
echo ------------------------%1------------------------>>%nwlg%
for /f "skip=%skp% tokens=*" %%a in (%lgfl%) do (
    set /a isum-=1
    echo %%a  
    echo %%a>>%nwlg%
    if !isum! lss 1  exit /b)
exit /b