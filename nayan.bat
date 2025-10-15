@echo off
set A=2
set B=1

if "%~1"=="" (
  echo Usage: %~nx0 [sum^|diff]
  goto :eof
)

setlocal enabledelayedexpansion

if /i "%~1"=="sum" (
  set /a result=A + B
  echo !result!
  goto :eof
)

if /i "%~1"=="diff" (
  set /a result=A - B
  echo !result!
  goto :eof
)

echo Invalid command: %~1
echo Usage: %~nx0 [sum^|diff]

endlocal
