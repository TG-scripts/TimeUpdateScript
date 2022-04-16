@echo off
color 6
echo   _______           __  __        __     __      ____        _      __ 
echo  /_  __(_)_ _  ___ / / / /__  ___/ /__ _/ /____ / __/_______(_)__  / /_
echo   / / / /  ' \/ -_) /_/ / _ \/ _  / _ `/ __/ -_)\ \/ __/ __/ / _ \/ __/
echo  /_/ /_/_/_/_/\__/\____/ .__/\_,_/\_,_/\__/\__/___/\__/_/ /_/ .__/\__/ 
echo                       /_/                                  /_/  
echo.		    	 	
echo.	  	       													
echo by TG 		Github: https://github.com/TG-scripts/TimeUpdateScript  
echo.
echo Version 1.1                                                                                                                                                                                                                                                                        
                                                                                                                                   
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
 
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
 
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges

echo. 
echo.
echo Press enter to start...
echo.
echo.
echo.
pause >nul


:loop
w32tm /resync
:sleep 20
goto loop
pause