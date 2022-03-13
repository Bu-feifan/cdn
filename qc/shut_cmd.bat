@echo off 
:start 
shutdown -a
if "%ERRORLEVEL%"=="0" goto quit
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
:sd_N
shutdown -s -t 5
goto quit
:sd_F
shutdown -s -t 0
goto quit
:s_R
if "%2"=="F" goto sd_RF
if "%2"=="f" goto sd_RF
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