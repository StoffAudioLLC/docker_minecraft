@echo off
setlocal enabledelayedexpansion

:: Set the path to the config.ini file
set "config_file=config.ini"

:: Read and parse the config.ini file
for /f "tokens=1,2 delims==" %%A in (%config_file%) do (
    set "key=%%A"
    set "value=%%B"
    
    if "!key!"=="java" (
        set "javav=!value!"
    )
)
docker build --build-arg JAVAV=!javav! .