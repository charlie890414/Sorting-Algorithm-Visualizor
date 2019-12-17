INCLUDE irvine32.inc
.data
.code
RandomGenerator PROC,
    array: PTR DWORD,
    leng: DWORD
pushad
mov ecx,leng
dec ecx
mov esi, array
.WHILE ecx>0
    dec ecx
    push ecx
    call Randomize
    mov eax,ecx
    inc eax
    call RandomRange
    shl ecx, 2
    shl eax, 2
    mov ebx, [esi + ecx]
    mov edx, [esi + eax]
    mov [esi + ecx], edx
    mov [esi + eax], ebx
    pop ecx
.ENDW
popad
ret
RandomGenerator ENDP
end