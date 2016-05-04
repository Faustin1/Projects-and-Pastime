@echo off

:Intro
title BatScan.bat
echo.
echo Network Scanner
echo -----------------
echo.
echo This batch file scans the IP address range with a timeout of 160ms
echo.
echo Please enter the first three sets of the ip address in this format:
set /p ipbegin=Example: "192.168.1" :


if exist errorchk.bat del errorchk.bat
if exist "%userprofile%\desktop\IP Scan.txt" del "%userprofile%\desktop\IP Scan.txt"
 

::Create errorchk.bat
echo @echo off>>errorchk.bat
echo echo.>>errorchk.bat
echo echo Error level finder>>errorchk.bat
echo rem run program>>errorchk.bat
echo call %%1 %%2 %%3 %%4 %%5 %%6 %%7 %%8 %%9>>errorchk.bat
echo. >>errorchk.bat
echo for /l %%%%f in (255, -1, 0) do (>>errorchk.bat
echo if errorlevel=%%%%f echo Errorlevel=%%%%f>>errorchk.bat
echo )>>errorchk.bat


set errorlevel=0


rem Declare variables
set timeout=0

if "%1"=="" (
echo Default timeout used [160 ms]
set timeout=160
echo.
)

::settimeout
if %timeout%==0 set timeout=%1


::default
for /l %%f in (1, 1, 254) do (
set errorlevel=0

call "errorchk.bat" ping -n 1 -w %timeout% %ipbegin%.%%f  > nul

rem log entry
if not errorlevel=1 echo %ipbegin%.%%f active>>"%userprofile%\desktop\IP Scan.txt"
if errorlevel=1 echo %ipbegin%.%%f inactive>>"%userprofile%\desktop\IP Scan.txt"

if %%f EQU 1 (cls
echo.
echo [                             ]    0 Percent Complete)
if %%f EQU 25 (cls
echo.
echo [###                          ]    10 Percent Complete)
if %%f EQU 55 (cls
echo.
echo [######                       ]    20 Percent Complete)
if %%f EQU 75 (cls
echo.
echo [#########                    ]    30 Percent Complete)
if %%f EQU 100 (cls
echo.
echo [############                 ]    40 Percent Complete)
if %%f EQU 125 (cls
echo.
echo [###############              ]    50 Percent Complete)
if %%f EQU 150 (cls
echo.
echo [##################           ]    60 Percent Complete)
if %%f EQU 175 (cls
echo.
echo [#####################        ]    70 Percent Complete)
if %%f EQU 200 (cls
echo.
echo [########################     ]    80 Percent Complete)
if %%f EQU 225 (cls
echo.
echo [###########################  ]    90 Percent Complete)
if %%f EQU 254 (cls
echo.
echo [#############################]    Network Scan complete)
)

if exist errorchk.bat del errorchk.bat

:: Lists all active Computers in the network

find /V "inactive" "%userprofile%\desktop\IP Scan.txt"
echo.

echo "Press any key to exit"
if exist "%userprofile%\desktop\IP Scan.txt" del "%userprofile%\desktop\IP Scan.txt"
if exist errorchk.bat del errorchk.bat
pause >nul
