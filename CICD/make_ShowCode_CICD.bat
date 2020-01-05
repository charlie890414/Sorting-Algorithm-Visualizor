@echo off

del ShowCode.lst
del ShowCode.obj
del ShowCode.ilk
del ShowCode.pdb
del ShowCode.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   ShowCode.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:ShowCode.exe ShowCode.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR ShowCode.*

:terminate

MOVE /Y ShowCode.obj .\all_lib\obj
COPY /Y ShowCode.asm .\all_lib\proc_asm

endlocal