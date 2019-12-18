INCLUDE irvine32.inc

.data

.code
Index_to_Coord PROC, 
	basicPos: COORD, def: WORD, index: DWORD
pushad
	
	mov eax, 2
	add ax, def
	mul index
	add basicPos.x, ax

popad

	mov ax, basicPos.x
	shl eax, 16
	add ax, basicPos.y

ret

Index_to_Coord ENDP
end