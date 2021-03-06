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

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:keyEvents.exe keyEvents.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR keyEvents.*

:terminate

MOVE /Y keyEvents.obj .\all_lib\obj
COPY /Y keyEvents.asm .\all_lib\proc_asm

pause
endlocal