@echo off
setlocal enabledelayedexpansion

REM Check if build directory exists
if not exist "build" (
    echo Creating build directory...
    mkdir build
) else (
    echo Build directory already exists
)

REM Change to build directory
cd build

REM Run CMake configuration
echo Configuring project with CMake...
cmake ..
if errorlevel 1 (
    echo CMake configuration failed
    exit /b 1
)

REM Build the project
echo Building project...
cmake --build .
if errorlevel 1 (
    echo Build failed
    exit /b 1
)

REM Run tests with CTest
echo Running tests...
ctest --output-on-failure
if errorlevel 1 (
    echo Tests failed
    exit /b 1
)

echo All tasks completed successfully!
cd ..
endlocal