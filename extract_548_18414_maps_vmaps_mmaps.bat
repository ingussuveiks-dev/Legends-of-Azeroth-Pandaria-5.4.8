@echo off
setlocal EnableExtensions

rem Put this file in the root of your World of Warcraft 5.4.8.18414 client folder.
rem Run it from there. It uses this SkyFire/Pandaria project's own extractor tools.

set "TOOLS_DIR=C:\wamp64\www\Legends-of-Azeroth-Pandaria-5.4.8\Build\bin\RelWithDebInfo"
set "SERVER_DIR=C:\wamp64\www\Legends-of-Azeroth-Pandaria-5.4.8\Build\bin\RelWithDebInfo"

rem SkyFire extractor comment says 5.4.8.18414 uses MPQ names from build 18273.
set "TARGET_BUILD=18273"

echo.
echo ============================================================
echo  Legends of Azeroth Pandaria 5.4.8 map/vmap/mmap extractor
echo ============================================================
echo  Client folder: %CD%
echo  Tools folder : %TOOLS_DIR%
echo  Server folder: %SERVER_DIR%
echo  Target build : %TARGET_BUILD%
echo.

if not exist "Wow.exe" (
  echo ERROR: Wow.exe not found.
  echo Put this .bat file in your WoW 5.4.8.18414 client root folder and run it there.
  pause
  exit /b 1
)

for %%F in (mapextractor.exe vmap4extractor.exe vmap4assembler.exe mmaps_generator.exe) do (
  if not exist "%TOOLS_DIR%\%%F" (
    echo ERROR: Missing tool: %TOOLS_DIR%\%%F
    echo Build the project with CMake option TOOLS=ON, then build target %%F.
    pause
    exit /b 1
  )
)

echo Copying extractor tools into client folder...
copy /Y "%TOOLS_DIR%\mapextractor.exe" . >nul
copy /Y "%TOOLS_DIR%\vmap4extractor.exe" . >nul
copy /Y "%TOOLS_DIR%\vmap4assembler.exe" . >nul
copy /Y "%TOOLS_DIR%\mmaps_generator.exe" . >nul

rem Some builds of the tools may need these DLLs in the working folder.
if exist "%TOOLS_DIR%\libcrypto-3-x64.dll" copy /Y "%TOOLS_DIR%\libcrypto-3-x64.dll" . >nul
if exist "%TOOLS_DIR%\libssl-3-x64.dll" copy /Y "%TOOLS_DIR%\libssl-3-x64.dll" . >nul
if exist "%TOOLS_DIR%\libmysql.dll" copy /Y "%TOOLS_DIR%\libmysql.dll" . >nul

echo.
echo Step 1/4: extracting maps, dbc and db2...
mapextractor.exe -b %TARGET_BUILD%
if errorlevel 1 goto failed

echo.
echo Step 2/4: extracting raw vmap Buildings data...
vmap4extractor.exe -s -b %TARGET_BUILD%
if errorlevel 1 goto failed

echo.
echo Step 3/4: assembling vmaps...
if not exist "vmaps" mkdir "vmaps"
vmap4assembler.exe Buildings vmaps
if errorlevel 1 goto failed

echo.
echo Step 4/4: generating mmaps...
if not exist "mmaps" mkdir "mmaps"
mmaps_generator.exe --threads 4
if errorlevel 1 goto failed

echo.
echo Copying generated data to server folder...
if not exist "%SERVER_DIR%" (
  echo ERROR: Server folder not found: %SERVER_DIR%
  pause
  exit /b 1
)

xcopy /E /I /Y "maps" "%SERVER_DIR%\maps"
xcopy /E /I /Y "vmaps" "%SERVER_DIR%\vmaps"
xcopy /E /I /Y "mmaps" "%SERVER_DIR%\mmaps"
xcopy /E /I /Y "dbc" "%SERVER_DIR%\dbc"

if exist "db2" (
  xcopy /E /I /Y "db2" "%SERVER_DIR%\db2"
  xcopy /E /I /Y "db2\*.db2" "%SERVER_DIR%\dbc"
)

echo.
echo Done.
echo Generated files were copied to:
echo %SERVER_DIR%
echo.
echo After this, enable vmaps/mmaps again in worldserver.conf if you disabled them.
pause
exit /b 0

:failed
echo.
echo ERROR: Extraction failed. Check the messages above.
pause
exit /b 1
