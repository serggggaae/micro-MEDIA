@echo off
setlocal enabledelayedexpansion

set FLD=.\Radio
set RES=.\radio.ini

set first=true

for %%a in (%FLD%\*.ini) do (
  if !first!==true (
    copy /b %%a %RES%
  ) else (
    copy /b %RES% + %%a %RES%
  )
  set first=false
)