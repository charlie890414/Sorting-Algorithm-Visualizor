@echo off

del keyEvents.lst
del keyEvents.obj
del keyEvents.ilk
del keyEvents.pdb
del keyEvents.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   keyEvents.asm
if errorlevel 1 goto terminate

DIR keyEvents.*

:terminate

MOVE /Y keyEvents.obj .\all_lib\obj
COPY /Y keyEvents.asm .\all_lib\proc_asm

endlocal