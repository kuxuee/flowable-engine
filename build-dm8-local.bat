@echo off
setlocal

REM Default version for the customized Flowable build. You can override it:
REM build-dm8-local.bat 8.1.0-dm8-SNAPSHOT
set "FLOWABLE_VERSION=%~1"
if "%FLOWABLE_VERSION%"=="" set "FLOWABLE_VERSION=8.1.0-dm8-SNAPSHOT"

echo [1/2] Setting project version to %FLOWABLE_VERSION%
call .\mvnw versions:set -DnewVersion=%FLOWABLE_VERSION% -DgenerateBackupPoms=false
if errorlevel 1 goto :fail

echo [2/2] Building and installing artifacts into the local Maven repository
call .\mvnw clean install -DskipTests
if errorlevel 1 goto :fail

echo.
echo Build completed successfully with version %FLOWABLE_VERSION%.
goto :eof

:fail
echo.
echo Build failed. Please check the Maven output above.
exit /b 1
