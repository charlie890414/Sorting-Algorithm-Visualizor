@echo off

del Main.lst
del Main.obj
del Main.ilk
del Main.pdb
del "Sorting Algorithm Visualizor.exe"

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   Main.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:"Sorting Algorithm Visualizor.exe" Main.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

del Main.lst
del Main.obj
del Main.ilk
del Main.pdb

DIR Main.*

:terminate
pause
endlocal