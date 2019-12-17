@echo off

REM 以下五行替換成.asm檔的檔名
del RandomGenerator.lst
del RandomGenerator.obj
del RandomGenerator.ilk
del RandomGenerator.pdb
del RandomGenerator.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=D:\User\Desktop\1081\組語\windbg
set LIB=D:\User\Desktop\1081\組語\windbg;
set PATH=D:\User\Desktop\1081\組語\windbg;

ML /c /coff /Zi   RandomGenerator.asm
if errorlevel 1 goto terminate

LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:RandomGenerator.exe RandomGenerator.obj Kernel32.lib irvine32.lib user32.lib
if errorlevel 1 goto terminate

DIR RandomGenerator.*

:terminate

MOVE /Y RandomGenerator.obj ..\all_lib\obj

pause
endlocal