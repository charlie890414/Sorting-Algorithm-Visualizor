INCLUDE irvine32.inc

.data



.code
ClrRect PROC,
	beginX: WORD, beginY: WORD, endX: WORD, endY: WORD, def: BYTE, consolehandle: DWORD
	Local cur_pos: COORD

pushad
	

	
	;initialize cur_pos
	mov ax, beginX
	mov cur_pos.x, ax
	mov ax, beginY
	mov cur_pos.y, ax


	;set L1 counter
	xor ecx, ecx
	mov cx, endY
	sub cx, beginY
	inc cx

	mov al, def

	L1:
		push ecx

		INVOKE setConsoleCursorPosition, consolehandle, cur_pos

		mov al, def
		
		;set L2 counter
		xor ecx, ecx
		mov cx, endX
		sub cx, beginX
		inc cx

		L2:
			
			call WriteChar

		DEC ECX
		JNE L2

		inc cur_pos.y

		pop ecx
	DEC ECX
	JNE L1


popad

ret

ClrRect ENDP

end