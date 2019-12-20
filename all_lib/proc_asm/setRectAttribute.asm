INCLUDE irvine32.inc

.data

.code
setRectAttribute PROC, 
	beginX: WORD, beginY: WORD, endX: WORD, endY: WORD, def: WORD, consoleHandle: DWORD
	Local retnum: DWORD
	Local curPos: COORD

pushad


	mov ax, beginY
	mov curPos.y, ax
	
	xor ecx, ecx
	mov cx, endY
	sub cx, beginY
	inc cx
	L1:
		push ecx

		mov ax, beginX
		mov curPos.x, ax
		xor ecx, ecx
		mov cx, endX
		sub cx, beginX
		inc cx
		
		L2:
			push ecx

			INVOKE WriteConsoleOutputAttribute, 
				consoleHandle,
				ADDR def,
				1,
				curPos,
				ADDR retnum

			inc curPos.x
			pop ecx
		DEC ECX
		JNE L2

		inc curPos.y
		pop ecx
	DEC ECX
	JNE L1

popad
ret

setRectAttribute ENDP
end