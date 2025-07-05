@echo off
if not exist build (
    md build
)
cd build
cmake -G Ninja ..
ninja
start doxygen
pause