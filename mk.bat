@echo off
setlocal EnableExtensions EnableDelayedExpansion
if "%~1"=="" (
  echo Usage: %~nx0 dir name1 [name2 ...]
  echo  %~nx0 file name1 [name2 ...]
  exit /b 1
)
set "mode=%~1"
shift
if /i "%mode%"=="dir" goto :mkdirs
if /i "%mode%"=="folder" goto :mkdirs
if /i "%mode%"=="file" goto :mkfiles
if /i "%mode%"=="touch" goto :mkfiles
echo Invalid mode: %mode%
exit /b 1

:mkdirs
if "%~1"=="" exit /b 0
:mkd_loop
if "%~1"=="" exit /b 0
mkdir "%~1" >nul 2>&1
shift
goto :mkd_loop

:mkfiles
if "%~1"=="" exit /b 0
:mkf_loop
if "%~1"=="" exit /b 0
if not "%~dp1"=="" if not exist "%~dp1" mkdir "%~dp1" >nul 2>&1
type nul >> "%~1"
shift
goto :mkf_loop
