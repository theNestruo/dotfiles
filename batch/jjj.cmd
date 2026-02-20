@echo off
if "%1"=="" (
	echo Usage: %0 [JAR file] [options]
	exit /b 1
)
if not exist %1 (
	echo Could not find JAR file: %1
	exit /b 2
)

setlocal ENABLEDELAYEDEXPANSION

set JAR_FILE=%1
set JSA_FILE=%~dpn1.jsa

if "%2"=="" (
	%JAVA_HOME%\bin\java.exe -XX:+AutoCreateSharedArchive -XX:SharedArchiveFile=%JSA_FILE% -jar %JAR_FILE%
	endlocal
	exit /b 0
)

set "JAR_ARGS=%*"
set "JAR_ARGS=!JAR_ARGS:*%1 =!"
%JAVA_HOME%\bin\java.exe -XX:+AutoCreateSharedArchive -XX:SharedArchiveFile=%JSA_FILE% -jar %JAR_FILE% %JAR_ARGS%

endlocal
exit /b 0
