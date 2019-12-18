INCLUDE irvine32.inc

.data

.code
setCursorVisible proc, 
	consoleHandle: DWORD, visible: DWORD
	Local csr: CONSOLE_CURSOR_INFO

pushad
	
	INVOKE GetConsoleCursorInfo, consoleHandle, ADDR csr
	mov csr.bVisible, 0
	INVOKE SetConsoleCursorInfo, consoleHandle, ADDR csr
	
popad

ret
setCursorVisible ENDP
end