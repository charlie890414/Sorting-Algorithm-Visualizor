INCLUDE irvine32.inc

.data
.code
NumbersArrayInitialize PROC,
    array: PTR DWORD,
    leng: DWORD
pushad
mov ecx, leng
lea esi, array
L1:
mov ebx, leng
sub ebx, ecx
inc ebx
mov [esi], ebx
add esi, TYPE DWORD
Loop L1
popad
ret
NumbersArrayInitialize ENDP
end