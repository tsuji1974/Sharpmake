setlocal enabledelayedexpansion

:: Clear previous run status
COLOR

:: set batch file directory as current
pushd "%~dp0"

@REM -----------------------------------------------------------------------
mkdir Bin
xcopy /S /Y Sharpmake.Application\bin\Release\net6.0\*.* .\Bin

if %errorlevel% NEQ 0 goto error

@REM -----------------------------------------------------------------------
:success
COLOR 2F
echo Copy to bin succeeded^!
set ERROR_CODE=0
goto end

@REM -----------------------------------------------------------------------
:error
COLOR 4F
echo Copy to bin failed^!
set ERROR_CODE=1
goto end

@REM -----------------------------------------------------------------------
:end
:: restore caller current directory
popd

pause 

exit /b %ERROR_CODE%
