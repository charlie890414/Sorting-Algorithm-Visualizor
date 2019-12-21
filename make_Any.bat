@echo off

del Help.lst
del Help.obj
del Help.ilk
del Help.pdb
del Help.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   Help.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:Help.exe Help.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR Help.*

:terminate

MOVE /Y Help.obj .\all_lib\obj
COPY /Y Help.asm .\all_lib\proc_asm

pause
endlocal