INCLUDE library54.inc

.data
consoleHandle    DWORD ?
curPos COORD <5, 15>

block BYTE "▁", 0, "▂", 0, "▃", 0, "▄", 0, "▅", 0, "▆", 0, "▇", 0, "█", 0
fullblock BYTE "█", 0



main EQU start@0

.code
main PROC
	;INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE					; mov eax, handle 
	;INVOKE setConsoleCursorPosition, consoleHandle, xyPos	; mov cursor to xyPos
	;call ClrScr											; clear console
	
	
	INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE
	mov consoleHandle,eax
	INVOKE setConsoleCursorPosition, consoleHandle, curPos
	
	Comment !
	lea edx, fullblock
	call writeString
	call Crlf
	call WaitMsg
	!
		
			
	call ClrScr
	mov ecx, 7

	L1:
		push ecx

		lea esi, block
		mov ebx, 7
		sub ebx, ecx
		mov ecx, 8
		L2:
			push ecx

			
			mov ecx, ebx
			cmp ecx, 0
			je N_L3
			lea edx, fullblock
			L3:
				
				push ecx
				push edx
				INVOKE setConsoleCursorPosition, consoleHandle, curPos
				pop edx
				pop ecx
	
				call writeString
				dec curPos.y

				
			DEC ECX
			JNE L3
			N_L3:

			push ecx
			INVOKE setConsoleCursorPosition, consoleHandle, curPos
			pop ecx
			
			mov edx, esi
			call writeString
			add esi, 4

			mov curPos.y, 15
			add curPos.x, 2
			



			pop ecx
		DEC ECX
		JNE L2
		
		pop ecx
	DEC ECX
	JNE L1
	
	mov curPos.x, 5
	mov curPos.y, 16
	mov eax, 1
	mov ecx, 56
	L4:
			
		
		pushad
		INVOKE setConsoleCursorPosition, consoleHandle, curPos
		popad
		call WriteDec
		
		add curPos.x, 2
		
		mov ebx, eax
		and bl, 1

		je QQ
		inc curPos.y
		jmp KK
		QQ:
		dec curPos.y
		KK:
		inc eax
	Loop L4

	mov curPos.x, 0
	mov curPos.y, 19
	pushad
	INVOKE setConsoleCursorPosition, consoleHandle, curPos
	popad
	
	call WaitMsg

	exit
main ENDP

END main
