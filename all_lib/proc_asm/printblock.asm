INCLUDE irvine32.inc

.data

block BYTE "▁", 0, "▂", 0, "▃", 0, "▄", 0, "▅", 0, "▆", 0, "▇", 0, "█", 0
fullblock BYTE "█", 0


.code
printblock PROC,
	b_pos: DWORD, leng: DWORD, basic_pos: COORD, HDL: DWORD
	 					; b_pos <= x <= e_pos, print all x by block
	Local cur_pos: COORD

pushad
	
	
	
	mov ax, basic_pos.x
	mov cur_pos.x, ax

	mov ax, basic_pos.y
	inc ax
	mov cur_pos.y, ax

	mov ecx, leng
	mov esi, b_pos

	
	;print number
	L1:
		push ecx
		push esi
		INVOKE setConsoleCursorPosition, HDL, cur_pos
		pop esi
		pop ecx

		mov eax, [esi]
		call writeDec
		add esi, TYPE DWORD
		mov ax, cur_pos.x
		add ax, 3
		mov cur_pos.x, ax
	DEC ECX
	JNE L1
	

	;print block
	mov ecx, leng
	mov esi, b_pos
	
	mov ax, basic_pos.x
	mov cur_pos.x, ax
	mov ax, basic_pos.y
	mov cur_pos.y, ax


	L2:
		push ecx

		;print [esi]/8's full blocks
		
		mov ecx, [esi]
		shr ecx, 3
		cmp ecx, 0
		je NL3

		L3:
			push ecx

			
			INVOKE setConsoleCursorPosition, HDL, cur_pos
			lea edx, fullblock
			call WriteString

			dec cur_pos.y

			pop ecx
		DEC ECX
		JNE L3
		
		NL3:
		;print [esi]%8 part of block
		
		push esi
		INVOKE setConsoleCursorPosition, HDL, cur_pos
		pop esi

		lea edx, block
		mov ebx, [esi]
		and ebx, 7
		shl ebx, 2
		add edx, ebx
		call WriteString

		add esi, TYPE DWORD

		mov ax, basic_pos.y
		mov cur_pos.y, ax
		add cur_pos.x, 3

		pop ecx
	DEC ECX
	JNE L2

popad

ret

printblock ENDP

end