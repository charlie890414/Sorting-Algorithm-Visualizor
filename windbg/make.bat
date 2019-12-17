@echo off

REM 以下五行替換成.asm檔的檔名
del printblock.lst
del printblock.obj
del printblock.ilk
del printblock.pdb
del printblock.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=D:\User\Desktop\1081\組語\windbg
set LIB=D:\User\Desktop\1081\組語\windbg;
set PATH=D:\User\Desktop\1081\組語\windbg;

ML /c /coff /Zi   printblock.asm
if errorlevel 1 goto terminate

LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:printblock.exe printblock.obj Kernel32.lib irvine32.lib user32.lib
if errorlevel 1 goto terminate

DIR printblock.*

:terminate

MOVE /Y printblock.obj ..\all_lib\obj

pause
endlocal