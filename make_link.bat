@echo off

del bubblesort.lst
del bubblesort.obj
del bubblesort.ilk
del bubblesort.pdb
del bubblesort.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   bubblesort.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:bubblesort.exe bubblesort.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR bubblesort.*

:terminate

MOVE /Y bubblesort.obj .\all_lib\obj
COPY /Y bubblesort.asm .\all_lib\proc_asm

pause
endlocal