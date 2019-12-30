@echo off

del InsertionSort.lst
del InsertionSort.obj
del InsertionSort.ilk
del InsertionSort.pdb
del InsertionSort.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   InsertionSort.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:InsertionSort.exe InsertionSort.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR InsertionSort.*

:terminate

MOVE /Y InsertionSort.obj .\all_lib\obj
COPY /Y InsertionSort.asm .\all_lib\proc_asm

pause
endlocal