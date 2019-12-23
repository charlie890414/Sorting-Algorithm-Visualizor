@echo off

del help.lst
del help.obj
del help.ilk
del help.pdb
del help.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   help.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:help.exe help.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR help.*

:terminate

MOVE /Y help.obj .\all_lib\obj
COPY /Y help.asm .\all_lib\proc_asm

pause
endlocal