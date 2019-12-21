INCLUDE library54.inc

.data

arrow BYTE "→", 0
spacing BYTE "  ", 0

.code
ArrowMove PROC, basicPos: COORD, PreIndex: DWORD, CurIndex: DWORD, highlight: WORD, consoleHandle: DWORD
    Local CurPos: COORD
pushad 

    mov ax, basicPos.x
    mov CurPos.x, ax
    mov ax, basicPos.y
    mov CurPos.y, ax
    dec CurPos.y
    mov eax, PreIndex
    add CurPos.y, ax

    INVOKE setConsoleCursorPosition, consoleHandle, CurPos
	
    lea edx, spacing
    call WriteString

    INVOKE setRectAttribute, CurPos.x, CurPos.y, 169, CurPos.y, 7, consoleHandle


    mov eax, PreIndex
    sub CurPos.y, ax
    mov eax, CurIndex
    add CurPos.y, ax

    INVOKE setConsoleCursorPosition, consoleHandle, CurPos
	
    lea edx, arrow
    call WriteString

    INVOKE setRectAttribute, CurPos.x, CurPos.y, 169, CurPos.y, highlight, consoleHandle


popad
ret
ArrowMove ENDP
end