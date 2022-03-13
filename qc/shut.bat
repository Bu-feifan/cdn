@echo off 
:start 
shutdown -a
set a_EL=%ERRORLEVEL%
if "%1"=="N" goto sd_N
if "%1"=="F" goto sd_F
if "%1"=="R" goto s_R
if "%1"=="RF" goto sd_RF
if "%1"=="RN" goto sd_RN
if "%1"=="n" goto sd_N
if "%1"=="f" goto sd_F
if "%1"=="r" goto s_R
if "%1"=="rf" goto sd_RF
if "%1"=="rn" goto sd_RN
if "%1"=="rF" goto sd_RF
if "%1"=="rN" goto sd_RN
if "%1"=="Rf" goto sd_RF
if "%1"=="Rn" goto sd_RN
title=电源选项

:which
cls
if %a_EL% equ 0 (mode con cols=29 lines=6&color f0
echo 已取消命令
echo.
echo 是否继续？[其他字符=退出]
echo.) else (mode con cols=37 lines=4&color f0
echo 是否关机？[Q=退出][其他字符=普通模式])
set /p s_If=请输入[R=重启][F=快速模式]:
if "%s_If%"=="Q" goto quit
if "%s_If%"=="F" goto sd_F
if "%s_If%"=="R" goto s_R
if "%s_If%"=="q" goto quit
if "%s_If%"=="f" goto sd_F
if "%s_If%"=="r" goto s_R
if %a_EL% equ 0 goto quit
goto sd_N

:sd_N
shutdown -s -t 5
goto quit

:sd_F
shutdown -s -t 0
goto quit

:s_R
if "%2"=="F" goto sd_RF
if "%2"=="N" goto sd_RN
if "%2"=="f" goto sd_RF
if "%2"=="n" goto sd_RN
cls 
mode con cols=39 lines=4
echo 重启选项[F=快速模式][其他字符=普通模式]
echo. 
set /p r_F=请输入[Q=退出][B=返回]: 
if "%r_F%"=="Q" goto quit
if "%r_F%"=="F" goto sd_RF
if "%r_F%"=="B" goto s_B
if "%r_F%"=="q" goto quit
if "%r_F%"=="f" goto sd_RF
if "%r_F%"=="b" goto s_B
goto sd_RN
goto quit

:sd_RN
shutdown -r -t 5
goto quit

:sd_RF
shutdown -r -t 0
goto quit

:s_B
set s_If=u
set r_F=u
set a_EL=u
goto which

:quit
exit