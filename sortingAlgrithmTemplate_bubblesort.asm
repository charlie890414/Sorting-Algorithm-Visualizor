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
	
	INVOKE setCursorVisible, consoleHandle, 0
	

	call ClrScr

	;initaialize data
	mov ecx, 50
	lea esi, data
	L1:
		mov [esi], ecx
		add esi, TYPE DWORD
	Loop L1

	lea edx, data
	mov esi, OFFSET data
	
	INVOKE RandomGenerator, esi, 50

	INVOKE printblock, edx, 50, xyPos, consoleHandle
	
	mov ecx, 49
	L2:
		push ecx
		xor ebx, ebx
		.While ebx<ecx
			lea esi, data
			shl ebx, 2
			add esi, ebx
			shr ebx, 2
			mov edx, [esi]
			cmp edx, [esi+4]
			jna NO_SWAP
			mov eax, [esi]
			mov edx, [esi+4]
			mov [esi], edx
			mov [esi+4], eax
			
			
			mov xyPos.x, 5
			add xyPos.x, bx
			add xyPos.x, bx
			add xyPos.x, bx

			push bx
			mov bx, xyPos.x
			add bx, 2
			INVOKE ClrRect, xyPos.x, 8, bx, 16, ' ', consoleHandle
			pop bx

			INVOKE printblock, esi, 1, xyPos, consoleHandle
			
			add xyPos.x, 3
			add esi, 4
			
			push bx
			mov bx, xyPos.x
			add bx, 2
			INVOKE ClrRect, xyPos.x, 8, bx, 16, ' ', consoleHandle
			pop bx

			INVOKE printblock, esi, 1, xyPos, consoleHandle
		NO_SWAP:
			inc ebx
			mov eax, 20
			call Delay
		.EndW

		pop ecx
	DEC ECX
	JNE L2





	mov xyPos.x, 70
	mov xyPos.y, 24
	INVOKE setConsoleCursorPosition, consoleHandle, xyPos
	call WaitMsg

	exit
main ENDP

END main
