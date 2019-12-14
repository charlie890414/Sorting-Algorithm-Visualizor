@echo off

REM 以下五行替換成.asm檔的檔名
del sampleproc.lst
del sampleproc.obj
del sampleproc.ilk
del sampleproc.pdb
del sampleproc.exe

setlocal 

REM 以下三行設成windbg的路徑
set INCLUDE=D:\User\Desktop\1081\組語\windbg
set LIB=D:\User\Desktop\1081\組語\windbg;
set PATH=D:\User\Desktop\1081\組語\windbg;

ML /c /coff /Zi   sampleproc.asm
if errorlevel 1 goto terminate

LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:sampleproc.exe sampleproc.obj Kernel32.lib irvine32.lib user32.lib
if errorlevel 1 goto terminate

DIR sampleproc.*

:terminate
pause
endlocal