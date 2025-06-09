@echo off
setlocal enabledelayedexpansion

set INPUT=radio.ini
set LINES_PER_FILE=450
set COUNT=0
set LINECOUNT=0

rem Удалим старые части
rem del radio*.ini >nul 2>&1

for /f "usebackq delims=" %%A in ("%INPUT%") do (
    if !LINECOUNT! EQU 0 (
        set "OUTFILE=.\Radio2\radio!COUNT!.ini"
        >"!OUTFILE!" (
            rem создаём файл с первой строкой
            echo %%A
        )
    ) else (
        echo %%A>>"!OUTFILE!"
    )

    set /a LINECOUNT+=1

    if !LINECOUNT! GEQ %LINES_PER_FILE% (
        set /a COUNT+=1
        set LINECOUNT=0
    )
)
