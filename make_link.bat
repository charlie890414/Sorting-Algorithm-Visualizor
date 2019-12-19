@echo off

del BubbleSort.lst
del BubbleSort.obj
del BubbleSort.ilk
del BubbleSort.pdb
del BubbleSort.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   BubbleSort.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:BubbleSort.exe BubbleSort.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR BubbleSort.*

:terminate

MOVE /Y BubbleSort.obj .\all_lib\obj
COPY /Y BubbleSort.asm .\all_lib\proc_asm

pause
endlocal