@echo off

del finalMain.lst
del finalMain.obj
del finalMain.ilk
del finalMain.pdb
del finalMain.exe

setlocal 
set INCLUDE=D:\User\Desktop\1081\組語\final_project
set LIB=D:\User\Desktop\1081\組語\final_project
set PATH=D:\User\Desktop\1081\組語\final_project

.\all_lib\ML /c /coff /Zi   finalMain.asm
if errorlevel 1 goto terminate

.\all_lib\LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:finalMain.exe finalMain.obj .\all_lib\obj\*.obj .\all_lib\Irvine32.lib .\all_lib\Kernel32.lib .\all_lib\user32.lib
if errorlevel 1 goto terminate

DIR finalMain.*

:terminate
pause
endlocal