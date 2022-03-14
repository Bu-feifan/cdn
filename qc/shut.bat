@echo off 
:start 
color f0
shutdown -a >nul .
set a_EL=%ERRORLEVEL%
if /I "%1"=="N" goto sd_N
if /I "%1"=="F" goto sd_F
if /I "%1"=="R" goto s_R
if /I "%1"=="RF" goto sd_RF
if /I "%1"=="RN" goto sd_RN
title=电源选项

:which
cls
if %a_EL% equ 0 (mode con cols=29 lines=6
echo 已取消命令
echo.
echo 是否继续？[其他字符=退出]) else (mode con cols=37 lines=4
echo 是否关机？[Q=退出][其他字符=5s后关机])
set /p s_If=请输入[R=重启][F=立即关机]:
if /I "%s_If%"=="Q" goto quit
if /I "%s_If%"=="F" goto sd_F
if /I "%s_If%"=="R" goto s_R
if %a_EL% equ 0 goto quit
goto sd_N

:sd_N
shutdown -s -t 5
goto quit

:sd_F
shutdown -s -t 0
goto quit

:s_R
if /I "%2"=="F" goto sd_RF
if /I "%2"=="N" goto sd_RN
cls 
mode con cols=39 lines=4
echo 重启选项[F=立即][其他字符=5s后]
echo. 
set /p r_F=请输入[Q=退出][B=返回]: 
if /I "%r_F%"=="Q" goto quit
if /I "%r_F%"=="F" goto sd_RF
if /I "%r_F%"=="B" goto s_B
goto sd_RN
goto quit

:sd_RN
shutdown -r -t 5
goto quit

:sd_RF
shutdown -r -t 0
goto quit

:s_B
set a_EL=u
set s_If=u
set r_F=u
goto which

:quit
exit