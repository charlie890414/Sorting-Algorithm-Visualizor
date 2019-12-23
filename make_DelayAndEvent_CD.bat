@echo off

del DelayAndEvent.lst
del DelayAndEvent.obj
del DelayAndEvent.ilk
del DelayAndEvent.pdb
del DelayAndEvent.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   DelayAndEvent.asm
if errorlevel 1 goto terminate

DIR DelayAndEvent.*

:terminate

MOVE /Y DelayAndEvent.obj .\all_lib\obj
COPY /Y DelayAndEvent.asm .\all_lib\proc_asm

endlocal