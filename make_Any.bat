@echo off

del RandomGenerator.lst
del RandomGenerator.obj
del RandomGenerator.ilk
del RandomGenerator.pdb
del RandomGenerator.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   RandomGenerator.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:RandomGenerator.exe RandomGenerator.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR RandomGenerator.*

:terminate

MOVE /Y RandomGenerator.obj .\all_lib\obj
COPY /Y RandomGenerator.asm .\all_lib\proc_asm

pause
endlocal