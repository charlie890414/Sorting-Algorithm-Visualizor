@echo off

del printBlockDemo.lst
del printBlockDemo.obj
del printBlockDemo.ilk
del printBlockDemo.pdb
del printBlockDemo.exe

setlocal 
set INCLUDE=./
set LIB=./
set PATH=./

.\all_lib\ML /c /coff /Zi   printBlockDemo.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:printBlockDemo.exe printBlockDemo.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR printBlockDemo.*

:terminate
pause
endlocal