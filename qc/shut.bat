@echo off 
:start 
shutdown -a  >nul 2>nul
set a-err=%ERRORLEVEL%
echo ��������̨��ʽ����
title=�ػ�ѡ��
cls
set r-if=0
if "%1"=="n" goto shutdown
if "%1"=="N" goto shutdown
if "%1"=="f" goto fast
if "%1"=="F" goto fast
if "%1"=="r" goto restart
if "%1"=="R" goto restart
if "%1"=="rr" goto re
if "%1"=="RR" goto re
if "%1"=="rf" goto restart-fast
if "%1"=="RF" goto restart-fast
:if
cls 
if %a-err% equ 0 (mode con cols=29 lines=6&color f0) else (mode con cols=37 lines=5&color f0)
echo.
if %a-err% equ 0 (echo ��ȡ���ػ�����
echo.
) 
if %a-err% equ 0 (echo �Ƿ�����ػ���[�����ַ�=�˳�]) else (echo �Ƿ�ػ���[q=�˳�][�����ַ�=��ͨģʽ])
echo.
set /p shutdown-if=������[r=����][f=����ģʽ]:
if "%shutdown-if%"=="q" goto quit
if "%shutdown-if%"=="f" goto fast
if "%shutdown-if%"=="r" goto restart
if %a-err% equ 0 (goto quit)
goto shutdown
:fast
if %r-if% equ 1 (shutdown -r -t 0) else (shutdown -s -t 0)
goto quit
:shutdown
shutdown -s -t 5
goto quit
:restart
cls 
mode con cols=30 lines=5&color f0
echo. 
echo �Ƿ����ÿ���������[f=����ģʽ]
echo. 
set /p re-if=������[q=�˳�][b=����]: 
set r-if=1
if "%re-if%"=="q" goto quit
if "%re-if%"=="Q" goto quit
if "%re-if%"=="f" goto fast
if "%re-if%"=="F" goto fast
if "%re-if%"=="b" goto oddback
if "%re-if%"=="B" goto oddback
goto re
goto quit
:re
shutdown -r -t 5
goto quit
:restart-fast
set r-if=1
goto fast
goto quit
:oddback
set r-if=0
set shutdown-if=0
set re-if=0
set a-err=null
goto if
:quit
exit