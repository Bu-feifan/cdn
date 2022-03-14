@echo off 
:start 
shutdown -a
if "%ERRORLEVEL%"=="0" goto quit
if /I "%1"=="N" goto sd_N
if /I "%1"=="F" goto sd_F
if /I "%1"=="R" goto s_R
if /I "%1"=="RF" goto sd_RF
if /I "%1"=="RN" goto sd_RN
:sd_N
shutdown -s -t 5
goto quit
:sd_F
shutdown -s -t 0
goto quit
:s_R
if /I "%2"=="F" goto sd_RF
goto sd_RN
goto quit
:sd_RN
shutdown -r -t 5
goto quit
:sd_RF
shutdown -r -t 0
goto quit
:quit
exit