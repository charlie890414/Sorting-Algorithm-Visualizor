@echo off

REM 以下五行替換成.asm檔的檔名
del RandomGenerator.lst
del RandomGenerator.obj
del RandomGenerator.ilk
del RandomGenerator.pdb
del RandomGenerator.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=./
set LIB=./
set PATH=./

ML /c /coff /Zi   RandomGenerator.asm
if errorlevel 1 goto terminate

DIR RandomGenerator.*

:terminate

MOVE /Y RandomGenerator.obj ..\all_lib\obj
COPY /Y RandomGenerator.asm ..\all_lib\proc_asm

pause
endlocal
