INCLUDE library54.inc
NumbersLength=10
.data
consoleHandle    DWORD ?
xyPos COORD <5, 15>
text BYTE "abcdefg",0
data DWORD NumbersLength dup(?)

main EQU start@0

.code
main PROC
	;INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE					; mov eax, handle 
	;INVOKE setConsoleCursorPosition, consoleHandle, xyPos	; mov cursor to xyPos
	;call ClrScr											; clear console
	
	
	INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE
	mov consoleHandle,eax
	;call ClrScr
	
	;initaialize data
	mov ecx, NumbersLength
	lea esi, data
	L1:
		mov [esi], ecx
		add esi, TYPE DWORD
	Loop L1

	lea edx, data

	INVOKE RandomGenerator, edx, NumbersLength

	INVOKE printblock, edx, NumbersLength, xyPos, consoleHandle
	



	mov xyPos.x, 40
	mov xyPos.y, 20
	INVOKE setConsoleCursorPosition, consoleHandle, xyPos
	INVOKE printCodeLine, OFFSET text, xyPos, consoleHandle
	call WaitMsg


	exit
main ENDP

END main
