@echo off

del delayandevent.lst
del delayandevent.obj
del delayandevent.ilk
del delayandevent.pdb
del delayandevent.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   delayandevent.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:delayandevent.exe delayandevent.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR delayandevent.*

:terminate

MOVE /Y delayandevent.obj .\all_lib\obj
COPY /Y delayandevent.asm .\all_lib\proc_asm

pause
endlocal