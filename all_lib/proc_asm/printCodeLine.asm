INCLUDE irvine32.inc
.data
.code
printCodeLine PROC,
	array: PTR DWORD,    
    basic_pos: COORD,  
    HDL: DWORD
	Local cur_pos: COORD
pushad
mov ax, basic_pos.x
mov cur_pos.x, ax
mov ax, basic_pos.y
mov cur_pos.y, ax
push ecx
push esi
INVOKE setConsoleCursorPosition, HDL, cur_pos
pop esi
pop ecx
mov edx, array
call writeString

popad
ret
printCodeLine ENDP
end