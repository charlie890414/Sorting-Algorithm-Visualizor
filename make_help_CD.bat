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

DIR help.*

:terminate

MOVE /Y help.obj .\all_lib\obj
COPY /Y help.asm .\all_lib\proc_asm

endlocal