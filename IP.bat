@echo off
title Show IP Address

echo ================================
echo   Local IP Address
echo ================================
ipconfig | findstr /i "IPv4"
echo.

echo ================================
echo   Public IP Address
echo ================================
powershell -NoProfile -Command "(Invoke-WebRequest -Uri 'https://api.ipify.org').Content"
echo.
echo.

pause