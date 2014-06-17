mode con[:] [cols=50] [lines=100]
ECHO off

:MENU
COLOR 3
CLS
                                                                             

ECHO           .......................................................
ECHO                               RunAsAdmin.bat
ECHO           .......................................................
ECHO.
ECHO                  (http://bitbucket.org/asnivor/runasadmin)
ECHO           .......................................................

ECHO.
ECHO.
ECHO.
ECHO Enter Account to RunAs (in the form domain\accountname or accountname)
ECHO.
SET /P U=

ECHO.
ECHO.
ECHO 1 - CMD Prompt
ECHO 2 - Services
ECHO 3 - Computer Management
ECHO 4 - Device Manager
ECHO 5 - *Type a command*



ECHO 6 - Internet Explorer

ECHO.

ECHO.


ECHO 0 - EXIT
ECHO.
SET /P M=Type number then press ENTER: 

IF %M%==1 GOTO CMD
IF %M%==2 GOTO SERVICES
IF %M%==3 GOTO COMPUTERMANAGEMENT
IF %M%==4 GOTO DEVICEMANAGER

IF %M%==5 GOTO TYPECOMMAND

IF %M%==6 GOTO IE

IF %M%==0 GOTO EOF

:CMD
COLOR 6
runas /user:%U% "cmd.exe" 
GOTO MENU

:SERVICES
COLOR 6
runas /user:%U% "mmc services.msc" 
GOTO MENU

:COMPUTERMANAGEMENT
COLOR 6
runas /user:%U% "mmc compmgmt.msc"
GOTO MENU

:DEVICEMANAGER
COLOR 6
runas /user:%U% "mmc devmgmt.msc"
GOTO MENU

:TYPECOMMAND
COLOR 6
CLS
 
SET /P A=Type command then press ENTER:
runas /user:%U% "%A%"
GOTO MENU

:IE
COLOR 6
runas /user:%U% "c:\program files\internet explorer\iexplore.exe"
GOTO MENU

:EOF
EXIT

 





