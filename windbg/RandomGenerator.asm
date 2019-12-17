INCLUDE irvine32.inc
.code
RandomGenerator PROC,
    array: PTR DWORD,
    length: DWORD
pushad
mov ecx,length-1
.WHILE ecx>=0
    dec ecx
    call Randomize
    mov eax,ecx+1
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