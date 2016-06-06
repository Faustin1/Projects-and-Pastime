@ECHO OFF
TITLE WatchGWX
:X
:: Testschleife Halbe Stunde
ECHO ------------------------------
ECHO Warte auf naechsten Intervall...
ECHO.
ECHO GWX suchen und vernichten...
ECHO ------------------------------
TIMEOUT /T 1800

TASKLIST | FIND /N "GWX"

IF %errorlevel% EQU 0 (
	ECHO %DATE% %TIME%: GWX wurde gesichtet... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: GWX wurde gesichtet...
	GOTO Y
) ELSE (
	ECHO %DATE% %TIME%: Kein GWX in sicht... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Kein GWX in sicht...
	GOTO X
)

:Y
:: GWX beenden
:: GWX selbst beenden
TASKKILL /F /IM GWX.EXE

IF %errorlevel% EQU 0 (
	ECHO %DATE% %TIME%: GWX wurde gekillt... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: GWX wurde gekillt...
)
IF %errorlevel% EQU 5 (
	ECHO %DATE% %TIME%: Zugriff verweigert... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Zugriff verweigert...
)
IF %errorlevel% NEQ 0 (
	ECHO %DATE% %TIME%: Unbekannter Fehlercode: %errorlevel% >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Unbekannter Fehlercode: %errorlevel%
)

:: Popup von GWX (GWXUX) suchen und beenden
TASKLIST | FIND /N "GWXUX"

IF %errorlevel% EQU 0 (
	ECHO %DATE% %TIME%: GWXUX wurde auch gesichtet... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: GWXUX wurde auch gesichtet...
	GOTO Z
) ELSE (
	ECHO %DATE% %TIME%: Kein GWXUX in sicht... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Kein GWXUX in sicht...
	GOTO X
)

:Z
:: GWXUX beenden
TASKKILL /F /IM GWXUX.EXE

IF %errorlevel% EQU 0 (
	ECHO %DATE% %TIME%: GWXUX wurde auch gekillt... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: GWXUX wurde auch gekillt...
)
IF %errorlevel% EQU 5 (
	ECHO %DATE% %TIME%: Zugriff verweigert... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Zugriff verweigert...
)
IF %errorlevel% NEQ 0 (
	ECHO %DATE% %TIME%: Fehlercode %errorlevel% aufgetreten... >> WatchGWX_Log.txt
	ECHO ------------------------------ >> WatchGWX_Log.txt
	ECHO ------------------------------
	ECHO %DATE% %TIME%: Fehlercode %errorlevel% aufgetreten...
)

:: Rückkehr zur Hauptschleife
GOTO X
