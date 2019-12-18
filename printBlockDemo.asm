INCLUDE library54.inc

.data
consoleHandle    DWORD ?
xyPos COORD <5, 15>
text BYTE "abcdefg",0
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
	mov ecx, 20
	lea esi, data
	L1:
		mov [esi], ecx
		add esi, TYPE DWORD
	Loop L1

	lea edx, data

	INVOKE RandomGenerator, edx, 20

	INVOKE printblock, edx, 20, xyPos, consoleHandle
	



	mov xyPos.x, 40
	mov xyPos.y, 20
	INVOKE setConsoleCursorPosition, consoleHandle, xyPos
	INVOKE printCodeLine, OFFSET text, xyPos, consoleHandle
	call WaitMsg


	exit
main ENDP

END main
