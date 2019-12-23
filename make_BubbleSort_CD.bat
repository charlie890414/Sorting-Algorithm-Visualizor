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

DIR BubbleSort.*

:terminate

MOVE /Y BubbleSort.obj .\all_lib\obj
COPY /Y BubbleSort.asm .\all_lib\proc_asm

endlocal