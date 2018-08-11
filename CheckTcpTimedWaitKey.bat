@echo off

echo Check if TcpTimedWaitDelay key exists in the registry
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ /v TcpTimedWaitDelay >nul 2>&1

if %ERRORLEVEL% == 0 goto end
if %ERRORLEVEL% == 1 goto installTcpTimedWaitDelayKey

:installTcpTimedWaitDelayKey
echo TcpTimedWaitDelay key not found in the registry, add necessary keys...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d "1" /f
goto end

:end
echo Finished
@exit
