INCLUDE library54.inc

.data
consoleHandle    DWORD ?
xyPos COORD <5, 15>

data DWORD 50 dup(?)

main EQU start@0

.code
main PROC
	;INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE					; mov eax, handle 
	;INVOKE setConsoleCursorPosition, consoleHandle, xyPos	; mov cursor to xyPos
	;call ClrScr											; clear console
	
	
	INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE
	mov consoleHandle,eax
	
	;initaialize data
	mov ecx, 50
	lea esi, data
	L1:
		mov [esi], ecx
		add esi, TYPE DWORD
	Loop L1



	lea edx, data
	INVOKE printblock, edx, 50, xyPos, consoleHandle
	



	mov xyPos.x, 70
	mov xyPos.y, 24
	INVOKE setConsoleCursorPosition, consoleHandle, xyPos
	call WaitMsg

	exit
main ENDP

END main
