@echo off

REM 以下五行替換成.asm檔的檔名
del printCodeLine.lst
del printCodeLine.obj
del printCodeLine.ilk
del printCodeLine.pdb
del printCodeLine.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=./
set LIB=./
set PATH=./

ML /c /coff /Zi   printCodeLine.asm
if errorlevel 1 goto terminate

DIR printCodeLine.*

:terminate

MOVE /Y printCodeLine.obj ..\all_lib\obj
COPY /Y printCodeLine.asm ..\all_lib\proc_asm

pause
endlocal
