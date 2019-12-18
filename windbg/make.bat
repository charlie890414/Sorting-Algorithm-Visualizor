@echo off

REM 以下五行替換成.asm檔的檔名
del NumbersArrayInitialize.lst
del NumbersArrayInitialize.obj
del NumbersArrayInitialize.ilk
del NumbersArrayInitialize.pdb
del NumbersArrayInitialize.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=./
set LIB=./
set PATH=./

ML /c /coff /Zi   NumbersArrayInitialize.asm
if errorlevel 1 goto terminate

DIR NumbersArrayInitialize.*

:terminate

MOVE /Y NumbersArrayInitialize.obj ..\all_lib\obj
COPY /Y NumbersArrayInitialize.asm ..\all_lib\proc_asm

pause
endlocal
