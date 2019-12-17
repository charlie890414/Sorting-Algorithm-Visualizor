INCLUDE irvine32.inc
.data
.code
RandomGenerator PROC,
    array: PTR DWORD,
    leng: DWORD
pushad
mov ecx,leng-1
.WHILE ecx>=0
    dec ecx
    call Randomize
    mov eax,ecx
    inc eax
    call RandomRange
    mov ebx, array[ecx]
    mov edx, array[eax]
    mov array[ecx], edx
    mov array[eax], ebx
.ENDW
popad
ret
RandomGenerator ENDP
end