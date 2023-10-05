
setlocal enabledelayedexpansion
echo Minecraft <1.12 == Java 7 
echo Minecraft 1.12-1.17 == Java 8
echo Minecraft 1.18 == Java 17

REM Enter your java version as a number: 
set /p "javav=Enter your java version as a number: "

docker build --build-arg JAVAV=!javav! . -t stoffaudio/docker_minecraft
docker run -it --entrypoint bash -p 25565:25565 -p 222:22 stoffaudio/docker_minecraft