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
mov [esi], ecx
add esi, TYPE DWORD
Loop L1
popad
ret
NumbersArrayInitialize ENDP
end