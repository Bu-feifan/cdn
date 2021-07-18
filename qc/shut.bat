@echo off 
:start 
shutdown -a  >nul 2>nul
set a-err=%ERRORLEVEL%
echo 调整控制台样式……
title=关机选项
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
if %a-err% equ 0 (echo 已取消关机命令
echo.
) 
if %a-err% equ 0 (echo 是否继续关机？[其他字符=退出]) else (echo 是否关机？[q=退出][其他字符=普通模式])
echo.
set /p shutdown-if=请输入[r=重启][f=快速模式]:
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
echo 是否启用快速重启？[f=快速模式]
echo. 
set /p re-if=请输入[q=退出][b=返回]: 
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