@call :GET_CURRENT_DIR
@cd %THIS_DIR%
ECHO OFF
CLS
:MENU
CLS
ECHO.
ECHO           Ginasis Mining Zaddex Toolbox
ECHO       ZEXO: RCsdERNGwQA11diYpAFhvXwfwvmszQyrFc
ECHO. 
ECHO .....................................................
ECHO PRESS 1, 2, 3 OR 4 to select your task, or 5 to EXIT.
ECHO .....................................................
ECHO.
ECHO 1 - Start Staking
ECHO 2 - Stop Staking
ECHO 3 - Check Staking Status
ECHO 4 - Check Balance
ECHO 5 - EXIT
ECHO.
color 81
SET /P M=Type 1, 2, 3, 4, or 5 then press ENTER:
IF %M%==1 GOTO STARTSTAKING
IF %M%==2 GOTO STOPSTAKING
IF %M%==3 GOTO STAKINGSTATUS
IF %M%==4 GOTO BALANCE
IF %M%==5 GOTO EOF

:STARTSTAKING
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=ZEXO setgenerate true
ECHO.
ECHO Staking succsesfully switched on
TIMEOUT /T 5
GOTO MENU

:STOPSTAKING
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli.exe -ac_name=ZEXO setgenerate false
ECHO.
ECHO Staking succsesfully switched off
TIMEOUT /T 5
GOTO MENU

:STAKINGSTATUS
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=ZEXO getmininginfo
ECHO.
TIMEOUT /T 5
GOTO MENU

:BALANCE
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=ZEXO getbalance
ECHO.
TIMEOUT /T 5
GOTO MENU

:GET_CURRENT_DIR
@pushd %~dp0
@set THIS_DIR=%CD%
@popd
